<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>All products</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/dist/img/favicon.png" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/css-awesome/all.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/fontawesome-free-5.12.1-web/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
</head>
<body>
	<header class="header-basic">
		<div class="logo-main">
			<div class="container">
				<div class="row">
					<div class="items col-md-4">
						<div class="logo-left flex a-center j-between">
							<input type="text" id="search" placeholder="" /> <a href="#"><img
								src="http://bizweb.dktcdn.net/100/368/970/themes/740033/assets/search.png?1586168599868"
								alt="timkiem" /></a>
						</div>
					</div>

					<div class="items col-md-4 j-center">
						<a href="index.htm" class="logo-center"> <img
							src="http://bizweb.dktcdn.net/100/368/970/themes/740033/assets/logo.png?1586168599868"
							alt="logo" />
						</a>
					</div>

					<div class="items col-md-4 j-end">
						<div class="logo-right flex a-center j-end">
							<c:if test="${userMain.getUsername() !=null }">
							<ul class="multi-language">
								<li><a href="" data-lang="en"><img src="dist/img/English-Language-Flag.png"
											alt="photo"></a>
								<li>
								<li><a href="" data-lang="vi"><img src="dist/img/Vietnam-Flag-icon.png"
											alt="photo"></a>
								<li>
							</ul>
							<div>
								<div class="infor-user flex j-between" >
								<i><img src="${userMain.getPhoto()}"></i>
								<p>${userMain.getUsername()}</p>
								</div>
							</div>
							</c:if>

							<c:if test="${userMain.getUsername() == null }">
							<ul class="multi-language">
								<li><a href="" data-lang="en"><img src="dist/img/English-Language-Flag.png"
											alt="photo"></a>
								<li>
								<li><a href="" data-lang="vi"><img src="dist/img/Vietnam-Flag-icon.png"
											alt="photo"></a>
								<li>
							</ul>
							<div >
								<div class="login-registration flex " >
								<i class="fas fa-sign-out-alt"></i>
								<ul>
									<li class="btn-login"><s:message code="global.home.Login"/></li>
									<li class="btn-registration"><s:message code="global.home.Registration"/></li>
								</ul>
								</div>
							</div>
							</c:if>

							<div class="cart">
								<a href="cart.htm"> <i class="fas fa-cart-arrow-down"></i>
									<div class="giohang">
										<p>
											<s:message code="global.home.CartNotification" />
										</p>
									</div>
									<div class="amount-product">
										<span>${carts.size()}</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

