package ptithcm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.Product;
import poly.entity.User;
import poly.entity.Mailer;
import poly.entity.Order;

@Transactional
@Controller
public class UserController {
	@Autowired
	SessionFactory factory;
	Session session;
	String hql;
	Query query;
	Transaction t;
	//User admin = new User();
	User userMain = new User();
	User User = new User();
	User UserGetPass = new User();
	boolean checkFalseLogin = false;//thong bao loi dang nhap
	boolean checkLogin = false;//thong bao thanh cong
	boolean checkFalseRegestration = false;//thong bao loi dang ki
	boolean checkRegestration = false;//thong báo đăng kí thành công
	boolean checkGetPassword = false;
	boolean checkFasleUpdateProduct = false;//thông báo lỗi
	boolean checkOpenFormEditProduct = false;//thông báo lỗi
	boolean checkFalseOrderForm = false;//thông báo lỗi đạt hàng
	boolean notificationOrder = false;//thông báo lỗi đạt hàng 
	boolean notificationFalse = false;//thông báo lỗi đạt hàng
	
	List<Product> product_guestrooms = new ArrayList<Product>();;
	List<Product> product_bedrooms = new ArrayList<Product>();;
	List<Product> product_chickenrooms = new ArrayList<Product>();;
	List<Product> listCart = new ArrayList<Product>(); //gio hang
	List<Product> listProduct = new ArrayList<Product>();; // toan bo san pham
	List<User> listUser = new ArrayList<User>();; // toan bo san pham
	
	// load du lieu vao homepage
	@RequestMapping("index")
	public String home(ModelMap model) {
		//lay du lieu tat ca san pham
		session = factory.getCurrentSession();
		hql = "FROM Product";
		query = session.createQuery(hql);
		listProduct = query.list();
		// lay du lieu guestroom
		session = factory.getCurrentSession();
		hql = "FROM Product r WHERE r.Room.id = 'GR001'";
		query = session.createQuery(hql);
		product_guestrooms = query.list();
		model.addAttribute("product_guestrooms", product_guestrooms);
		
		// lay du lieu bedroom
		session = factory.getCurrentSession();
		String hql1 = "FROM Product r WHERE r.Room.id = 'BR003'";
		query = session.createQuery(hql1);
		product_bedrooms = query.list();
		model.addAttribute("product_bedrooms", product_bedrooms);
		
		// lay du lieu chickenroom
		session = factory.getCurrentSession();
		String hql2 = "FROM Product r WHERE r.Room.id = 'CR002'";
		query = session.createQuery(hql2);
		product_chickenrooms = query.list();
	
		model.addAttribute("product_chickenrooms", product_chickenrooms);

		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("UserGetPass", UserGetPass); //lay lai mat khau
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("checkGetPassword", checkGetPassword); //form quen mat khau
		notificationOrder = false;
		
		model.addAttribute("carts",listCart);
		
		return "home/index";
	}

