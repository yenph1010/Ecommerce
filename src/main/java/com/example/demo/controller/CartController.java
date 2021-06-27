package com.example.demo.controller;

import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.CartEntity;
import com.example.demo.entity.OrderEntity;
import com.example.demo.entity.ProductEntity;
import com.example.demo.entity.TransactionEntity;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;
import com.example.demo.service.TransactionService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	@Autowired
	private ProductService productService;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private OrderService orderService;

	@Autowired
	ProductRepository productsRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	AccountRepository accountRepository;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	@Qualifier("myCartItems")
	private HashMap<Integer, CartEntity> cartItems;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showCart() {
		return "cart";
	}

	@RequestMapping(value = "addcart/{id}", method = RequestMethod.GET)
	public String viewAdd(HttpSession session, @PathVariable("id") int id) {
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		ProductEntity productEntity = productService.findById(id);
		if (productEntity != null) {
			if (cartItems.containsKey(id)) {
				CartEntity item = cartItems.get(id);
				item.setProductEntity(productEntity);
				item.setQuantity(item.getQuantity() + 1);
				cartItems.put(id, item);
			} else {
				CartEntity item = new CartEntity();
				item.setProductEntity(productEntity);
				item.setQuantity(1);
				cartItems.put(id, item);
			}
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "cart";
	}

	public double totalPrice(HashMap<Integer, CartEntity> cartItems) {
		int count = 0;
		for (Map.Entry<Integer, CartEntity> list : cartItems.entrySet()) {
			if (list.getValue().getProductEntity().getSale() == 0) {
				count += list.getValue().getProductEntity().getPrice() * list.getValue().getQuantity();
			} else {
				count += list.getValue().getProductEntity().getSale() * list.getValue().getQuantity();
			}
		}
		return count;
	}

	@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
	public String viewRemove(HttpSession session, @PathVariable("id") Integer id) {
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		if (cartItems.containsKey(id)) {
			cartItems.remove(id);
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "cart";
	}

	@RequestMapping(value = "/updateCart", method = RequestMethod.GET)
	public String updateCart(HttpSession session) {
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "cart";
	}
	
	@RequestMapping(value = "/checkoutforms", method = RequestMethod.GET)
	public String checkoutforms(Model model, HttpSession session, @ModelAttribute("Order") OrderEntity orderEntity) {
		model.addAttribute("transactionEntity", new TransactionEntity());
		return "checkout";
	}

	@Transactional(rollbackFor = Exception.class)
	@RequestMapping(value = "/transaction", method = RequestMethod.POST)
	public String checkout(HttpSession session,
			@Valid @ModelAttribute("transactionEntity") TransactionEntity transactionEntity, BindingResult result)
			throws NoSuchAlgorithmException {
		// Validate result
		if (result.hasErrors()) {
			return "checkout";
		} else {
			TransactionEntity transactionEntity1 = transactionService.newTransaction(transactionEntity);
			transactionEntity1.setTransactiondate(new Timestamp(new Date().getTime()));
			transactionEntity1.setTransactionstatus("Process");
			for (Map.Entry<Integer, CartEntity> entry : cartItems.entrySet()) {
				OrderEntity orderEntity = new OrderEntity();
				orderEntity.setTransactionEntity(transactionEntity1);
				orderEntity.setProductEntity(entry.getValue().getProductEntity());
				orderEntity.setTotal(entry.getValue().getProductEntity().getPrice());
				orderEntity.setSale(entry.getValue().getProductEntity().getSale());
				orderEntity.setQuantity(entry.getValue().getQuantity());

				// Update product quantity
				int id = entry.getValue().getProductEntity().getId();
				ProductEntity productEntity = productService.editProduct(id);
				productEntity.setQuantity(
						entry.getValue().getProductEntity().getQuantity() - entry.getValue().getQuantity());

				orderService.newOrder(orderEntity);
				sendEmail(transactionEntity1.getTransactionmail());
			}

			session.removeAttribute("myCartNum");
			session.removeAttribute("myCartItems");
			return "shipping";
		}
	}

	public void sendEmail(String transactionmail) {
		String from = "yen.19921010@gmail.com";
		String to = transactionmail;

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		try {
			helper.setSubject("You have successfully ordered products on our website.");

			helper.setFrom(from);
			helper.setTo(to);

			boolean html = true;
			helper.setText(
					"<b>Dear customer</b>,<br><i>We are processing your order to be shipped. Please wait 3~5 days until the order comes.</i>",
					html);
		} catch (MessagingException e) {

			e.printStackTrace();
		}
		mailSender.send(message);
	}

}
