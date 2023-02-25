package com.homion.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.homion.model.Address;
import com.homion.model.Area;
import com.homion.model.Category;
import com.homion.model.Chef;
import com.homion.model.Login;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.Product;
import com.homion.model.SubCategory;
import com.homion.service.ChefService;
import com.homion.service.GeneralService;
import com.homion.utils.BaseMethods;

@Controller
@RequestMapping(value = "/chef")
public class ChefController {
	
	@Autowired
	private GeneralService generalService;
	
	@Autowired
	private ChefService chefService;
	
	@Autowired
    private JavaMailSender emailSender;
	
	@Autowired
    private HttpSession httpSession;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	private ModelAndView register() {
		return new ModelAndView("chef/register", "chef", new Chef());
	}
	
	@RequestMapping(value = "/verification", method = RequestMethod.POST)
	private ModelAndView verification(@ModelAttribute Chef chef, HttpSession httpSession) throws Exception {
		int otp = BaseMethods.sendVerificationMail(chef.getLogin().getEmail(), chef.getFirstName(), emailSender);
		httpSession.setAttribute("otp", otp);
		httpSession.setAttribute("chef", chef);
		return new ModelAndView("chef/verification");
	}
	
	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	private ModelAndView verify(@RequestParam int otp, HttpSession httpSession) {
		int originalOTP = (Integer)httpSession.getAttribute("otp");
		if (originalOTP == otp) {
			httpSession.removeAttribute("otp");
			return new ModelAndView("redirect:/chef/addAddress");
		}
		else
			return new ModelAndView("chef/verification").addObject("invalidOTP", true);
	}
	
	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	private ModelAndView addAddress() {
		@SuppressWarnings("unchecked")
		List<Area> areas = generalService.getAllRows("Area");
		return new ModelAndView("/chef/addAddress", "address", new Address()).addObject("areas", areas);
	}
	