<!-- Thông tin tài khoản -->
    <c:if test="${userMain.getUsername() != null }">
    <div class="container-detail-user">
      <div class="detail-user">
        <div class="title-user flex j-center">
          <span></span>
          <div class="parent-title">
            <a href="#"><s:message code="global.user.title"/></a>
          </div>
        </div>
        <div class="flex j-between">
          <div class="user-left">
            <img src="${userMain.getPhoto()}" alt="avatar">
          </div>
          <div class="user-right">
            <div class="username">
              <p>${userMain.getUsername()}</p>
            </div>
            <ul class="information-user">
              <li><s:message code="global.user.fullname"/> <p>${userMain.getFullname()}</p></li>
              <li><s:message code="global.user.email"/> <p>${userMain.getEmail()}</p></li>
              <li><s:message code="global.user.phone"/> <p>${userMain.getPhone()}</p></li>
              <li><s:message code="global.user.birthday"/> <p>${userMain.getAddress()}</p></li>
            </ul>
            <form:form action="manage.htm" >
            <div class="flex j-between">
            
              <button name="manage-page" class="btn btn-admin" style ="display: ${userMain.getUsername().trim().equals('admin')?'block':'none'};"><span><s:message code="global.user.btnAdmin"/></span></button>
              <button name="logout" class="btn btn-logout"><span><s:message code="global.user.btnLogout"/></span></button>
              <button class="btn btn-close"><span><s:message code="global.user.btnClose"/></span></button>
            
            </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
    </c:if>
	
	<header class="nav-main">
		<div class="container">
			<ul class="flex j-center">
				<li><a href="index.htm"><s:message code="global.home.Homepage"/></a></li>
				<li id="products-menu"><a href="product.htm" class="flex a-end"><s:message code="global.home.Product"/>
						<span class="down-icon"><i class="fas fa-angle-down"></i></span>
				</a>
					<div class="products">
						<div class="flex j-between">
							<div class="item-product">
								<h2><s:message code="global.bedroom.title"/></h2>
								<ul>
									<li><s:message code="global.bedroom.type1"/></li>
									<li><s:message code="global.bedroom.type2"/></li>
									<li><s:message code="global.bedroom.type3"/></li>
									<li><s:message code="global.bedroom.type4"/></li>
									<li><s:message code="global.bedroom.type5"/></li>
									<li><s:message code="global.bedroom.type6"/></li>
									<li><s:message code="global.bedroom.type7"/></li>
								</ul>
							</div>
							<div class="item-product">
								<h2><s:message code="global.guestroom.title"/></h2>
								<ul>
									<li><s:message code="global.guestroom.type1"/></li>
									<li><s:message code="global.guestroom.type2"/></li>
									<li><s:message code="global.guestroom.type3"/></li>
									<li><s:message code="global.guestroom.type4"/></li>
									<li><s:message code="global.guestroom.type5"/></li>
									<li><s:message code="global.guestroom.type6"/></li>
									<li><s:message code="global.guestroom.type7"/></li>
								</ul>
							</div>
							<div class="item-product">
								<h2><s:message code="global.kitchenroom.title"/></h2>
								<ul>
									<li><s:message code="global.kitchenroom.type1"/></li>
									<li><s:message code="global.kitchenroom.type2"/></li>
									<li><s:message code="global.kitchenroom.type3"/></li>
									<li><s:message code="global.kitchenroom.type4"/></li>
								</ul>
								<h2><s:message code="global.product.featured"/></h2>
							</div>
							<div class="item-product">
								<img
									src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/bn_mg.png?1586168599868"
									alt="banan" />
							</div>
						</div>
					</div></li>
				<li><a href="news.htm"><s:message code="global.home.News"/></a></li>
				<li><a href="introduce.htm"><s:message code="global.home.Introduce"/></a></li>
				<li><a href="contact.htm"><s:message code="global.home.Contact"/></a></li>
			</ul>
		</div>
	</header>

    <section class="manage">
      <div class="container">
        <div class="cart-infor">
          <div class="nav-manage flex j-center">
            <a id="manage-product" style="width: 15%;" href="#">Sản Phẩm</a>
            <a id="manage-user" style="width: 15%;" href="#">Tài Khoản</a>
            <a style="width: 15%;" href="#">Loại Sản Phẩm</a>
            <a style="width: 15%;" href="#">Nhà Cung Cấp</a>
          </div>
          <div class="manage-product">
            <div class="cart-title flex">
              <div style="width: 10%;">Mã Sản Phẩm</div>
              <div style="width: 15%;">Ảnh Sản Phẩm</div>
              <div style="width: 20%;">Tên Sản Phẩm</div>
              <div style="width: 10%;">Giá</div>
              <div style="width: 10%;">Giá Cũ</div>
              <div style="width: 10%;">Số Lượng Tồn</div>
              <div style="width: 10%;">Mã Loại</div>
              <div style="width: 10%;">Nhà SX</div>
              <div style="width: 5%;">Xoá</div>
            </div>
            <c:forEach var="s" items="${products}">
            <div class="cart-content flex">
              <div style="width: 10%;">${s.id}</div>
              <div style="width: 15%;"><a href=""><img src="${s.photo}" alt=""></a></div>
              <div style="width: 20%;"><a href="#">${s.name}</a></div>
              <div style="width: 10%;"><span><fmt:formatNumber value="${s.price}" type="currency" pattern = "###,###,### USD"/></span></div>
              <div style="width: 10%;"><span><fmt:formatNumber value="${s.oldPrice }" type="currency" pattern = "###,###,### USD"/></span></div>
              <div style="width: 10%;">${s.amount}</div>
              <div style="width: 10%;">${s.getRoom().getId() }</div>
              <div style="width: 10%;">${s.getProducer().getId() }</div>
              <div style="width: 5%;">
                <a href="edit-product/${s.id }.htm"><Span><i class="fas fa-pen-square"></i></Span></a>
                <a href="delete-product/${s.id }.htm"><Span><i class="far fa-times-circle"></i></Span></a>
              </div>
            </div>
            </c:forEach>
            <div class="btn-add-product">
            	<div style="width: 15%;">Thêm Sản Phẩm</div>
            </div>
          </div>
          <div class="manage-user">
            <div class="cart-title flex">
              <div style="width: 15%;">Username</div>
              <div style="width: 20%;">Photo</div>
              <div style="width: 15%;">Password</div>
              <div style="width: 15%;">Fullname</div>
              <div style="width: 15%;">Email</div>
              <div style="width: 10%;">Phone</div>
              <div style="width: 10%;">Xoá</div>
            </div>
            <c:forEach var="u" items="${users}">
            <div class="cart-content flex">
              <div style="width: 15%;">${u.username}</div>
              <div style="width: 20%;"><a href="#"><img src="${u.photo}" alt=""></a></div>
              <div style="width: 15%;">********</div>
              <div style="width: 15%;">${u.fullname}</div>
              <div style="width: 15%;">${u.email}</div>
              <div style="width: 10%;">${u.phone}</div>
              <div style="width: 10%;">
                <!-- <Span><i class="far fa-times-circle"></i></Span> -->
                <a href="delete-user/${u.username }.htm"><Span><i class="far fa-times-circle"></i></Span></a>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </section>

