package com.homion.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.homion.model.Address;
import com.homion.model.Admin;
import com.homion.model.Area;
import com.homion.model.Category;
import com.homion.model.Chef;
import com.homion.model.Login;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.Product;
import com.homion.model.SubCategory;
import com.homion.model.User;
import com.homion.service.AdminService;
import com.homion.service.GeneralService;
import com.homion.utils.BaseMethods;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
		@Autowired
		private AdminService adminService;
		
		@Autowired
		private GeneralService generalService;
		
		@Autowired
	    private JavaMailSender emailSender;
		
		@Autowired
		private HttpSession httpSession;
		
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		private ModelAndView login() {
			return new ModelAndView("admin/login").addObject("login", new Login());
		}
		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		private ModelAndView logout() {
			httpSession.removeAttribute("admin");
			return new ModelAndView("redirect:/admin/login");
		}
		
		@RequestMapping(value = "/verifyCredentials", method = RequestMethod.POST)
		private ModelAndView verifyCredentials(@ModelAttribute Login login) {
			Object object = generalService.verifyCredentials(login);
			if (object == null)
				return new ModelAndView("redirect:/admin/login").addObject("wrongCredentials", true);
			else {
				httpSession.setAttribute("admin", (Admin)object);
				return new ModelAndView("redirect:/admin/viewChef");
			}
		}
		
	   
		/************************************************* AREA ********************************************/
		
		@RequestMapping(value = "/addArea", method = RequestMethod.GET)
		private ModelAndView addArea() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			
			return new ModelAndView("admin/addArea","Area",new Area());
		}
		
		@RequestMapping(value = "/insertArea", method = RequestMethod.POST)
		private ModelAndView insertArea(@ModelAttribute Area area) {
			this.generalService.save(area);
			if((Long)area.getId()==null)
				return new ModelAndView("redirect:/admin/addArea");
			else
				return new ModelAndView("redirect:/admin/viewArea");
		}
		
		@RequestMapping(value = "/viewArea", method = RequestMethod.GET)
		private ModelAndView viewArea() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			
			@SuppressWarnings("unchecked")
			List<Object> areaList = this.generalService.getAllRows("Area");
			return new ModelAndView("admin/viewArea","areaList",areaList);
		}
		
		@RequestMapping(value = "/deleteArea", method = RequestMethod.GET)
		public ModelAndView deleteArea(@RequestParam long id) {
			this.adminService.deleteArea(id);
			return new ModelAndView("redirect:/admin/viewArea");
		}
		
		@RequestMapping(value = "/editArea", method = RequestMethod.GET)
		public ModelAndView editArea(@RequestParam long id) {
			Area area = this.adminService.editArea(id);
			return new ModelAndView("admin/addArea","Area",area);
		}
		
		
	    /*********************************** CATEGORY ********************************************/
		
		@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
		private ModelAndView addCategory() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			
			return new ModelAndView("admin/addCategory","Category", new Category());
		}
		
		@RequestMapping(value = "/insertCategory", method = RequestMethod.POST)
		private ModelAndView insertCategory(@ModelAttribute Category category) {
			this.generalService.save(category);
			if((Long)category.getId()==null)
				return new ModelAndView("redirect:/admin/addCategory");
			else
				return new ModelAndView("redirect:/admin/viewCategory");
		}
		
		@RequestMapping(value = "/viewCategory", method = RequestMethod.GET)
		private ModelAndView viewCategory() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			@SuppressWarnings("unchecked")
			List<Object> categoryList = this.generalService.getAllRows("Category");
			return new ModelAndView("admin/viewCategory","categoryList", categoryList);
		}
		
		@RequestMapping(value = "/deleteCategory", method = RequestMethod.GET)
		public ModelAndView deleteCategory(@RequestParam long id) {
			this.adminService.deleteCategory(id);
			return new ModelAndView("redirect:/admin/viewCategory");
		}
		
		@RequestMapping(value = "/editCategory", method = RequestMethod.GET)
		public ModelAndView editCategory(@RequestParam long id) {
			Category category = this.adminService.editCategory(id);
			return new ModelAndView("admin/addCategory","Category",category);
		}
		
	    
		/******************************** Sub Category ************************************************/
		
		@RequestMapping(value = "/addSubCategory", method = RequestMethod.GET)
		private ModelAndView addSubCategory() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			
			return new ModelAndView("admin/addSubCategory","Subcategory",new SubCategory());
		}
		
		@RequestMapping(value = "/insertSubCategory", method = RequestMethod.POST)
		private ModelAndView insertSubCategory(@ModelAttribute SubCategory Subcategory) {
			this.generalService.save(Subcategory);
			if((Long)Subcategory.getId()==null)
				return new ModelAndView("redirect:/admin/addSubCategory");
			else
				return new ModelAndView("redirect:/admin/viewSubCategory");
		}
		
		@RequestMapping(value = "/viewSubCategory", method = RequestMethod.GET)
		private ModelAndView viewSubCategory() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			@SuppressWarnings("unchecked")
			List<Object> subcategory = this.generalService.getAllRows("SubCategory");
			return new ModelAndView("admin/viewSubCategory","Subcategory",subcategory);
		}
		
		@RequestMapping(value = "/deleteSubCategory", method = RequestMethod.GET)
		public ModelAndView deleteSubCategory(@RequestParam long id) {
			this.adminService.deleteSubCategory(id);
			return new ModelAndView("redirect:/admin/viewSubCategory");
		}
		
		@RequestMapping(value = "/editSubCategory", method = RequestMethod.GET)
		public ModelAndView editSubCategory(@RequestParam long id) {
			SubCategory subcategory = this.adminService.editSubCategory(id);
			return new ModelAndView("admin/addSubCategory","Subcategory",subcategory);
		}
		
		
		/********************************  Manage User ************************************************/
	    
	    @RequestMapping(value = "/viewUser", method = RequestMethod.GET)
	    private ModelAndView viewUser() {
	    	if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
	    	
			  List<User> users = this.adminService.getUsers();
			  List<Address> userAddresses = this.adminService.getUserAddress();
			  Map<User, List<Address>> userData = new LinkedHashMap<User, List<Address>>();
			  for(User u: users) {
			    List<Address> addr = new ArrayList<Address>();
			    while(!userAddresses.isEmpty()&& u.getId() == userAddresses.get(0).getOwnerId())
			      addr.add(userAddresses.remove(0));
			    userData.put(u, addr);
			  }
			  return new ModelAndView("admin/viewUser").addObject("userData", userData);
	    }
	    
	    @RequestMapping(value = "/viewUserAction", method = RequestMethod.GET)  
	    private ModelAndView viewUserAction(@RequestParam String action, @RequestParam long id) throws Exception {
	          User user = (User) this.adminService.updateStatus(id, action, "User");
	      
		      if(action.equals("Active"))
		        BaseMethods.sendChefActivationMail(user.getFirstName(), user.getLogin().getEmail(), emailSender);
		      else
		        BaseMethods.sendChefBlockedMail(user.getFirstName(), user.getLogin().getEmail(), emailSender);
		      
		      return new ModelAndView("redirect:/admin/viewUser");    
	    }
	    

	    /********************************  Manage Chef ************************************************/    
	    
	    @RequestMapping(value = "/viewChef", method = RequestMethod.GET)
	    private ModelAndView viewChef() {
	    	if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
	    	
		      List<Chef> chefs = this.adminService.getChefs(); // chefs having status: [Active] [Blocked]
		      List<Address> address = this.adminService.getChefAddress(); // chef's address  having status: [Active] [Blocked]
		      LinkedHashMap<Chef, Address> chefsData = new LinkedHashMap<Chef, Address>();
		      for(int i=0; i<chefs.size(); i++) 
		        chefsData.put((Chef)chefs.get(i), (Address)address.get(i));
		      return new ModelAndView("admin/viewChef", "chefsData", chefsData);
	    }
	    
	    @RequestMapping(value = "/chefRequests", method = RequestMethod.GET)
	    private ModelAndView chefRequests() {
	    	if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
	    	
		      List<Chef> requestedChefs = this.adminService.getRequestedChefs();
		      List<Address> address = this.adminService.getRequestedChefsAddress();
		      LinkedHashMap<Chef, Address> requestedChefsData = new LinkedHashMap<Chef, Address>();
		      for(int i=0; i<requestedChefs.size(); i++) 
		        requestedChefsData.put((Chef)requestedChefs.get(i), (Address)address.get(i));
		      return new ModelAndView("admin/chefRequests", "requestedChefsData", requestedChefsData);
	    }
	    
	    @RequestMapping(value = "/chefRequestsAction", method = RequestMethod.GET)  
	    private ModelAndView chefRequestsAction(@RequestParam String action, @RequestParam long id) throws Exception {
		      Chef chef = (Chef) this.adminService.updateStatus(id, action, "Chef");
		      
		      if(action.equals("Active"))
		        BaseMethods.sendChefActivationMail(chef.getFirstName(), chef.getLogin().getEmail(), emailSender);
		      else if(action.equals("Rejected"))
		        BaseMethods.sendChefRequestRejectionMail(chef.getFirstName(), chef.getLogin().getEmail(), emailSender);
		      return new ModelAndView("redirect:/admin/chefRequests");    
	    }
	    
	    @RequestMapping(value = "/viewChefAction", method = RequestMethod.GET)  
	    private ModelAndView viewChefsAction(@RequestParam String action, @RequestParam long id) throws Exception {
			  Chef chef = (Chef) this.adminService.updateStatus(id, action, "Chef");
			  
			  if(action.equals("Active"))
			    BaseMethods.sendChefActivationMail(chef.getFirstName(), chef.getLogin().getEmail(), emailSender);
			  else
			    BaseMethods.sendChefBlockedMail(chef.getFirstName(), chef.getLogin().getEmail(), emailSender);
			  return new ModelAndView("redirect:/admin/viewChef");    
	    }
		
		
		@SuppressWarnings("unchecked")
	    @RequestMapping(value = "/viewProduct", method = RequestMethod.GET)
	    private ModelAndView viewProduct() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			
			List<Product> products = (List<Product>) this.generalService.getAllRows("Product");
			return new ModelAndView("admin/viewProduct","Products",products);
	    }	
		
		
		
		/*
		 * @RequestMapping(value = "/viewComplaints", method = RequestMethod.GET)
		 * private ModelAndView viewComplaint() { return new
		 * ModelAndView("admin/complaint"); }
		 * 
		 * @RequestMapping(value = "/complaintReply", method = RequestMethod.GET)
		 * private ModelAndView complaintReply() { return new
		 * ModelAndView("admin/complaintReply"); }
		 */
		
		
		
		@RequestMapping(value = "/viewOrder", method = RequestMethod.GET)	
		private ModelAndView viewOrder() {
			if(httpSession.getAttribute("admin") == null)
				return new ModelAndView("redirect:/admin/login").addObject("sessionExpired", true);
			
			List<Order> orders = this.adminService.getOrders();
			List<OrderItem> orderItems = this.adminService.getOrderItems();
			Map<Order, List<OrderItem>> viewOrders = new LinkedHashMap<Order, List<OrderItem>>();
			int i=0;
			while(i<orders.size()) {
				List<OrderItem> items = new ArrayList<OrderItem>();
				while(!orderItems.isEmpty() && orderItems.get(0).getOrderId() == orders.get(i).getId()){
					items.add(orderItems.get(0));
					orderItems.remove(0);
				}
				viewOrders.put(orders.get(i), items);
				i++;
		    }
			return new ModelAndView("admin/viewOrder").addObject("viewOrders", viewOrders);
		}
		
		
}