	@RequestMapping(value = "/saveAddress", method = RequestMethod.POST)
	private ModelAndView saveAddress(@ModelAttribute Address address, @RequestParam String hiddenArea, HttpSession httpSession) throws Exception {
		long lastValue = Long.parseLong(generalService.getLastSequenceValue("chef_sequence"))+1;
		Chef chef = (Chef)httpSession.getAttribute("chef");
		generalService.save(chef.getLogin());
		generalService.save(chef);
		httpSession.removeAttribute("chef");
		address.setOwnerId(lastValue);
		address.setArea(hiddenArea);
		generalService.save(address);
		BaseMethods.sendChefRegistrationMail(chef.getLogin().getEmail(), chef.getFirstName(), emailSender);
		return new ModelAndView("redirect:/chef/login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	private ModelAndView login() {
		return new ModelAndView("chef/login", "login", new Login());
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private ModelAndView logout() {
		httpSession.removeAttribute("chef");
		return new ModelAndView("redirect:/chef/login");
	}
	
	@RequestMapping(value = "/verifyCredentials", method = RequestMethod.POST)
	private ModelAndView verifyCredentials(@ModelAttribute Login login, HttpSession httpSession) {
		Object object = generalService.verifyCredentials(login);
		if (object == null)
			return new ModelAndView("redirect:/chef/login").addObject("wrongCredentials", true);
		else if(((Chef)object).getStatus().equals("Requested"))
			return new ModelAndView("redirect:/chef/login").addObject("chefRequested", true);
		else {
			httpSession.setAttribute("chef", (Chef)object);
			return new ModelAndView("redirect:/chef/home");
		}
	}
	
	@RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
	private ModelAndView saveChanges(@ModelAttribute Chef chef, @RequestParam String startTime, @RequestParam String endTime, @RequestParam MultipartFile file, HttpSession httpSession) throws Exception{
		chef.setStartTime(startTime);
		chef.setEndTime(endTime);
		if(!file.isEmpty()) {
			String imgURL = BaseMethods.uploadImage(file, "chef", ""+chef.getId());
			chef.setImage(imgURL);
		}
		generalService.save(chef.getLogin());
		generalService.save(chef);
		httpSession.setAttribute("chef", chef);
		return new ModelAndView("redirect:/chef/profile");
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	  private ModelAndView home(HttpSession httpSession) {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
	    Chef chef = (Chef) httpSession.getAttribute("chef");
	    List<Order> newOrders = chefService.getOrdersByChef("new",chef.getId());
	    List<Order> ongoingOrders = chefService.getOrdersByChef("ongoing",chef.getId());
	    List<Order> rejectedOrders = chefService.getOrdersByChef("rejected",chef.getId());
	    List<Order> preparedOrders = chefService.getOrdersByChef("ready",chef.getId());
	      return new ModelAndView("chef/home").addObject("newOrders",newOrders)
	                        .addObject("ongoingOrders",ongoingOrders)
	                        .addObject("rejectedOrders", rejectedOrders)
	                        .addObject("preparedOrders", preparedOrders);
	  }
	  
	  @RequestMapping(value = "/countItems", method = RequestMethod.GET)
	  private ResponseEntity<Object> countItems(@RequestParam long orderId, HttpStatus httpStatus) {
	    List<OrderItem> orderItems = chefService.getOrderItems(orderId);
	    int count=0;
	    for(OrderItem o:orderItems) {
	      count += o.getCount();
	    }
	    return new ResponseEntity<Object>(count,httpStatus.OK);
	  }
	  
	  @RequestMapping(value = "/getItems", method = RequestMethod.GET)
	  private ResponseEntity<Object> getItems(@RequestParam long orderId, HttpStatus httpStatus, HttpSession session) {
	    List<OrderItem> orderItems = chefService.getOrderItems(orderId);
	    session.setAttribute("orderItems", orderItems);
	    return null;    
	  }
	  
	  @RequestMapping(value = "/acceptOrder", method = RequestMethod.GET)
	  private ModelAndView acceptOrder(@RequestParam long orderId){
	    chefService.changeOrderStatus("ongoing", orderId);
	    return new ModelAndView("redirect:/chef/home");
	  }
	  
	  @RequestMapping(value = "/rejectOrder", method = RequestMethod.GET)
	  private ModelAndView rejectOrder(@RequestParam long orderId){
	    chefService.changeOrderStatus("rejected", orderId);
	    return new ModelAndView("redirect:/chef/home");
	  }
	  
	  @RequestMapping(value = "/markReady", method = RequestMethod.GET)
	  private ModelAndView markReady(@RequestParam long orderId){
	    chefService.changeOrderStatus("ready", orderId);
	    return new ModelAndView("redirect:/chef/home");
	  }
	  
	  @RequestMapping(value = "/markAsDelivered", method = RequestMethod.GET)
	  private ModelAndView markAsDelivered(@RequestParam long orderId, @RequestParam String flag){
	    chefService.changeOrderStatus("delivered", orderId);
	    if(flag.equals("home"))
	      return new ModelAndView("redirect:/chef/home");
	    else
	      return new ModelAndView("redirect:/chef/pastOrders");
	  }
	  
	  @RequestMapping(value = "/pastOrders", method = RequestMethod.GET)
	  private ModelAndView pastOrders(HttpSession session) {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		  
	    Chef chef = (Chef) session.getAttribute("chef");
	    List<Order> pastCompletedOrders = chefService.getOrdersByChef("delivered",chef.getId());
	    List<Order> pastOngoingOrders = chefService.getOrdersByChef("ongoing",chef.getId());
	    List<Order> pastCancelledOrders = chefService.getOrdersByChef("rejected",chef.getId());
	    return new ModelAndView("chef/pastOrders").addObject("pastCompletedOrders",pastCompletedOrders)
	                          .addObject("pastOngoingOrders", pastOngoingOrders)
	                          .addObject("pastCancelledOrders", pastCancelledOrders);
	  }
	  
	  @RequestMapping(value = "/getOrderItemsList", method = RequestMethod.GET)
	  private ResponseEntity<Object> getOrderItemsList(@RequestParam long orderId, HttpStatus httpStatus) {
	    List<OrderItem> orderItemsList = chefService.getOrderItems(orderId);
	    return new ResponseEntity<Object>(orderItemsList,httpStatus.OK);   
	  }
	  
	  @RequestMapping(value = "/invoice", method = RequestMethod.GET)
	  private ModelAndView invoice(@RequestParam long orderId, HttpSession session) {
	    Order order = (Order) generalService.getObjectById("Order",orderId);
	    List<OrderItem> orderItemsList = chefService.getOrderItems(orderId);
	    Chef chef = (Chef) session.getAttribute("chef");
	    Address chefAddress = (Address) generalService.getAddress(chef.getId()).get(0);
	    return new ModelAndView("chef/invoice").addObject("orderItemsList",orderItemsList)
	                         .addObject("order",order)
	                         .addObject("chefAddress", chefAddress);
	  }
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/chefMenu", method = RequestMethod.GET)
	private ModelAndView menu(HttpSession session) {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
		Chef chef = (Chef)session.getAttribute("chef");
		List<Object> category = this.generalService.getAllRows("Category");
		List<Product> products = (List<Product>)this.generalService.getAllRows("Product",chef.getId());
		List<Product> specialProducts = new ArrayList<Product>();
			for (Iterator<Product> iter = products.listIterator(); iter.hasNext(); ) {
			    Product prod = iter.next();
			    if (prod.isSpeciality()) {
			        specialProducts.add(prod);
			    	iter.remove();
			    }
			}
		return new ModelAndView("chef/chefMenu","Category",category).addObject("regularProducts",products).addObject("specialProducts", specialProducts);
	}
	
	@RequestMapping(value = "alterProductStatus", method = RequestMethod.GET)
	private ModelAndView alterProductStatus(@RequestParam long id, @RequestParam String status) {
		Product product = (Product)this.generalService.getObjectById("Product", id);
		product.setId(id);
		if(status.equals("available"))
			product.setStatus("available");
		else
			product.setStatus("out-of-stock");
		this.generalService.save(product);
		return new ModelAndView("redirect:/chef/chefMenu");
	}
	
	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	private ModelAndView customers() {
		return new ModelAndView("chef/customers");
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	private ModelAndView profile(HttpSession httpSession) {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
		Chef chef = (Chef)httpSession.getAttribute("chef");
		return new ModelAndView("chef/profile", "chef", chef);
	}
	
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	private ModelAndView terms() {
		return new ModelAndView("chef/terms");
	}
	
	@RequestMapping(value = "/business", method = RequestMethod.GET)
	private ModelAndView business() {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
		Chef chef = (Chef)httpSession.getAttribute("chef");
	    
	    Map<Long,Double> todaysRevenue = chefService.getRevenue("today", chef.getId());
	    Object todaysOrderCount = todaysRevenue.keySet().toArray()[0];
	    Double todaysTotalRevenue=todaysRevenue.get(todaysOrderCount);
	      
	    Map<Long,Double> yesterdaysRevenue = chefService.getRevenue("yesterday", chef.getId());
	    Object yesterdaysOrderCount = yesterdaysRevenue.keySet().toArray()[0];
	    Double yesterdaysTotalRevenue = yesterdaysRevenue.get(yesterdaysOrderCount);
	      
	    Map<Long,Double> weeksRevenue = chefService.getWeeksRevenue(chef.getId());
	    Object weeksOrderCount = weeksRevenue.keySet().toArray()[0];
	    Double weeksTotalRevenue = weeksRevenue.get(weeksOrderCount);
	      
	    Address address = generalService.getAddress(chef.getId()).get(0); 
	      
	    return new ModelAndView("chef/business").addObject("todaysOrderCount", todaysOrderCount)
	                        .addObject("todaysTotalRevenue", todaysTotalRevenue)
	                        .addObject("yesterdaysOrderCount", yesterdaysOrderCount)
	                        .addObject("yesterdaysTotalRevenue", yesterdaysTotalRevenue)
	                        .addObject("weeksOrderCount", weeksOrderCount)
	                        .addObject("weeksTotalRevenue", weeksTotalRevenue)
	                        .addObject("chefAddress",address);
	}
	
	@RequestMapping(value = "/businessHistory", method = RequestMethod.GET)
	  private ModelAndView businessHistory() {
	    Chef chef = (Chef)httpSession.getAttribute("chef");
	    Address address = generalService.getAddress(chef.getId()).get(0); 
	    List<Order> todaysOrders = chefService.getOrdersByTime("day", chef.getId());
	    List<Order> weeksOrders = chefService.getOrdersByTime("week", chef.getId());
	    List<Order> monthsOrders = chefService.getOrdersByTime("month", chef.getId());
	    return new ModelAndView("chef/businessHistory").addObject("todaysOrders", todaysOrders)
	                             .addObject("weeksOrders", weeksOrders)
	                             .addObject("monthsOrders", monthsOrders)
	                             .addObject("chefAddress",address);
	  }
	
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	private ModelAndView address(HttpSession httpSession) { 
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
	    Chef chef = (Chef)httpSession.getAttribute("chef");
	    List<Address> addr = this.generalService.getAddress(chef.getId()); 
	    //List<State> states = this.generalService.getState();
	    @SuppressWarnings("unchecked")
		List<Area> areas = generalService.getAllRows("Area");
	    if(addr.isEmpty())
	      return new ModelAndView("chef/address", "address", new Address());
	    Address address = (Address)addr.get(0);
	    return new ModelAndView("chef/address", "address", address).addObject("areas", areas);
	}
	
	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	private ModelAndView addAddress(@ModelAttribute Address address, @RequestParam String hiddenArea) {
		Chef chef = (Chef)httpSession.getAttribute("chef");
		address.setArea(hiddenArea);
		this.generalService.addAddress(address, chef.getId(), "Home");
		return new ModelAndView("redirect:/chef/address");
	}
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	private ModelAndView products(HttpSession httpSession) {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
		Chef chef = (Chef)httpSession.getAttribute("chef");
		@SuppressWarnings("rawtypes")
		List products = generalService.getAllRows("Product", chef.getId());
		return new ModelAndView("chef/products", "products", products);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	private ModelAndView addProduct(HttpSession httpSession) {
		if(httpSession.getAttribute("chef") == null)
			return new ModelAndView("redirect:/chef/login").addObject("sessionExpired", true);
		
		List<Category> categories = generalService.getAllRows("Category");
		List<SubCategory> subCategories = generalService.getAllRows("SubCategory");
		return new ModelAndView("chef/addProduct", "product", new Product()).addObject("categories", categories).addObject("subCategories", subCategories);
	}
	
	@RequestMapping(value = "/editProduct", method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	private ModelAndView editProduct(@RequestParam long id) {
		Product product = (Product)generalService.getObjectById("Product", id);
		List<Category> categories = generalService.getAllRows("Category");
		List<SubCategory> subCategories = generalService.getAllRows("SubCategory");
		return new ModelAndView("chef/addProduct", "product", product).addObject("categories", categories).addObject("subCategories", subCategories);
	}
	
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	private ModelAndView deleteProduct(@RequestParam long id) {
		Product product = (Product)generalService.getObjectById("Product", id);
		product.setStatus("deleted");
		generalService.save(product);
		return new ModelAndView("redirect:/chef/products");
	}
	
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	private ModelAndView saveProduct(@ModelAttribute Product product, @RequestParam MultipartFile file) throws Exception {
		String imgURL;
		if(!file.isEmpty() && product.getId() == 0) {
			String lastValue = Integer.parseInt(generalService.getLastSequenceValue("product_sequence"))+1+"";
			imgURL = BaseMethods.uploadImage(file, "product", lastValue);
			product.setImage(imgURL);
		}
		else if(!file.isEmpty()){
			imgURL = BaseMethods.uploadImage(file, "product", ""+product.getId());
			product.setImage(imgURL);
		}
		Chef chef = (Chef)httpSession.getAttribute("chef");
		product.setChef(chef);
		generalService.save(product);
		return new ModelAndView("redirect:/chef/products");
	}
	
/******************************************** Forgot Password ******************************************/
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	  private ModelAndView forgotPassword() {
	    return new ModelAndView("chef/forgot-password");
	  }
	  
	  @RequestMapping(value = "/verifyOTP", method = RequestMethod.POST)
	  private ModelAndView sendOTP(@RequestParam String email, HttpSession httpSession) throws Exception {
	    Login login = (Login)this.generalService.findByEmail(email);
	    if(login != null && login.getType().equals("Chef")) {
	      int otp = BaseMethods.sendMailForPasswordReset(email, email, emailSender);
	      httpSession.setAttribute("otp", otp);
	      httpSession.setAttribute("email", email);
	      return new ModelAndView("chef/verificationForPassword");
	    }
	    else {
	      return new ModelAndView("redirect:/chef/forgotPassword").addObject("invalidEmail", true);
	    }
	  }
	  
	  @RequestMapping(value = "/verifyOtpForPassword", method = RequestMethod.POST)
	  private ModelAndView verifyOtpForPassword(@RequestParam int otp, HttpSession httpSession) {
	    int originalOTP = (Integer)httpSession.getAttribute("otp");
	    Login login = (Login) this.generalService.findByEmail((String) httpSession.getAttribute("email"));
	    if (originalOTP == otp) {
	      httpSession.removeAttribute("otp");
	      httpSession.setAttribute("login",login);
	      return new ModelAndView("chef/reset-password");
	    }
	    else
	      return new ModelAndView("chef/verificationForPassword").addObject("invalidOTP", true);
	  }
	  
	  @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	  private ModelAndView resetPassword(@RequestParam String password, @RequestParam String confirmPassword, HttpSession httpSession) {
	    if(password.equals(confirmPassword)) {
	      Login login = (Login) httpSession.getAttribute("login");
	      login.setPassword(password);
	      this.generalService.save(login);
	      return new ModelAndView("redirect:/chef/login");
	    }
	    else {
	      return new ModelAndView("chef/reset-password").addObject("notMatch", true);
	    }
	  }
	
}
