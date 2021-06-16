package com.example.demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.AccountEntity;
import com.example.demo.entity.CategoryEntity;
import com.example.demo.entity.OrderEntity;
import com.example.demo.entity.ProductEntity;
import com.example.demo.entity.RoleEntity;
import com.example.demo.entity.TransactionEntity;
import com.example.demo.entity.UserEntity;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.AccountService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;
import com.example.demo.service.RoleService;
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
	private RoleService roleService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	UserRepository userRepository;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private OrderService orderService;

////////////////////	Register, Login, Logout     ////////////////////
	@RequestMapping({ "/", "" })
	public String indexPage(Model model) {
		model.addAttribute("productList", productService.getProductEntities());
		List<CategoryEntity> categories = categoryService.CategoryEntityAll();
		model.addAttribute("categories", categories);
		return "index";
	}

	@RequestMapping("/admin")
	public String adminPage() {
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
		model.addAttribute("productList", productService.getProductEntities());
		List<CategoryEntity> categories = categoryService.CategoryEntityAll();
		model.addAttribute("categories", categories);
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
			userService.saveAccount(newUserEntity);
			Boolean isValidEmail = validate(userEntity.getAccountEntity().getEmail());
			if (isValidEmail) {
				AccountEntity accountEntity = new AccountEntity();
				accountEntity.setEmail(userEntity.getAccountEntity().getEmail());
				accountEntity.setPhonenumber(userEntity.getAccountEntity().getPhonenumber());
				accountEntity.setDate(new Timestamp(new Date().getTime()));
				accountEntity.setUserEntity(userService.getAccountByUsername(newUserEntity.getUsername()));
				accountService.saveAccount(accountEntity);
			}
			return "login";

		}
	}

	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
			Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
		return matcher.find();

	}

	public static String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			return convertByteToHex(messageDigest);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	public String MD5() {
		String md5 = new String();
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(md5.getBytes());
			StringBuilder sb = new StringBuilder();
			for (byte b : array) {
				sb.append(Integer.toHexString((b & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException ignored) {
		}
		return null;
	}

	public static String getSHAHash(String input) throws NoSuchAlgorithmException {

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			byte[] messageDigest = md.digest(input.getBytes());
			return convertByteToHex(messageDigest);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	public static String convertByteToHex(byte[] data) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < data.length; i++) {
			sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}

	public static String getON_MD5(String data) throws NoSuchAlgorithmException {
		MessageDigest messageDigest = MessageDigest.getInstance("MD5");

		messageDigest.update(data.getBytes());
		byte[] digest = messageDigest.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(Integer.toHexString((int) (b & 0xff)));
		}
		return sb.toString();
	}

////////////////////   User Management     ////////////////////

	@RequestMapping("/customer")
	public String getAllAccount(Model model) {
		model.addAttribute("users", userService.getUsers());
		return "customers";
	}

	@RequestMapping(value = "/editAccountUser/{id}", method = RequestMethod.GET)
	public String showEditUserForm(@PathVariable int id, Model model) {
		UserEntity userEntity = userService.getEditUser(id);
		model.addAttribute("user", userEntity);
		model.addAttribute("type", "update");
		model.addAttribute("action", "editUser");
		return "customer_edit";
	}

	@RequestMapping(value = "/editAccountUser/{id}", method = RequestMethod.POST)
	public String editUser(@ModelAttribute UserEntity userEntity) {
		userRepository.save(userEntity);
		return "redirect:customers";
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.GET)
	public String showcreateUserForm(Model model) {
		model.addAttribute("user", new UserEntity());
		model.addAttribute("action", "newUser");
		model.addAttribute("type", "newUser");
		return "customer_edit";
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.POST)
	public String newUser(UserEntity userEntity, AccountEntity accountEntity, RoleEntity roleEntity, Model model) {
		List<UserEntity> userEntities = new ArrayList<>();
		userEntities.add(userEntity);
		userEntities.add(accountEntity.getUserEntity());
		///////////////////////////////////////////////////////
		userEntity.setUsername(userEntity.getUsername());
		userEntity.setPassword(new BCryptPasswordEncoder().encode(userEntity.getPassword()));
		userEntity.setEnabled(1);
		accountEntity.setEmail(userEntity.getAccountEntity().getEmail());
		accountEntity.setPhonenumber(userEntity.getAccountEntity().getPhonenumber());
		userEntity.setAccountEntity(accountEntity);
		accountEntity.setUserEntity(userEntity);
		userRepository.save(userEntity);
		model.addAttribute("account", userEntities);
		return "redirect:customers";
	}

////////////////////Product Management     ////////////////////
	@RequestMapping("/productsadmin")
	public String getAllProductAdmin(Model model) {
		model.addAttribute("productList", productService.getProductEntities());
		return "products";
	}

	@RequestMapping(value = "/productSearch", method = RequestMethod.GET)
	public String search(@RequestParam("searchInput") String searchInput, Model model) {
		List<ProductEntity> resultList;
		if (searchInput.isEmpty()) {
			resultList = (List<ProductEntity>) productRepository.findAll();
		} else {
			resultList = productRepository.findByNameContaining(searchInput);
		}
		model.addAttribute("productList", resultList);
		return "products";
	}

	@RequestMapping(value = "/searchByCategory", method = RequestMethod.POST)
	public String searchByCategory(@RequestParam("value") int id, Model model) {
		List<ProductEntity> resultList;
		if (id != 0) {
			resultList = (List<ProductEntity>) productRepository.findAll();
		} else {
			resultList = productRepository.findByCategoryEntityId(id);
		}
		model.addAttribute("productList", resultList);
		return "products";
	}

	@RequestMapping(value = "/addProduct")
	public String addProducts(Model model) {
		model.addAttribute("product", new ProductEntity());
		model.addAttribute("categories", getCategorylist());
		model.addAttribute("action", "newProduct");
		return "product_edit";
	}

	@RequestMapping(value = "/newProduct")
	public String newProducts(ProductEntity productEntity, @RequestParam("file") MultipartFile file) {
		String fullPath = uploadFile(file);
		String image = fullPath.substring(71);
		productEntity.setImages(image);
		productService.newProduct(productEntity);
		return "redirect:/productsadmin";
	}

	@RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
	public String showEditProducts(@PathVariable Integer id, Model model) {
		ProductEntity productEntity = productService.editProduct(id);
		model.addAttribute("product", productEntity);
		model.addAttribute("categories", getCategorylist());
		model.addAttribute("type", "update");
		model.addAttribute("action", "/updateProduct");
		return "product_edit";
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute ProductEntity productEntity) {
		productRepository.save(productEntity);
		return "redirect:/productsadmin";
	}

	@RequestMapping("/deleteproduct/{id}")
	public String deleteProducts(@PathVariable Integer id, Model model) {
		productRepository.deleteById(id);
		return "redirect:/productsadmin";
	}

	private Map<Integer, String> getCategorylist() {
		List<CategoryEntity> categoryEntities = categoryService.CategoryEntityAll();
		Map<Integer, String> productList = new HashMap<>();
		for (CategoryEntity p : categoryEntities) {
			productList.put(p.getId(), p.getCategory());
		}
		return productList;
	}

	public String uploadFile(MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Creating the directory to store file
				String pathName = "C:\\Users\\HP\\eclipse-workspace\\Ecommerce\\src\\main\\webapp\\images\\product";
				File dir = new File(pathName);
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
				File serverFile = new File(fileSource);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				return fileSource;
			} catch (Exception e) {

			}
		} else {

		}
		return null;
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
		model.addAttribute("productList", productService.getProductEntities());
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
		model.addAttribute("productList", productService.getProductEntities());
		return "product-grid";
	}

	@RequestMapping(value = "/viewProduct/{id}", method = RequestMethod.GET)
	public String viewProductDetail(@PathVariable Integer id, Model model) {
		ProductEntity productEntity = productService.editProduct(id);
		model.addAttribute("product", productEntity);
		return "product-details";
	}

////////////////////Order ////////////////////
	@RequestMapping("/orders")
	public String getOrders(Model model) {
		model.addAttribute("orders", orderService.getOrderEntities());
		model.addAttribute("transaction", transactionService.transactionEntities());
		return "orders";
	}

	@RequestMapping(value = { "/viewdetails/{id}/{transactionname}" })
	public String getViewdetails(ModelMap model, @PathVariable int id) {
		List<OrderEntity> orderEntities = orderService.getIDTransaction(id);
		TransactionEntity transactionEntity = transactionService.findbyTransaction(id);
		model.addAttribute("transactionEntity", transactionEntity);
		model.addAttribute("orderEntities", orderEntities);
		return "order_view";
	}

	@RequestMapping(value = { "/invoice/" })
	public String getinvoice(ModelMap model, @RequestParam("id") int id) {
		List<OrderEntity> orderEntities = orderService.getIDTransaction(id);
		TransactionEntity transactionEntity = transactionService.findbyTransaction(id);
		model.addAttribute("transactionEntity", transactionEntity);
		model.addAttribute("orderEntities", orderEntities);
		return "order_view";
	}
}