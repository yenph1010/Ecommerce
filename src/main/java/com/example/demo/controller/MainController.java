package com.example.demo.controller;

import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.entity.AccountEntity;
import com.example.demo.entity.CategoryEntity;
import com.example.demo.entity.ProductEntity;
import com.example.demo.entity.RoleEntity;
import com.example.demo.entity.UserEntity;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.TransactionRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.AccountService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;
import com.example.demo.service.TransactionService;
import com.example.demo.service.UserService;

@Controller
@SessionAttributes("email")
public class MainController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	UserRepository userRepository;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	TransactionRepository transactionRepository;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private OrderService orderService;

////////////////////	Register, Login, Logout     ////////////////////
	@RequestMapping({ "/", "" })
	public String indexPage(Model model) {
		List<CategoryEntity> categories = categoryService.CategoryEntityAll();
		model.addAttribute("categories", categories);
		return indexPage(model, 1);
	}

	@RequestMapping("/indexpage/{i}")
	public String indexPage(Model model, @PathVariable(name = "i") int pageNum) {

		Page<ProductEntity> page = productService.getProductEntities(pageNum);

		List<ProductEntity> productList = page.getContent();

		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("productList", productList);

		return "index";
	}

	@RequestMapping("/admin")
	public String adminPage(Model model) {
		model.addAttribute("orders", orderService.getOrderEntities());
		model.addAttribute("transaction", transactionService.transactionEntities());
		return "admin";
	}

	@RequestMapping("/logout")
	public String getLogOut() {
		return "login";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/user")
	public String showHomePage(Model model) {
		List<CategoryEntity> categories = categoryService.CategoryEntityAll();
		model.addAttribute("categories", categories);
		return homePage(model, 1);
	}

	@RequestMapping("/homepage/{i}")
	public String homePage(Model model, @PathVariable(name = "i") int pageNum) {

		Page<ProductEntity> page = productService.getProductEntities(pageNum);

		List<ProductEntity> productList = page.getContent();

		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("productList", productList);

		return "home";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("account", new UserEntity());
		return "register";
	}

	@RequestMapping(value = "/UserRegisterAccount", method = RequestMethod.POST)
	public String registerAccount(UserEntity userEntity, Model model) throws NoSuchAlgorithmException {

		UserEntity newUserEntity = new UserEntity();
		newUserEntity.setUsername(userEntity.getUsername());

		newUserEntity.setPassword(new BCryptPasswordEncoder().encode(userEntity.getPassword()));

		List<RoleEntity> roleEntityList = new ArrayList<>();
		RoleEntity roleEntity = new RoleEntity();
		roleEntity.setName("USER");
		roleEntityList.add(roleEntity);
		newUserEntity.setEnabled(1);
		newUserEntity.setUserRoleEntities(roleEntityList);
		if (userService.isException(newUserEntity)) {
			return "redirect:/register";
		} else {
			userService.saveAccount(newUserEntity);
			
				AccountEntity accountEntity = new AccountEntity();
				accountEntity.setEmail(userEntity.getAccountEntity().getEmail());
				accountEntity.setPhonenumber(userEntity.getAccountEntity().getPhonenumber());
				accountEntity.setDate(new Timestamp(new Date().getTime()));
				accountEntity.setUserEntity(userService.getAccountByUsername(newUserEntity.getUsername()));
				accountService.saveAccount(accountEntity);
			
			return "login";

		}
	}



////////////////////Guest Browsing ////////////////////
	@RequestMapping(value = "/guestSearch", method = RequestMethod.GET)
	public String guestSearchProduct(@RequestParam("searchInput") String searchInput, Model model) {
		List<ProductEntity> resultList;
		if (searchInput.isEmpty()) {
			resultList = (List<ProductEntity>) productRepository.findAll();
		} else {
			resultList = productRepository.findByNameContaining(searchInput);
		}
		model.addAttribute("productList", resultList);
		return "guest-product-grid";
	}

	@RequestMapping(value = "/guestSearch/{id}", method = RequestMethod.GET)
	public String guestSearchCategory(@PathVariable Integer id, Model model) {
		List<ProductEntity> resultList;
		if (id == 0) {
			resultList = (List<ProductEntity>) productRepository.findAll();
		} else {
			resultList = productRepository.findByCategoryEntityId(id);
		}
		model.addAttribute("productList", resultList);
		return "guest-product-grid";
	}

	@RequestMapping(value = "/guestViewAllProducts", method = RequestMethod.GET)
	public String guestViewAllProducts(Model model) {
		return guestViewPage(model, 1);
	}

	@RequestMapping("/guestpage/{i}")
	public String guestViewPage(Model model, @PathVariable(name = "i") int pageNum) {

		Page<ProductEntity> page = productService.getProductEntities(pageNum);

		List<ProductEntity> productList = page.getContent();

		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("productList", productList);

		return "guest-product-grid";
	}

	@RequestMapping(value = "/guestViewProduct/{id}", method = RequestMethod.GET)
	public String guestViewProductDetail(@PathVariable Integer id, Model model) {
		ProductEntity productEntity = productService.editProduct(id);
		model.addAttribute("product", productEntity);
		return "guest-product-details";
	}

////////////////////Shopping ////////////////////
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchProduct(@RequestParam("searchInput") String searchInput, Model model) {
		List<ProductEntity> resultList;
		if (searchInput.isEmpty()) {
			resultList = (List<ProductEntity>) productRepository.findAll();
		} else {
			resultList = productRepository.findByNameContaining(searchInput);
		}
		model.addAttribute("productList", resultList);
		return "product-grid";
	}

	@RequestMapping(value = "/search/{id}", method = RequestMethod.GET)
	public String searchCategory(@PathVariable Integer id, Model model) {
		List<ProductEntity> resultList;
		if (id == 0) {
			resultList = (List<ProductEntity>) productRepository.findAll();
		} else {
			resultList = productRepository.findByCategoryEntityId(id);
		}
		model.addAttribute("productList", resultList);
		return "product-grid";
	}


	@RequestMapping(value = "/viewAllProducts", method = RequestMethod.GET)
	public String viewAllProducts(Model model) {
		return viewPage(model, 1);
	}

	@RequestMapping("/page/{i}")
	public String viewPage(Model model, @PathVariable(name = "i") int pageNum) {

		Page<ProductEntity> page = productService.getProductEntities(pageNum);

		List<ProductEntity> productList = page.getContent();

		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("productList", productList);

		return "product-grid";
	}

	@RequestMapping(value = "/viewProduct/{id}", method = RequestMethod.GET)
	public String viewProductDetail(@PathVariable Integer id, Model model) {
		ProductEntity productEntity = productService.editProduct(id);
		model.addAttribute("product", productEntity);
		return "product-details";
	}


}