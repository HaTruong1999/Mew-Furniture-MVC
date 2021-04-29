<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>All products</title>
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

<!-- Form đăng nhập -->
    <div class="container-login" style ="display: ${checkFalseLogin?'block':'none'};">
      <div class="login">
      <form:form action="login.htm" modelAttribute="User" >
        <div class="title flex j-between">
          <p><s:message code="global.login.title"/></p>
          <div class="close-login">
            <i class="fas fa-times"></i>
          </div>
        </div>
        <div>
          <form:input path="username" placeholder="username"/>
          <form:errors path="username" style="color:red;" />
        </div>
        <div>
          <form:input path="password" placeholder="password"/>
          <form:errors path="password" style="color:red;"/>
        </div>
        <div class="btn flex j-between">
          <button name="login" class="show-all"><s:message code="global.login.btnLogin"/></button>
          <a href="#" class="show-all btn-login-second"><s:message code="global.login.btnRegistration"/></a>
        </div>
      </form:form>
      </div>
    </div>

<!-- Form đăng kí tài khoản -->
    <div class="container-registration" style ="display: ${checkFalseRegestration?'block':'none'};">
      <div class="registration " >
      	<form:form action="insert.htm" modelAttribute="User" >
        <div class="title flex j-between">
          <p><s:message code="global.Registration.title"/></p>
          <div class="close-registration">
            <i class="fas fa-times"></i>
          </div>
        </div>
        <div>
          <form:input path="username" placeholder="username"/>
          <form:errors path="username" style="color:red;" />
        </div>
        <div>
          <form:input path="fullname" placeholder="fullname"/>
          <form:errors path="fullname" style="color:red;"/>
        </div>
        <div>
          <form:input path="email" placeholder="email"/>
          <form:errors path="email" style="color:red;"/>
        </div>
        <div>
          <form:input path="password" placeholder="password"/>
          <form:errors path="password" style="color:red;"/>
        </div>
        <div class="btn flex j-between">
          <a href="#" class="show-all btn-registration-second"><s:message code="global.Registration.btnLogin"/></a>
          <button name="update" class="show-all"><s:message code="global.Registration.btnRegistration"/></button>
        </div>
        </form:form>
      </div>
    </div>

<!-- Thông báo đăng nhập -->
    <div class="notification-login" style ="display: ${checkLogin?'block':'none'};" >
      <div class="content-notifi">
        <div class="close-notification-login">
          <i class="fas fa-times"></i>
        </div>
        <p>Đăng nhập thành công!</p>
      </div>
    </div>
    