<!-- Form thêm sản phẩm -->
    <div class="form-product" style ="display: ${checkFasleUpdateProduct?'block':'none'};">
      <div class="registration " >
      	<form:form action="insert-product.htm" modelAttribute="Product" >
        <div class="title flex j-between">
          <p>THÔNG TIN SẢN PHẨM THÊM</p>
          <div class="close-form-product">
            <i class="fas fa-times"></i>
          </div>
        </div>
        <div>
          <form:input path="id" placeholder="Mã sản phẩm"/>
          <form:errors path="id" style="color:red;" />
        </div>
        <div>
          <form:input path="name" placeholder="Tên sản phẩm"/>
          <form:errors path="name" style="color:red;"/>
        </div>
        <div>
          <form:input path="price" placeholder="Giá"/>
          <form:errors path="price" style="color:red;"/>
        </div>
        <div>
          <form:input path="oldPrice" placeholder="Giá cũ"/>
          <form:errors path="oldPrice" style="color:red;"/>
        </div>
        <div>
          <p>Chọn ảnh sản phẩm</p>
          <form:input path="photo" type="file"/>
          <form:errors path="photo" style="color:red;"/>
        </div>
        <div>
          <form:input path="amount" placeholder="Số lượng tồn"/>
          <form:errors path="amount" style="color:red;"/>
        </div>
        <div>
          <form:input path="room.id" placeholder="Id loại sản phẩm"/>
          <form:errors path="room.id" style="color:red;"/>
        </div>
        <div>
          <form:input path="producer.id" placeholder="Id nhà cung cấp"/>
          <form:errors path="producer.id" style="color:red;"/>
        </div>
        <div class="btn flex j-center">
          <button name="insert" class="show-all">Thêm Sản Phẩm</button>
        </div>
        </form:form>
      </div>
    </div>

<!-- Form sửa sản phẩm -->
    <div class="edit-form-product" style ="display: ${checkOpenFormEditProduct?'block':'none'};">
      <div class="registration " >
      	<form:form action="edit-product.htm" modelAttribute="ProductEdit" >
        <div class="title flex j-between">
          <p>SỬA THÔNG TIN SẢN PHẨM</p>
          <div class="close-edit-form-product">
            <i class="fas fa-times"></i>
          </div>
        </div>
        <div>
          <form:input path="name" placeholder="Tên sản phẩm"/>
          <form:errors path="name" style="color:red;"/>
        </div>
        <div>
          <form:input path="price" placeholder="Giá"/>
          <form:errors path="price" style="color:red;"/>
        </div>
        <div>
          <form:input path="oldPrice" placeholder="Giá cũ"/>
          <form:errors path="oldPrice" style="color:red;"/>
        </div>
        <div>
          <form:input path="amount" placeholder="Số lượng tồn"/>
          <form:errors path="amount" style="color:red;"/>
        </div>
        <div>
          <form:input path="room.id" placeholder="Id loại sản phẩm"/>
          <form:errors path="room.id" style="color:red;"/>
        </div>
        <div>
          <form:input path="producer.id" placeholder="Id nhà cung cấp"/>
          <form:errors path="producer.id" style="color:red;"/>
        </div>
        <div class="btn flex j-center">
          <!-- <button name="insert" class="show-all">Thêm Sản Phẩm</button> -->
          <button name="edit" class="show-all">Lưu Thay Đổi</button>
        </div>
        </form:form>
      </div>
    </div> 
    
