package com.homion.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homion.model.Address;
import com.homion.model.Area;
import com.homion.model.Chef;
import com.homion.model.Favourite;
import com.homion.model.Feedback;
import com.homion.model.Login;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.Product;
import com.homion.model.User;
import com.homion.service.GeneralService;
import com.homion.service.UserService;
import com.homion.utils.BaseMethods;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	private GeneralService generalService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
    private JavaMailSender emailSender;
	
	@Autowired
	private HttpSession httpSession;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	private ModelAndView signUp() {
		return new ModelAndView("user/register", "user", new User());
	}
	
	@RequestMapping(value = "/verification", method = RequestMethod.POST)
	private ModelAndView verification(@ModelAttribute User user, HttpSession httpSession) throws Exception {
		int otp = BaseMethods.sendVerificationMail(user.getLogin().getEmail(), user.getFirstName(), emailSender);
		httpSession.setAttribute("otp", otp);
		httpSession.setAttribute("user", user);
		return new ModelAndView("user/verification");
	}
	
	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	private ModelAndView verify(@RequestParam int otp, HttpSession httpSession) {
		int originalOTP = (Integer)httpSession.getAttribute("otp");
		User user = (User)httpSession.getAttribute("user");
		if (originalOTP == otp) {
			generalService.save(user.getLogin());
			generalService.save(user);
			httpSession.removeAttribute("otp");
			httpSession.removeAttribute("chef");
			return new ModelAndView("redirect:/user/login");
		}
		else
			return new ModelAndView("redirect:/user/verification").addObject("invalidOTP", true);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	private ModelAndView login() {
		return new ModelAndView("user/login", "login", new Login());
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private ModelAndView logout() {
		httpSession.removeAttribute("user");
		return new ModelAndView("user/login", "login", new Login());
	}
	
	@RequestMapping(value = "/verifyCredentials", method = RequestMethod.POST)
	private ModelAndView verifyCredentials(@ModelAttribute Login login, HttpSession httpSession) {
		Object object = generalService.verifyCredentials(login);
		if (object == null)
			return new ModelAndView("redirect:/user/login").addObject("wrongCredentials", true);
		else {
			httpSession.setAttribute("user", (User)object);
			return new ModelAndView("redirect:/user/profile");
		}
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	private ModelAndView home(HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		User user = (User)httpSession.getAttribute("user");
		List<Address> addresses = generalService.getAddress(user.getId());
		Address homeAddress = null;
		for(Address address: addresses) {
			if(address.getType().equals("Home")) {
				homeAddress = address;
				break;
			}
		}
		List<Chef> chefs = userService.getChefsByPincode(homeAddress.getPincode());
		List<Product> trending = userService.getTrendingByPincode(homeAddress.getPincode());
		System.out.println(trending.size());
		List<Product> mostPopular = userService.getProductsByPincode(homeAddress.getPincode());
		if(mostPopular.size() > 8)
			mostPopular = mostPopular.subList(0, 7);
		return new ModelAndView("user/home", "chefs", chefs).addObject("addresses", addresses)
															.addObject("homeAddress", homeAddress)
															.addObject("mostPopular", mostPopular)
															.addObject("trending", trending);
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	private ModelAndView profile(HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		User user = (User)httpSession.getAttribute("user");
		return new ModelAndView("user/profile", "user", user);
	}
	
	@RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
	private ModelAndView saveChanges(@ModelAttribute User user) {
		generalService.save(user.getLogin());
		generalService.save(user);
		return new ModelAndView("redirect:/user/login");
	}

	@RequestMapping(value = "/address", method = RequestMethod.GET)
	private ModelAndView address(HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		User user = (User)httpSession.getAttribute("user");
		List<Address> addresses = this.generalService.getAddress(user.getId());
		@SuppressWarnings("unchecked")
		List<Area> areas = this.generalService.getAllRows("Area");
	    return new ModelAndView("user/address").addObject("address", new Address()).addObject("areas", areas).addObject("addresses", addresses);
	}
	
	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	private ModelAndView addAddress(@ModelAttribute Address address, @RequestParam String hiddenArea, HttpSession httpSession) {
	    User user = (User)httpSession.getAttribute("user");
	    address.setOwnerId(user.getId());
	    address.setArea(hiddenArea);
	    this.generalService.save(address);	
	    return new ModelAndView("redirect:/user/address");
	}
	
	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	private ModelAndView addToCart(@RequestBody Map<String, String> cart, HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		long userId = user.getId();
		Product product = new Product();
		for(Map.Entry<String, String> m: cart.entrySet()) {
			OrderItem temp = new OrderItem();
			product.setId(Long.parseLong(m.getKey()));
			temp.setProduct(product);
			temp.setCount(Integer.parseInt(m.getValue()));
			temp.setOrderId(userId);
			generalService.save(temp);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	private ModelAndView checkout(HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		User user = (User)httpSession.getAttribute("user");
		long userId = user.getId();
		List<OrderItem> cartItems = userService.getOrderItems(userId);
		long chefId = cartItems.get(0).getProduct().getChef().getId();
		Address chefAddress = (Address)generalService.getAddress(chefId).get(0);
		List<Address> addresses = userService.getAddressByPincode(userId, chefAddress.getPincode());
		Chef chef = (Chef)generalService.getObjectById("Chef", chefId);
		List<Area> areas = this.generalService.getAllRows("Area");
		return new ModelAndView("user/checkout").addObject("cartItems", cartItems)
												.addObject("chef", chef)
												.addObject("chefAddress", chefAddress)
												.addObject("addresses", addresses)
												.addObject("address", new Address())
												.addObject("areas", areas);
		
	}
	
	@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
	private ModelAndView placeOrder(@RequestParam long chefId, @RequestParam long addressId, @RequestParam float amount, HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		long userId = user.getId();
		Order order =  new Order();
		Address address = new Address(addressId);
		order.setAddress(address);
		Chef chef = new Chef(chefId);
		order.setChef(chef);
		order.setAmount(amount);
		order.setUser(user);
		generalService.save(order);
		long orderId = Long.parseLong(generalService.getLastSequenceValue("order_sequence"));
		userService.changeUserIdToOrderId(userId, orderId);
		return new ModelAndView("redirect:/user/successful");
	}
	
	@RequestMapping(value = "/contact-us", method = RequestMethod.GET)
	private ModelAndView contactUs() {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		return new ModelAndView("user/contact-us");
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	private ModelAndView faq() {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		return new ModelAndView("user/faq");
	}
	
	  @RequestMapping(value = "/favourites", method = RequestMethod.GET)
	  private ModelAndView favourites(HttpSession httpSession) {
		  if(httpSession.getAttribute("user") == null)
				return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		  
	    long userId = ((User)httpSession.getAttribute("user")).getId();
	    List<Product> favouriteProducts = this.userService.favourites("Product", "Product", userId);
	    List<Chef> favouriteChefs = this.userService.favourites("Chef", "Chef", userId);
	    return new ModelAndView("user/favourites").addObject("favouriteProducts", favouriteProducts).addObject("favouriteChefs", favouriteChefs);
	  }
	  
	  @RequestMapping(value = "/addFavourite", method = RequestMethod.POST)
	  private ResponseEntity<Object> addFavourite(@RequestParam long typeId, @RequestParam String type, @ModelAttribute Favourite favourite,
	      HttpSession httpSession) {
	    favourite.setType(type);
	    favourite.setTypeId(typeId);
	    User user = (User) httpSession.getAttribute("user");
	    favourite.setUser(user);
	    this.generalService.save(favourite);
	    return null;
	  }

	  @RequestMapping(value = "/removefavourite", method = RequestMethod.DELETE)
	  private ResponseEntity<Object> removefavourite(@RequestParam long typeId, @ModelAttribute Favourite favourite,
	      HttpSession httpSession) {
	    User user = (User) httpSession.getAttribute("user");
	    this.userService.removeFavourite(user.getId(), typeId);
	    return null;
	  }
	
	@RequestMapping(value = "/track", method = RequestMethod.GET)
	private ModelAndView map(@RequestParam long id) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		Order order = (Order)generalService.getObjectById("Order", id);
		Address address = generalService.getAddress(order.getChef().getId()).get(0);
		List<OrderItem> orderItems = userService.getOrderItems(id);
		return new ModelAndView("user/map").addObject("order", order).addObject("orderItems", orderItems).addObject("address", address);
	}
	
	@RequestMapping(value = "/my-orders", method = RequestMethod.GET)
	private ModelAndView myOrders(HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		User user = (User)httpSession.getAttribute("user");
		long userId = user.getId();
		List<Order> completedOrders = userService.getOrdersOfUser(userId, "completed");
		List<Order> canceledOrders = userService.getOrdersOfUser(userId, "canceled");
		List<Order> progressOrders = userService.getOrdersOfUser(userId, "progress");
		return new ModelAndView("user/my-orders").addObject("completedOrders", completedOrders)
												.addObject("canceledOrders", canceledOrders)
												.addObject("progressOrders", progressOrders);
	}
	
	@RequestMapping(value = "/orderDetails/{orderId}", method = RequestMethod.POST)
	private ModelAndView orderDetails(@PathVariable long orderId, HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		List<OrderItem> orderItems = userService.getOrderItems(orderId);
		httpSession.setAttribute("orderItems", orderItems);
		return null;
	}
	
	@RequestMapping(value = "/submitReview", method = RequestMethod.GET)
	private ModelAndView submitReview(@RequestParam long orderId, @RequestParam int chefRating, @RequestParam int foodRating, @RequestParam String comment) {
		Feedback feedback = new Feedback(foodRating, chefRating, comment);
		generalService.save(feedback);
		Order order = (Order)generalService.getObjectById("Order", orderId);
		order.getChef().setCount(order.getChef().getCount()+1);
		order.getChef().setRating((order.getChef().getRating() + chefRating) / 2);
		order.setFeedback(feedback);
		List<OrderItem> orderItems = userService.getOrderItems(orderId);
		for(OrderItem o: orderItems) {
			o.getProduct().setCount(o.getProduct().getCount()+1);
			o.getProduct().setRating((o.getProduct().getRating() + foodRating) / 2);
			generalService.save(o.getProduct());
		}
		generalService.save(order.getChef());
		generalService.save(order);
		return null;
	}
	
	@RequestMapping(value = "/reorder", method = RequestMethod.GET)
	private ModelAndView reorder(@RequestParam long orderId, HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		long userId = user.getId();
		List<OrderItem> orderItems = userService.getOrderItems(orderId);
		for(OrderItem o: orderItems) {
			o.setOrderId(userId);
			userService.save(o);
		}
		return null;
	}
	
	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	private ModelAndView privacy() {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		return new ModelAndView("user/privacy");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/chefDetails", method = RequestMethod.POST)
	private ModelAndView restaurant(@RequestParam long chefId) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		Chef chef = (Chef)generalService.getObjectById("Chef", chefId);
		Address address = (Address)generalService.getAddress(chefId).get(0);
		List<Product> products = generalService.getAllRows("Product", chefId);
		List<Feedback> feedbacks =  userService.getFeedbacksByChefId(chefId);
		
		HashSet<String> subCategories = new HashSet<String>();
		for(Product p: products)
			subCategories.add(p.getSubCategory().getName());
		
		Map<Long,Float> ratings = userService.getRatingById(chefId);
		float totalRating = ratings.get((long)0);
		ratings.remove((long)0);
		for(long i = 1; i < 6; i++) {
			ratings.put(i, (ratings.get(i)/totalRating)*100);
		}
		long userId = ((User)httpSession.getAttribute("user")).getId();
		boolean isFavourite = this.userService.isFavourite(userId, chefId);
		return new ModelAndView("user/chefDetails").addObject("chef", chef)
													.addObject("address", address)
													.addObject("products", products)
													.addObject("subCategories", subCategories)
													.addObject("ratings", ratings)
													.addObject("feedbacks", feedbacks)
													.addObject("isFavourite", isFavourite);
		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	private ModelAndView search(HttpSession httpSession) {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
	    User user = (User) httpSession.getAttribute("user");
	    String pincode = userService.getUserPincode(user.getId());
	    List<Chef> searchedChefs = userService.getChefsByPincode(pincode);
	    List<Product> searchedProducts = userService.getProductsByPincode(pincode);
		/*
		 * httpSession.setAttribute("searchedChefs", searchedChefs);
		 * httpSession.setAttribute("searchedProducts", searchedProducts);
		 */
	    return new ModelAndView("user/search");
	}
	  
	  @RequestMapping(value = "/searchItem", method = RequestMethod.GET)
	  private ResponseEntity<Object> searchItem(@RequestParam String value,HttpSession httpSession) {
	    httpSession.setAttribute("searchValue", value);
	    List<Object> products = userService.searchItems("Product", value);
	    httpSession.setAttribute("searchedProducts", products);
	    List<Object> chefs = userService.searchItems("Chef", value);
	    httpSession.setAttribute("searchedChefs", chefs);
	    return new ResponseEntity<Object>(null,HttpStatus.OK);
	  }
	  
	  @SuppressWarnings("unchecked")
	  @RequestMapping(value = "applyFilter", method = RequestMethod.GET)
	  private ResponseEntity<Object> filter(@RequestParam int sortBy, HttpSession httpSession, @RequestParam Integer[] filterBy){
	    List<Product> products = (List<Product>) httpSession.getAttribute("searchedProducts");
	    httpSession.removeAttribute("searchedProducts");
	    Comparator<Product> compareByCost = new Comparator<Product>() {
	      @Override
	      public int compare(Product o1, Product o2) { 
	        Float price1 = Float.valueOf(o1.getPrice());
	            Float price2 = Float.valueOf(o2.getPrice());
	            return price1.compareTo(price2);
	      }
	    };
	    
	    Comparator<Product> compareByRating = new Comparator<Product>() {
	      @Override
	      public int compare(Product o1, Product o2) {
	        Float rating1 = Float.valueOf(o1.getRating());
	        Float rating2 = Float.valueOf(o2.getRating());
	        return rating1.compareTo(rating2);
	      }
	    };
	    
	    switch(sortBy) {
	    case 1:
	      Collections.sort(products, compareByRating.reversed());
	      break;
	    case 2:
	      Collections.sort(products, compareByCost.reversed());
	      break;
	    case 3:
	      Collections.sort(products, compareByCost);
	      break;
	    }
	    
	    if(filterBy[0] == 0) {
	      httpSession.setAttribute("searchedProducts",products);
	      return null;
	    }
	    else {
	      List<Product> filteredProducts = new ArrayList<Product>();
	      if(filterBy.length == 2) {
	        for(Product p1:products)
	        if (p1.isOpenForHome() && p1.isJainAvailable()) filteredProducts.add(p1);
	      }
	      else if(filterBy[0] == 4) { 
	        for(Product p2:products)
	          if (p2.isOpenForHome()) filteredProducts.add(p2);
	      }
	      else if(filterBy[0] == 5) {
	        for(Product p3:products)
	          if (p3.isJainAvailable()) filteredProducts.add(p3);
	      }
	      
	      httpSession.setAttribute("searchedProducts",filteredProducts);
	      return null;
	    }
	    
	  }
	
	@RequestMapping(value = "/successful", method = RequestMethod.GET)
	private ModelAndView successful() {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		return new ModelAndView("user/successful");
	}
	
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	private ModelAndView terms() {
		if(httpSession.getAttribute("user") == null)
			return new ModelAndView("redirect:/user/login").addObject("sessionExpired", true);
		
		return new ModelAndView("user/terms");
	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	  private ModelAndView forgotPassword() {
	    return new ModelAndView("user/forgot-password");
	  }
	  
	  @RequestMapping(value = "/verifyOTP", method = RequestMethod.POST)
	  private ModelAndView sendOTP(@RequestParam String email, HttpSession httpSession) throws Exception {
	     Login login = (Login) this.generalService.findByEmail(email);
	    if(login != null && login.getType().equals("User")) {
	      int otp = BaseMethods.sendMailForPasswordReset(email, email, emailSender);
	      httpSession.setAttribute("otp", otp);
	      httpSession.setAttribute("email", email);
	      return new ModelAndView("user/verificationForPassword");
	    }
	    else {
	      return new ModelAndView("redirect:/user/forgotPassword").addObject("invalidEmail", true);
	    }
	  }
	  
	  @RequestMapping(value = "/verifyOtpForPassword", method = RequestMethod.POST)
	  private ModelAndView verifyOtpForPassword(@RequestParam int otp, HttpSession httpSession) {
	    int originalOTP = (Integer)httpSession.getAttribute("otp");
	    Login login = (Login) this.generalService.findByEmail((String) httpSession.getAttribute("email"));
	    if (originalOTP == otp) {
	      httpSession.removeAttribute("otp");
	      httpSession.setAttribute("login",login);
	      return new ModelAndView("user/reset-password");
	    }
	    else
	      return new ModelAndView("user/verificationForPassword").addObject("invalidOTP", true);
	  }
	  
	  @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	  private ModelAndView resetPassword(@RequestParam String password, @RequestParam String confirmPassword, HttpSession httpSession) {
	    if(password.equals(confirmPassword)) {
	      Login login = (Login) httpSession.getAttribute("login");
	      login.setPassword(password);
	      this.generalService.save(login);
	      return new ModelAndView("redirect:/user/login");
	    }
	    else {
	      return new ModelAndView("user/reset-password").addObject("notMatch", true);
	    }
	  }

}