	// dang nhap tai khoan
	@RequestMapping(value = "login", method = RequestMethod.POST, params = "login")
	public String login(ModelMap model, @ModelAttribute("User") User user, BindingResult errors, HttpSession h) {
		checkFalseRegestration = false;
		model.addAttribute("checkFalseRegestration", checkFalseRegestration);
		List<User> dsUser = null;
		if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "User", "Vui lòng nhập tên đăng nhập !");
		} else {
			session = factory.getCurrentSession();
			hql = "FROM User";
			query = session.createQuery(hql);
			dsUser = query.list();
			boolean check3 = false;
			for (User s : dsUser) {
				if (s.getUsername().trim().compareTo(user.getUsername().trim()) == 0) {
					check3 = true;
					userMain = s;
				}
			}
			if (!check3)
				errors.rejectValue("username", "User", "Tài khoản không tồn tại!");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "User", "Vui lòng nhập password !");
		} else {
			if (userMain.getPassword().trim().compareTo(user.getPassword().trim()) != 0) {
				errors.rejectValue("password", "User", "Password không chính xác !");
				userMain = new User();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("mess", "Đăng nhập thất bại!");
			userMain = new User();
			model.addAttribute("userMain", userMain);
			
			UserGetPass = new User();
			model.addAttribute("UserGetPass", UserGetPass);
			
			checkFalseLogin = true;
			model.addAttribute("checkFalseLogin", checkFalseLogin);
		} else {
			model.addAttribute("mess", "Đăng nhập thành công !");
			model.addAttribute("userMain", userMain);
			checkLogin = true;
			model.addAttribute("checkLogin", checkLogin);
			checkRegestration = false;
			model.addAttribute("checkRegestration", checkRegestration);
			if(userMain.getUsername().trim().equals("admin"))
				h.setAttribute("adminControl",userMain.getUsername().trim() );
			
			//lay lai don hang cu
			List<Order> listOrder = new ArrayList<Order>();
			Session session2 = factory.getCurrentSession();
			String hql2 = "FROM Order o WHERE o.User.username =:username AND o.bought =:bought";
			Query query2 = session2.createQuery(hql2);
			query2.setParameter("username", userMain.getUsername());
			query2.setParameter("bought", 0);
			listOrder = query2.list();
			
			if(listOrder.size() == 0)
				listCart = new ArrayList<Product>();
			else{
				for(Order o: listOrder){
					Product p = new Product();
					for(Product s: listProduct){
						if(o.getProduct().getId().compareTo(s.getId())==0){
							p = s;
						}
					}
					listCart.add(p);
				}
			}
			
			return "redirect:/index.htm";
		}
		checkFalseLogin = false;
		checkGetPassword = false;

		return "home/index";
	}
	@Autowired
	JavaMailSender mailer1;
	// cap lai mat khau
		@RequestMapping(value = "getPassword", method = RequestMethod.POST, params = "getPassword")
		public String getPass(ModelMap model, @ModelAttribute("UserGetPass") User user, BindingResult errors) {
			checkFalseRegestration = false;
			model.addAttribute("checkFalseRegestration", checkFalseRegestration);
			
			List<User> dsUser = null;
			if (user.getEmail().trim().length() == 0) {
				errors.rejectValue("email", "UserGetPass", "Vui lòng nhập mail !");
			} else {
				session = factory.getCurrentSession();
				hql = "FROM User";
				query = session.createQuery(hql);
				dsUser = query.list();
				boolean check3 = false;
				for (User s : dsUser) {
					if (s.getEmail().trim().compareTo(user.getEmail().trim()) == 0) {
						check3 = true;
						user.setPassword(s.getPassword());
					}
				}
				if (!check3)
					errors.rejectValue("email", "UserGetPass", "Email không tồn tại!");
			}
			if (errors.hasErrors()) {
				checkGetPassword = true;
				model.addAttribute("checkGetPassword", checkGetPassword);
				
				User = new User();
				model.addAttribute("User", User);			
			} else {
				
				try {
					//gui mail cap mat khau
					String from = "hatruong2628@gmail.com";
					String to = user.getEmail();
					String subject = "Notification from Furniture Shop";
					String body ="Congratulation!" +"Your Password: "+user.getPassword();
					// Tạo mail
					MimeMessage mail = mailer1.createMimeMessage();
					// Sử dụng lớp trợ giúp
					MimeMessageHelper helper = new MimeMessageHelper(mail);
					helper.setFrom(from, from);
					helper.setTo(to);
					helper.setReplyTo(from, from);
					helper.setSubject(subject);
					helper.setText(body, true);
					// Gửi mail
					mailer1.send(mail);
					model.addAttribute("message", "Gửi email thành công !");
				} catch (Exception ex) {
					model.addAttribute("message", "Gửi email thất bại !"+ex);
				}	
				checkGetPassword = false;
				return "redirect:/index.htm";
			}
			return "home/index";
		}

	@Autowired
	JavaMailSender mailer;
	// dang ki tai khoan
	@RequestMapping(value = "insert", method = RequestMethod.POST, params = "update")
	public String insert(ModelMap model, @ModelAttribute("User") User user,
			BindingResult errors) {
		checkFalseLogin = false;
		model.addAttribute("checkFalseLogin", checkFalseLogin);
		
		if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "User", "Vui lòng nhập tên đăng nhập !");
		} else {
			session = factory.getCurrentSession();
			hql = "FROM User";
			query = session.createQuery(hql);
			listUser = query.list();
			for (User s : listUser) {
				if (s.getUsername().trim().compareTo(user.getUsername().trim()) == 0)
					errors.rejectValue("username", "User", "Tên đăng nhập đã tồn tại !");
			}
		}
		if (user.getFullname().trim().length() == 0) {
			errors.rejectValue("fullname", "User", "Vui lòng nhập tên đầy đủ !");
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "User", "Vui lòng nhập mail !");
		} else {
			for (User s : listUser) {
				if (s.getEmail().trim().compareTo(user.getEmail().trim()) == 0)
					errors.rejectValue("email", "User", "Mail đã sử dụng !");
			}
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "User", "Vui lòng nhập tên đầy đủ !");
		}
		if (errors.hasErrors()) {
			checkFalseRegestration = true;
			model.addAttribute("checkFalseRegestration", checkFalseRegestration);
		} else {
			checkFalseRegestration = false;
			model.addAttribute("checkFalseRegestration", checkFalseRegestration);
			checkRegestration = true;
			model.addAttribute("checkRegestration", checkRegestration);
			
			//lay nguon anh
			String pathPhoto ="dist/img/user-avatar/"+ user.getPhoto();
			user.setPhoto(pathPhoto);
			
			//gui mail chuc mung
			String from = "hatruong2628@gmail.com";
			String to = user.getEmail();
			String subject = "Notification from Furniture Shop";
			String body ="Congratulation!" + "\n Username: "+ user.getUsername()+"\n Password: "+user.getPassword();	
			try {
				// Tạo mail
				MimeMessage mail = mailer.createMimeMessage();
				// Sử dụng lớp trợ giúp
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom(from, from);
				helper.setTo(to);
				helper.setReplyTo(from, from);
				helper.setSubject(subject);
				helper.setText(body, true);
				// Gửi mail
				mailer.send(mail);
				model.addAttribute("message", "Gửi email thành công !");
			} catch (Exception ex) {
				model.addAttribute("message", "Gửi email thất bại !"+ex);
			}
			
			session = factory.openSession();
			t = session.beginTransaction();
			try {
				session.save(user);
				t.commit();
				model.addAttribute("mess", "Thêm mới thành công !");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("mess", "Thêm mới thất bại !");
			} finally {
				session.close();
			}
			return "redirect:/index.htm";
		}
		return "home/index";
	}
	
	//đăng xuất tài khoản
	@RequestMapping("logout")
	public String logout(ModelMap model){
		userMain = new User();
		listCart = new ArrayList<Product>();
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", checkLogin);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", checkRegestration);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		return "redirect:/index.htm";
	}
	//============== TRANG QUAN LI ===============	
	//ve lai trang manage
		@RequestMapping("admin/control/manage-page")
		public String manage(ModelMap model) {
			session = factory.getCurrentSession();
			hql = "FROM User";
			query = session.createQuery(hql);
			listUser = query.list();
			model.addAttribute("users", listUser); 
			
			session = factory.getCurrentSession();
			hql = "FROM Product";
			query = session.createQuery(hql);
			listProduct = query.list();
			model.addAttribute("products", listProduct); 
			
			model.addAttribute("userMain", userMain); 
			model.addAttribute("User", User);//User tam de lay thong tin dang nhap
			model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
			model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
			model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
			model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
			model.addAttribute("carts",listCart);
			
			model.addAttribute("checkOpenFormEditProduct", false); //tat form sua 
			model.addAttribute("Product", new Product()); 
			model.addAttribute("ProductEdit", new Product());
			model.addAttribute("notificationFalse", notificationFalse); //tat form sua 
				
			return "manage/manage-page";
		}
		
	//xoa san pham
	@RequestMapping("delete-product/{Id}")
	public String deleteProduct(@PathVariable("Id") String Id, ModelMap model) {
		//tim san pham da chon
		Product product = new Product();
		for (Product s : listProduct) {
			if (s.getId().equals(Id))
				product = s;
		}
		
		List<Order> listOrder = new ArrayList<Order>();
		Session session2 = factory.getCurrentSession();
		String hql2 = "FROM Order";
		Query query2 = session2.createQuery(hql2);
		listOrder = query2.list();
		
		int dem=0;
		for (Order o : listOrder) {
			if (o.getProduct().getId().equals(Id)){
				dem++;
			}
		}
		
		if(dem == 0){
			notificationFalse = false;
			session = factory.openSession();
			t = session.beginTransaction();
			try {
				session.delete(product);
				t.commit();

			} catch (Exception e) {
				t.rollback();
			} finally {
				session.close();
			}
			//model.addAttribute("notificationFalse", notificationFalse); //mo form sua len
			return "redirect:/admin/control/manage-page.htm";
		}
		notificationFalse = true;
		return "redirect:/admin/control/manage-page.htm";
//		model.addAttribute("Product", new Product()); //đưa form thêm về trạng thái trống
//		model.addAttribute("userMain", userMain); 
//		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
//		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
//		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
//		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
//		model.addAttribute("checkFalseRegestration", false); //loi nhap tai khoan dang ki
//		model.addAttribute("carts",listCart);
//		model.addAttribute("checkOpenFormEditProduct", false); //mo form sua len
//		
//		notificationFalse = true;
//		model.addAttribute("notificationFalse", notificationFalse); //mo form sua len
//		
//		
//		return "manage/manage-page";
	}
	
	//thêm sản phẩm
	@RequestMapping(value = "insert-product", method = RequestMethod.POST, params = "insert")
	public String insertProduct(ModelMap model, @ModelAttribute("Product") Product product, BindingResult errors) {
		if (product.getId().trim().length() == 0) {
			errors.rejectValue("id", "Product", "Vui lòng nhập mã sản phẩm !");
		}
		for (Product s : listProduct) {
			if (s.getId().trim().equals(product.getId().trim()))
				errors.rejectValue("id", "Product", "Mã sản phẩm đã tồn tại !");
		}
		if (product.getName().trim().length() == 0) {
			errors.rejectValue("name", "Product", "Vui lòng nhập tên sản phẩm !");
		}
		if (product.getPrice() == 0) {
			errors.rejectValue("price", "Product", "Vui lòng nhập giá sản phẩm !");
		}
		if (product.getOldPrice() == 0) {
			errors.rejectValue("oldPrice", "Product", "Vui lòng nhập giá cũ sản phẩm !");
		}
		if (product.getPhoto().trim().length() == 0) {
			errors.rejectValue("photo", "Product", "Vui lòng nhập link ảnh !");
		}
		if (product.getRoom().getId().trim().length() == 0) {
			errors.rejectValue("room.id", "Product", "Vui lòng nhập mã loại !");
		}
		if (product.getProducer().getId().trim().length() == 0) {
			errors.rejectValue("producer.id", "Product", "Vui lòng nhập mã nhà sản xuất !");
		}
		if (product.getAmount() == 0) {
			errors.rejectValue("amount", "Product", "Vui lòng nhập số lượng tồn sản phẩm !");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
		} else {
			model.addAttribute("message", "Chúc mừng, bạn đã nhập đúng !");
			//lay nguon anh
			String pathPhoto ="dist/img/products/"+ product.getPhoto();
			product.setPhoto(pathPhoto);
			
			session = factory.openSession();
			t = session.beginTransaction();
			try {
				session.save(product);
				t.commit();
				model.addAttribute("mess", "Thêm mới thành công !");
				checkFasleUpdateProduct = false;
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("mess", "Thêm mới thất bại !");
			} finally {
				session.close();
			}
			return "redirect:/admin/control/manage-page.htm";
		}
		session = factory.getCurrentSession();
		hql = "FROM User";
		query = session.createQuery(hql);
		listUser = query.list();
		model.addAttribute("users", listUser); 
		
		session = factory.getCurrentSession();
		hql = "FROM Product";
		query = session.createQuery(hql);
		listProduct = query.list();
		model.addAttribute("products", listProduct); 
		model.addAttribute("checkFasleUpdateProduct", true);//thong báo lỗi
		
		model.addAttribute("ProductEdit", new Product());// đưa form thêm về rỗng
		model.addAttribute("checkOpenFormEditProduct", false); //tắt form sua
		
		return "manage/manage-page";
	}
	
	//lấy thông tin sản phẩm sửa
	Product editProduct = new Product();
	@RequestMapping("edit-product/{Id}")
	public String editProduct(@PathVariable("Id") String Id, ModelMap model) {
		for (Product s : listProduct) {
			if (s.getId().equals(Id)){
				model.addAttribute("ProductEdit", s); // phục vụ cho form sửa
				editProduct = s;
			}	
		}
		
		session = factory.getCurrentSession();
		hql = "FROM User";
		query = session.createQuery(hql);
		listUser = query.list();
		model.addAttribute("users", listUser); 
		
		session = factory.getCurrentSession();
		hql = "FROM Product";
		query = session.createQuery(hql);
		listProduct = query.list();
		model.addAttribute("products", listProduct); 
		
		model.addAttribute("Product", new Product()); //đưa form thêm về trạng thái trống
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", true); //loi nhap tai khoan dang ki
		model.addAttribute("carts",listCart);
		model.addAttribute("checkOpenFormEditProduct", true); //mo form sua len
		
		return "manage/manage-page";
	}
	
	//Tiến hành sửa sản phẩm
	@RequestMapping(value = "edit-product", method = RequestMethod.POST, params = "edit")
	public String editProduct(ModelMap model, @ModelAttribute("ProductEdit") Product product, BindingResult errors) {
		if (product.getName().trim().length() == 0) {
			errors.rejectValue("name", "ProductEdit", "Vui lòng nhập tên sản phẩm !");
		}
		if (product.getPrice() == 0) {
			errors.rejectValue("price", "ProductEdit", "Vui lòng nhập giá sản phẩm !");
		}
		if (product.getOldPrice() == 0) {
			errors.rejectValue("oldPrice", "ProductEdit", "Vui lòng nhập giá cũ sản phẩm !");
		}
		if (product.getRoom().getId().trim().length() == 0) {
			errors.rejectValue("room.id", "ProductEdit", "Vui lòng nhập mã loại !");
		}
		if (product.getProducer().getId().trim().length() == 0) {
			errors.rejectValue("producer.id", "ProductEdit", "Vui lòng nhập mã nhà sản xuất !");
		}
		if (product.getAmount() == 0) {
			errors.rejectValue("amount", "ProductEdit", "Vui lòng nhập số lượng tồn sản phẩm !");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
		} else {
			model.addAttribute("message", "Chúc mừng, bạn đã nhập đúng !");
			session = factory.openSession();
			t = session.beginTransaction();
			try {
				//lấy lại ảnh sản phẩm sửa
				product.setPhoto(editProduct.getPhoto());
				product.setId(editProduct.getId());
				session.update(product);
				t.commit();
				model.addAttribute("mess", "Sửa sản phẩm thành công !");
				checkOpenFormEditProduct = false;
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("mess", "Sửa sản phẩm thất bại !");
			} finally {
				session.close();
			}
			return "redirect://admin/control/manage-page.htm";
		}
		session = factory.getCurrentSession();
		hql = "FROM User";
		query = session.createQuery(hql);
		listUser = query.list();
		model.addAttribute("users", listUser); 
		
		session = factory.getCurrentSession();
		hql = "FROM Product";
		query = session.createQuery(hql);
		listProduct = query.list();
		model.addAttribute("products", listProduct); 
		
		model.addAttribute("Product", new Product()); //đưa form thêm về trạng thái trống
		model.addAttribute("checkOpenFormEditProduct", true); //mo form sua len để thông báo lỗi
		
		return "manage/manage-page";
	}
	
	//xoa tai khoan
	@RequestMapping("delete-user/{Id}")
	public String deleteUser(@PathVariable("Id") String Id, ModelMap model) {
			//tim san pham da chon
			User user = new User();
			for (User s : listUser) {
				if (s.getUsername().equals(Id))
					user = s;
			}
			session = factory.openSession();
			t = session.beginTransaction();
			try {
				session.delete(user);
				t.commit();

			} catch (Exception e) {
				t.rollback();
			} finally {
				session.close();
			}
			return "redirect://admin/control/manage-page.htm";
		}
	
	// =============== PRODUCTS ===============

	// load du lieu vao product.html
	@RequestMapping("product")
	public String product(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product r WHERE r.Room.id = 'GR001'";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list);
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("carts",listCart);
		return "product/product";
	}

	// load du lieu vao bedroom.html
	@RequestMapping("bedroom")
	public String bedroom(ModelMap model) {
		Session session1 = factory.getCurrentSession();
		String hql1 = "FROM Product r WHERE r.Room.id = 'BR003'";
		Query query1 = session1.createQuery(hql1);
		List<Product> list1 = query1.list();
		model.addAttribute("product_bedrooms", list1);
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("carts",listCart);
		
		return "product/bedroom";
	}

	// load du lieu vao guestroom.html
	
	@RequestMapping("guest-room")
	public String guestroom(ModelMap model) {
		Session session1 = factory.getCurrentSession();
		String hql1 = "FROM Product r WHERE r.Room.id = 'GR001'";
		Query query1 = session1.createQuery(hql1);
		List<Product> list1 = query1.list();
		model.addAttribute("product_guestrooms", list1);
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("carts",listCart);
		
		return "product/guest-room";
	}
	
	// load du lieu vao kitchenroom.html
	@RequestMapping("kitchen-room")
	public String kitchenroom(ModelMap model) {
		Session session1 = factory.getCurrentSession();
		String hql1 = "FROM Product r WHERE r.Room.id = 'CR002'";
		Query query1 = session1.createQuery(hql1);
		List<Product> list1 = query1.list();
		model.addAttribute("product_kitchenrooms", list1);
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("carts",listCart);
		return "product/kitchen-room";
	}

	// chi tiết sản phẩm
	@RequestMapping("detail/{Id}")
	public String detail(@PathVariable("Id") String Id, ModelMap model) {
		// tìm sản phẩm đang chọn
		for (Product s : listProduct) {
			if (s.getId().compareTo(Id) == 0){
				model.addAttribute("product", s);
				// Tìm sản phẩm cùng loại
				Session session2 = factory.getCurrentSession();
				String hql2 = "FROM Product r WHERE r.Room.id =:idRoom";
				Query query2 = session2.createQuery(hql2);
				query2.setParameter("idRoom", s.getRoom().getId());
				List<Product> list2 = query2.list();
				model.addAttribute("products", list2);
			}
				
		}
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("carts",listCart);
		
		return "product/detail";
	}
	
	//gio hang - cart
	@RequestMapping("cart")
	public String showCart(ModelMap model) {
		model.addAttribute("carts",listCart);
		
		float total_price = 0;
		for(Product s: listCart){
			total_price = total_price + s.getPrice();
		}
		model.addAttribute("total_price", total_price); 
		model.addAttribute("userMain", userMain); //thong tin tai khoan dang nhap
		model.addAttribute("User", userMain); //thong tin dat hang
		model.addAttribute("checkFalseOrderForm", false); //loi nhap dat hang
		model.addAttribute("notificationOrder", notificationOrder);
		
		return "product/cart";
	}
	
	//lich su mua hang
		@RequestMapping("history")
		public String history(ModelMap model) {
			
			//lay lai don hang cu
			List<Product> listHistory = new ArrayList<Product>();
			List<Order> listOrder = new ArrayList<Order>();
			Session session2 = factory.getCurrentSession();
			String hql2 = "FROM Order o WHERE o.User.username =:username AND o.bought =:bought";
			Query query2 = session2.createQuery(hql2);
			query2.setParameter("username", userMain.getUsername());
			query2.setParameter("bought", 1);
			listOrder = query2.list();
			
			if(listOrder.size() == 0)
				listHistory = new ArrayList<Product>();
			else{
				for(Order o: listOrder){
					Product p = new Product();
					for(Product s: listProduct){
						if(o.getProduct().getId().compareTo(s.getId())==0){
							p = s;
						}
					}
					listHistory.add(p);
				}
			}
			
			model.addAttribute("carts",listHistory);
			
			model.addAttribute("userMain", userMain); //thong tin tai khoan dang nhap
			model.addAttribute("User", userMain); //thong tin dat hang
			
			return "product/history";
		}
	
	//them vao gio hang
	@RequestMapping("cart/{Id}")
	public String insertToCart(@PathVariable("Id") String Id, ModelMap model) {
		int dem = 0;
		for(Product s1 : listCart){
			if(s1.getId().compareTo(Id) == 0){
				dem = 1;
				break;
			}	
		}
		if(dem==0){
			for(Product s : listProduct) {
				if (s.getId().compareTo(Id) == 0){
					listCart.add(s);
					break;
				}
			}
		}
		
		return "redirect:/index.htm";
	}
	
	//Dat hang
		@RequestMapping(value = "order", method = RequestMethod.POST, params = "order")
		public String order(ModelMap model,@ModelAttribute("User") User user, BindingResult errors) {
			if (user.getEmail().trim().length() == 0) {
				errors.rejectValue("email", "User", "Vui lòng nhập mail người nhận !");
			}
			if (user.getFullname().trim().length() == 0) {
				errors.rejectValue("fullname", "User", "Vui lòng nhập tên đầy đủ !");
			}
			if (user.getPhone().trim().length() == 0) {
				errors.rejectValue("phone", "User", "Vui lòng nhập số điện thoại !");
			} 
			if (user.getAddress().trim().length() == 0) {
				errors.rejectValue("password", "User", "Vui lòng nhập địa chỉ đầy đủ !");
			}
			if (errors.hasErrors()) {
				checkFalseOrderForm = true;
				notificationOrder = false;
				model.addAttribute("checkFalseOrderForm", checkFalseOrderForm);
			} else {
				List<Order> listOrder = new ArrayList<Order>();
				session = factory.getCurrentSession();
				hql = "FROM Order";
				query = session.createQuery(hql);
				listOrder = query.list();
				int id = listOrder.size() + 1;
				for(Product s: listCart){
					Order order = new Order();
					order.setId(id);
					order.setAmount(1);
					order.setUser(userMain);
					order.setProduct(s);
					order.setBought(1);
					
					//ghi don hang vao database
					session = factory.openSession();
					t = session.beginTransaction();
					try {
						session.save(order);
						model.addAttribute("message1", "ghi don hang thanh cong !");
						t.commit();
					} catch (Exception e) {
						t.rollback();
						model.addAttribute("message1", "ghi don hang loi !"+e);
					} finally {
						session.close();
					}
					id++;
				}
				
				//gui mail chuc mung
				String from = "hatruong2628@gmail.com";
				String to = user.getEmail();
				String subject = "Notification from Furniture Shop";
				String body ="Đơn hàng của bạn đã được xử lí!";	
				try {
					// Tạo mail
					MimeMessage mail = mailer.createMimeMessage();
					// Sử dụng lớp trợ giúp
					MimeMessageHelper helper = new MimeMessageHelper(mail);
					helper.setFrom(from, from);
					helper.setTo(to);
					helper.setReplyTo(from, from);
					helper.setSubject(subject);
					helper.setText(body, true);
					// Gửi mail
					mailer.send(mail);
					model.addAttribute("message", "Gửi email thành công !");
				} catch (Exception ex) {
					model.addAttribute("message", "Gửi email thất bại !"+ex);
				}
				
				checkFalseOrderForm = false;
				model.addAttribute("checkFalseRegestration", checkFalseRegestration);
				model.addAttribute("mess", "Đặt hàng thành công !");
				listCart = new ArrayList<Product>();
				
				notificationOrder = true;
				model.addAttribute("notificationOrder", notificationOrder);
				return "redirect:/cart.htm";
			}
			return "product/cart";
		}
	
	//Giảm sản phẩm trong giỏ hàng
	@RequestMapping("reduceCart/{Id}")
	public String reduceCart(@PathVariable("Id") String Id, ModelMap model) {
		//tim san pham da chon
		for (Product s : listCart) {
			if (s.getId().compareTo(Id) == 0){
				listCart.remove(listCart.indexOf(s));
				break;
			}
		}
		model.addAttribute("carts",listCart);
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("amount-cart", listCart.size());
		
		return "product/cart";
	}

	//============== CAC PHAN PHU ===============
	@RequestMapping("news")
	public String news(ModelMap model) {
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("amount-cart", listCart.size());
		return "product/product";
	}
	
	@RequestMapping("introduce")
	public String introduce(ModelMap model) {
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("amount-cart", listCart.size());
		return "introduce/introduce";
	}
	
	@RequestMapping("contact")
	public String contact(ModelMap model) {
		
		model.addAttribute("userMain", userMain); 
		model.addAttribute("User", User);//User tam de lay thong tin dang nhap
		model.addAttribute("checkLogin", false);//thong bao dang nhap thanh cong
		model.addAttribute("checkFalseLogin", checkFalseLogin); //loi nhap tai khoan
		model.addAttribute("checkRegestration", false);//thong bao dang ki thanh cong
		model.addAttribute("checkFalseRegestration", checkFalseRegestration); //loi nhap tai khoan dang ki
		model.addAttribute("amount-cart", listCart.size());
		return "contact/contact";
	}
}