<!-- Thông báo đạt hàng thành công -->
    <div class="notification-login" style ="display: ${notificationFalse?'block':'none'};">
      <div class="content-notifi">
        <div class="close-notification-login">
          <i class="fas fa-times"></i>
        </div>
        <p>Sản phẩm đã có trong đơn hàng không thể xoá!</p>
      </div>
    </div>

	<section class="footer">
		<div class="container">
			<div class="row">
				<div class="nav-footer col-md-3">
					<div class="item-nav-footer">
						<h3><s:message code="global.Policy.title"/></h3>
						<ul>
							<li><s:message code="global.Policy.policy1"/></li>
							<li><s:message code="global.Policy.policy2"/></li>
							<li><s:message code="global.Policy.policy3"/></li>
							<li><s:message code="global.Policy.policy4"/></li>
							<li><s:message code="global.Policy.policy5"/></li>
						</ul>
					</div>
				</div>
				<div class="nav-footer col-md-3">
					<div class="item-nav-footer">
						<h3><s:message code="global.channel.title"/></h3>
						<ul>
							<li>Sendo</li>
							<li>Zalo</li>
							<li>Tiki</li>
							<li>Shopee</li>
							<li>Lazada</li>
						</ul>
					</div>
				</div>
				<div class="nav-footer col-md-3">
					<div class="item-nav-footer">
						<h3><s:message code="global.aboutUs.title"/></h3>
						<ul>
							<li><s:message code="global.aboutUs.policy1"/></li>
							<li><s:message code="global.aboutUs.policy2"/></li>
							<li><s:message code="global.aboutUs.policy3"/></li>
							<li><s:message code="global.aboutUs.policy4"/></li>
							<li><s:message code="global.aboutUs.policy5"/></li>
						</ul>
					</div>
				</div>
				<div class="nav-footer col-md-3">
					<div class="item-nav-footer">
						<h3><s:message code="global.contact.title"/></h3>
						<ul>
							<li><span><img
									src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/on-maps.png?1586168599868"
									alt="icon" /></span> 442 Doi Can - Ba Dinh - Hanoi</li>
							<li><span><img
									src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/old-phone.png?1586168599868"
									alt="icon" /></span> (04) 6674 2332</li>
							<li><span><img
									src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/email-envelope.png?1586168599868"
									alt="icon" /></span> support@sapo.vn</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="footer-introduce">
		<div class="container">
			<div class="footer-logo-parrent">
				<a href="#"><img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/logo.png?1586168599868"
					alt="logo" /></a>
			</div>
			<p><s:message code="global.introduce.content"/></p>
			<div class="parrent-icon">
				<img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/facebook.png?1586168599868"
					alt="facebook" /> <img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/twitter.png?1586168599868"
					alt="tiwter" /> <img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/instagram.png?1586168599868"
					alt="instagram" /> <img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/youtube.png?1586168599868"
					alt="youtobe" />
			</div>
			<div>
				<img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-1.png?1586168599868"
					alt="pto1" /> <img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-2.png?1586168599868"
					alt="pto2" /> <img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-3.png?1586168599868"
					alt="pto3" /> <img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-4.png?1586168599868"
					alt="pto3" />
			</div>
		</div>
	</section>

	<section class="end">
		<div class="container">
			<p>
				Coppyright belongs to <span>MewTheme</span> . Provided by <span>Sapo</span>
			</p>
		</div>
	</section>

	<div class="contact-us">
		<ul>
			<li><a href="#"><img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/telephone.png?1586168599868"
					alt="call" /></a></li>
			<li><a href="#"><img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/messenger.png?1586168599868"
					alt="mess" /></a></li>
			<li><a href="#"><img
					src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/zalo_des.png?1586168599868"
					alt="zalo" /></a></li>
		</ul>
	</div>

	<div class="totop">
		<span><i class="fas fa-chevron-up icon-totop"></i></span>
	</div>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/scripts.js"></script>
</html>