<!-- Thông báo đăng kí -->
	<c:if test="${checkRegestration == true }">
	<div class="notification-registration" >
      <div class="content-notifi">
        <div class="close-notification-registration">
          <i class="fas fa-times"></i>
        </div>
        <p>Đăng kí tài khoản thành công!</p>
      </div>
    </div>
	</c:if>

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
            <form:form action="logout.htm" >
            <div class="flex j-between">
            
              <button class="btn btn-admin" style ="display: ${userMain.getUsername().trim().equals('admin')?'block':'none'};"><span><s:message code="global.user.btnAdmin"/></span></button>
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

	<section class="product">
		<div class="container">
			<div class="product-content">
				<h3>Product fillters</h3>
				<i>Help filter the product you are looking for quickly</i>
				<div class="filter-by-content">
					<div class="tiltle-filter-by flex j-between">
						<h3>FILTER BY:</h3>
						<p class="remove-all-filter">Remove all</p>
					</div>
					<ul class="list-filter-by flex"></ul>
				</div>
				<div class="product-filter flex">
					<div class="list-item-filter-chose">
						<div name-list="producer" class="item-filter-chose flex j-between"
							href="#">
							<p class="title-filter">Producer</p>
							<span><i class="fas fa-caret-down"></i></span>
						</div>
						<ul id="producer" class="list-suggestion-filters"
							style="display: none;">
							<li>Mew Furniture</li>
							<li>MILANO CERRAMIC</li>
							<li>MF Key</li>
						</ul>
					</div>
					<div class="list-item-filter-chose">
						<div name-list="price" class="item-filter-chose flex j-between"
							href="#">
							<p class="title-filter">Filter prices</p>
							<span><i class="fas fa-caret-down"></i></span>
						</div>
						<ul id="price" class="list-suggestion-filters"
							style="display: none;">
							<li id="Priceunder100USD">Price under 100 USD</li>
							<li id="100USD200USD">100 USD - 200 USD</li>
							<li id="200USD500USD">200 USD - 500 USD</li>
							<li id="Priceover500USD">Price over 500 USD</li>
						</ul>
					</div>
				</div>
				<div class="all-products">
					<div class="tittle-all-products flex j-between">
						<h3>All products</h3>
						<div class="sort-all-products">
							<div class="sort-by flex j-between" href="#">
								<p class="title-filter">Order</p>
								<span><i class="fas fa-caret-down"></i></span>
							</div>
							<ul id="sort-by" class="list-suggestion-filters"
								style="display: none;">
								<li>A -> Z</li>
								<li>Z -> A</li>
								<li>Price is increasing</li>
								<li>Price descending</li>
								<li>Latest products</li>
								<li>Oldest products</li>
							</ul>
						</div>
					</div>
					<div class="all-products-content">
						<div class="row">
							<c:forEach var="s" items="${products}">
								<div class="item-products col-md-3">
									<a href="#"><img src="${s.photo}" alt="#" /></a>
									<div class="detail-purchase">
										<a class="detail-purchase-item detail-purchase-item-left"
											href="#">Detail</a> <a
											class="detail-purchase-item detail-purchase-item-right"
											href="#">Purchase</a>
									</div>
									<div class="content-item-featured">
										<a href="#">${s.name}</a>
										<h4>${s.price}
											USD <span> ${s.oldPrice} USD</span>
										</h4>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="handbook-experience">
		<div class="container">
			<div class="content-handbook-experience flex j-between">
				<div class="home-handbook">
					<div class="title-room">
						<div class="parent-title">
							<a href="#"><s:message code="global.handbook.title"/></a>
						</div>
						<span></span>
					</div>
					<div class="content-home-handbook">
						<div id="slide-home-handbook"
							class="list-home-handbook owl-carousel">
							<div class="item-home-handbook">
								<a href="#"> <img
									src="https://bizweb.dktcdn.net/100/368/970/articles/noi-that-go-phong-an-nha-bep-650x339.jpg?v=1574743950557"
									alt="abc" />
								</a>
								<div class="content-item-home-handbook">
									<a href="#"><s:message code="global.handbook.post1"/></a>
									<p><s:message code="global.handbook.content1"/></p>
								</div>
							</div>
							<div class="item-home-handbook">
								<a href="#"> <img
									src="https://bizweb.dktcdn.net/100/368/970/articles/noi-that-phong-khach-nhap-khau-dep4-650x339.jpg?v=1574742714653"
									alt="abc" />
								</a>
								<div class="content-item-home-handbook">
									<a href="#"><s:message code="global.handbook.post1"/></a>
									<p><s:message code="global.handbook.content1"/></p>
								</div>
							</div>
						</div>
						<div class="parent-show-all">
							<a href="#" class="show-all"><s:message code="global.handbook.btnView"/></a>
						</div>
					</div>
				</div>

				<div class="experience">
					<div class="title-room">
						<div class="parent-title">
							<a href="#"><s:message code="global.experience.title"/></a>
						</div>
						<span></span>
					</div>
					<div id="slide-experience"
						class="list-content-experience owl-carousel">
						<div class="item-content-experience">
							<p><s:message code="global.experience.post1"/></p>
							<img
								src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/ykkh_1.jpg?1586168599868"
								alt="avt" />
						</div>
						<div class="item-content-experience">
							<p><s:message code="global.experience.post1"/></p>
							<img
								src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/ykkh_2.jpg?1586168599868"
								alt="avt" />
						</div>
						<div class="item-content-experience">
							<p><s:message code="global.experience.post1"/></p>
							<img
								src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/ykkh_3.jpg?1586168599868"
								alt="avt" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="knowledge">
		<div class="container">
			<div class="content-knowledge">
				<div class="title-knowledge">
					<div class="parent-title">
						<a href="#"><s:message code="global.knowledge.title"/></a>
					</div>
					<span></span>
				</div>
				<div class="row">
					<div class="item-knowledge col-md-4">
						<div class="content-item-knowledge">
							<div class="head-item-knowledge">
								<a href="#">
									<div class="img-head-item-knowledge">
										<img
											src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/noi-that-go-phong-an-nha-bep-650x339.jpg?v=1574743950557"
											alt="photo" />
									</div>
								</a>
							</div>
							<a class="title-item-knowledge" href="#"><s:message code="global.knowledge.post1"/></a>
							<p><s:message code="global.knowledge.content1"/></p>
						</div>
					</div>
					<div class="item-knowledge col-md-4">
						<div class="content-item-knowledge">
							<div class="head-item-knowledge">
								<a href="#"><img
									src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/tan-trang-noi-that-phong-ngu-dep-650x339.jpg?v=1574743741250"
									alt="photo" /></a>
							</div>
							<a class="title-item-knowledge" href="#"><s:message code="global.knowledge.post2"/></a>
							<p><s:message code="global.knowledge.content2"/></p>
						</div>
					</div>
					<div class="item-knowledge col-md-4">
						<div class="content-item-knowledge">
							<div class="head-item-knowledge">
								<a href="#"><img
									src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/tin-tuc-650x339.jpg?v=1574743375003"
									alt="photo" /></a>
							</div>
							<a class="title-item-knowledge" href="#"><s:message code="global.knowledge.post3"/></a>
							<p><s:message code="global.knowledge.content3"/></p>
						</div>
					</div>
					<div class="item-knowledge col-md-4">
						<div class="content-item-knowledge">
							<div class="head-item-knowledge">
								<a href="#"><img
									src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/picture7-650x339.png?v=1574743108017"
									alt="photo" /></a>
							</div>
							<a class="title-item-knowledge" href="#"><s:message code="global.knowledge.post4"/></a>
							<p><s:message code="global.knowledge.content4"/></p>
						</div>
					</div>
					<div class="item-knowledge col-md-4">
						<div class="content-item-knowledge">
							<div class="head-item-knowledge">
								<a href="#"><img
									src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/noi-that-phong-khach-nhap-khau-dep4-650x339.jpg?v=1574742714653"
									alt="photo" /></a>
							</div>
							<a class="title-item-knowledge" href="#"><s:message code="global.knowledge.post5"/></a>
							<p><s:message code="global.knowledge.content5"/></p>
						</div>
					</div>
					<div class="item-knowledge col-md-4">
						<div class="content-item-knowledge">
							<div class="head-item-knowledge">
								<a href="#"><img
									src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/6-650x339.jpg?v=1574742415567"
									alt="photo" /></a>
							</div>
							<a class="title-item-knowledge" href="#"><s:message code="global.knowledge.post6"/></a>
							<p><s:message code="global.knowledge.content6"/></p>
						</div>
					</div>
				</div>
				<div class="parent-show-all">
					<a href="#" class="show-all"><s:message code="global.handbook.btnView"/></a>
				</div>
			</div>
		</div>
	</section>

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