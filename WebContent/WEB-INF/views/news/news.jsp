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
              <li><s:message code="global.user.birthday"/> <p>${userMain.getBirthday()}</p></li>
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

    <section class="news">
      <div class="container">
        <div class="news-content flex">
          <div class="list-news">
            <h2>NEWS</h2>
            <div class="item-news flex">
              <a href="#">
                <img
                  src="https://bizweb.dktcdn.net/100/368/970/articles/noi-that-go-phong-an-nha-bep-650x339.jpg?v=1574743950557"
                  alt="photo"
                />
              </a>
              <div class="title-item-news">
                <a href="#"> Beautiful interior space with high quality wood</a>
                <p>11/26/2019</p>
                <p>
                  Wood is a familiar material and close to the life of the Vietnamese from past to
                  present. Therefore, the decoration is not ...
                </p>
              </div>
            </div>
            <div class="item-news flex">
              <a href="#">
                <img
                  src="https://bizweb.dktcdn.net/100/368/970/articles/tan-trang-noi-that-phong-ngu-dep-650x339.jpg?v=1574743741250"
                  alt="photo"
                />
              </a>
              <div class="title-item-news">
                <a href="#">
                  Refurbished beautiful bedrooms with high-end furniture at the end of the year</a
                >
                <p>11/26/2019</p>
                <p>
                  With only a few more months to end, this is the time when people are interested in
                  furniture and ...
                </p>
              </div>
            </div>
            <div class="item-news flex">
              <a href="#">
                <img
                  src="https://bizweb.dktcdn.net/100/368/970/articles/picture7-650x339.png?v=1574743108017"
                  alt="photo"
                />
              </a>
              <div class="title-item-news">
                <a href="#"> Exquisite and luxurious living room design</a>
                <p>11/26/2019</p>
                <p>
                  Living room design geared towards sophistication and respect for homeowners
                  solutions ...
                </p>
              </div>
            </div>
            <div class="item-news flex">
              <a href="#">
                <img
                  src="https://bizweb.dktcdn.net/100/368/970/articles/tin-tuc-650x339.jpg?v=1574743375003"
                  alt="photo"
                />
              </a>
              <div class="title-item-news">
                <a href="#">
                  Indoor locker room (Closet) - Living space should have for modern women</a
                >
                <p>11/26/2019</p>
                <p>
                  âModern women, on the street, have to dress like a princess and live like a
                  goddess, the queen of life ...
                </p>
              </div>
            </div>
            <div class="item-news flex">
              <a href="#">
                <img
                  src="https://bizweb.dktcdn.net/100/368/970/articles/noi-that-phong-khach-nhap-khau-dep4-650x339.jpg?v=1574742714653"
                  alt="photo"
                />
              </a>
              <div class="title-item-news">
                <a href="#"> Imported living room furniture is popular in 2019</a>
                <p>11/26/2019</p>
                <p>
                  If the house is a certain individual, the living room space is the appearance and
                  interior of ...
                </p>
              </div>
            </div>
            <div class="item-news flex">
              <a href="#">
                <img
                  src="https://bizweb.dktcdn.net/100/368/970/articles/6-650x339.jpg?v=1574742415567"
                  alt="photo"
                />
              </a>
              <div class="title-item-news">
                <a href="#"> Design modern kitchen 2020</a>
                <p>11/26/2019</p>
                <p>
                  Feng shui kitchen is very important for the promotion, fortune and health of the
                  city ...
                </p>
              </div>
            </div>
          </div>

          <div class="right-news">
            <div class="nav-right-news">
              <h2 class="title-nav-right-news">News item</h2>
              <ul>
                <li><a href="#">Home page</a></li>
                <li class="flex j-between">
                  <a href="#">Product</a><span><i class="fas fa-plus"></i></span>
                </li>
                <li><a href="#">News</a></li>
                <li><a href="#">Introduce</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>

            <div class="other-posts-news">
              <h3>Other posts</h3>
              <div class="item-other-posts-news flex">
                <a href="#"
                  ><img
                    src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/noi-that-go-phong-an-nha-bep-650x339.jpg?v=1574743950557"
                    alt="photo other posts"
                /></a>
                <div class="title-other-posts">
                  <a href="#">Beautiful interior space with high ...</a>
                  <p>11/26/2019</p>
                </div>
              </div>
              <div class="item-other-posts-news flex">
                <a href="#"
                  ><img
                    src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/tan-trang-noi-that-phong-ngu-dep-650x339.jpg?v=1574743741250"
                    alt="photo other posts"
                /></a>
                <div class="title-other-posts">
                  <a href="#">Refurbished beautiful bedroo...</a>
                  <p>11/26/2019</p>
                </div>
              </div>
              <div class="item-other-posts-news flex">
                <a href="#"
                  ><img
                    src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/tin-tuc-650x339.jpg?v=1574743375003"
                    alt="photo other posts"
                /></a>
                <div class="title-other-posts">
                  <a href="#">Indoor locker room (Closet) - Living...</a>
                  <p>11/26/2019</p>
                </div>
              </div>
              <div class="item-other-posts-news flex">
                <a href="#"
                  ><img
                    src="https://bizweb.dktcdn.net/thumb/large/100/368/970/articles/picture7-650x339.png?v=1574743108017"
                    alt="photo other posts"
                /></a>
                <div class="title-other-posts">
                  <a href="#">Exquisite and luxurious living...</a>
                  <p>11/26/2019</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="footer">
      <div class="container">
        <div class="row">
          <div class="nav-footer col-md-3">
            <div class="item-nav-footer">
              <h3>Policy</h3>
              <ul>
                <li>Return policy</li>
                <li>Shipping policy</li>
                <li>Warranty policy</li>
                <li>Purchase policy</li>
                <li>Installment policy</li>
              </ul>
            </div>
          </div>
          <div class="nav-footer col-md-3">
            <div class="item-nav-footer">
              <h3>Sales Channel</h3>
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
              <h3>About us</h3>
              <ul>
                <li>Home page</li>
                <li>Product</li>
                <li>News</li>
                <li>Introduce</li>
                <li>Contact</li>
              </ul>
            </div>
          </div>
          <div class="nav-footer col-md-3">
            <div class="item-nav-footer">
              <h3>Contact</h3>
              <ul>
                <li>
                  <span
                    ><img
                      src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/on-maps.png?1586168599868"
                      alt="icon"
                  /></span>
                  442 Doi Can - Ba Dinh - Hanoi
                </li>
                <li>
                  <span
                    ><img
                      src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/old-phone.png?1586168599868"
                      alt="icon"
                  /></span>
                  (04) 6674 2332
                </li>
                <li>
                  <span
                    ><img
                      src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/email-envelope.png?1586168599868"
                      alt="icon"
                  /></span>
                  support@sapo.vn
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="footer-introduce">
      <div class="container">
        <div class="footer-logo-parrent">
          <a href="#"
            ><img
              src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/logo.png?1586168599868"
              alt="logo"
          /></a>
        </div>
        <p>
          MewMew Investment Joint Stock Company is the No. 1 retailer in Vietnam in terms of revenue
          and profit, with a network of more than 2,200 stores nationwide. MewMew operates chain
          stores - restaurants MewFurniture, MewNature, MewINT, MewCoffee. In addition, MewMew has
          expanded to overseas markets of Mew Furniture furniture chain in Southeast Asian
          countries.
        </p>
        <div class="parrent-icon">
          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/facebook.png?1586168599868"
            alt="facebook"
          />

          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/twitter.png?1586168599868"
            alt="tiwter"
          />

          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/instagram.png?1586168599868"
            alt="instagram"
          />

          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/youtube.png?1586168599868"
            alt="youtobe"
          />
        </div>
        <div>
          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-1.png?1586168599868"
            alt="pto1"
          />
          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-2.png?1586168599868"
            alt="pto2"
          />
          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-3.png?1586168599868"
            alt="pto3"
          />
          <img
            src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/payment-4.png?1586168599868"
            alt="pto3"
          />
        </div>
      </div>
    </section>

    <section class="end">
      <div class="container">
        <p>Coppyright belongs to <span>MewTheme</span> . Provided by <span>Sapo</span></p>
      </div>
    </section>

    <div class="contact-us">
      <ul>
        <li>
          <a href="#"
            ><img
              src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/telephone.png?1586168599868"
              alt="call"
          /></a>
        </li>
        <li>
          <a href="#"
            ><img
              src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/messenger.png?1586168599868"
              alt="mess"
          /></a>
        </li>
        <li>
          <a href="#"
            ><img
              src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/zalo_des.png?1586168599868"
              alt="zalo"
          /></a>
        </li>
      </ul>
    </div>

    <div class="totop">
      <span><i class="fas fa-chevron-up icon-totop"></i></span>
    </div>
  </body>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/dist/js/scripts.js"></script>
</html>
