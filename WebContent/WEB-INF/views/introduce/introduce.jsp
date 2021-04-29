<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Introduce</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/dist/img/favicon.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/css-awesome/all.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/fontawesome-free-5.12.1-web/css/all.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
    />
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
								<div>
									<div class="infor-user flex j-between">
										<i><img src="${userMain.getPhoto()}"></i>
										<p>${userMain.getUsername()}</p>
									</div>
								</div>
							</c:if>

							<c:if test="${userMain.getUsername() == null }">
								<div>
									<div class="login-registration flex ">
										<i class="fas fa-sign-out-alt"></i>
										<ul>
											<li class="btn-login">Log in</li>
											<li class="btn-registration">Registration</li>
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
	<div class="container-login"
		style="display: ${checkFalseLogin?'block':'none'};">
		<div class="login">
			<form:form action="login.htm" modelAttribute="User">
				<div class="title flex j-between">
					<p>Đăng Nhập</p>
					<div class="close-login">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<div>
					<form:input path="username" placeholder="Tên đăng nhập" />
					<form:errors path="username" style="color:red;" />
				</div>
				<div>
					<form:input path="password" placeholder="Mật khẩu" />
					<form:errors path="password" style="color:red;" />
				</div>
				<div class="btn flex j-between">
					<button name="login" class="show-all">ĐĂNG NHẬP</button>
					<a href="#" class="show-all btn-login-second">ĐĂNG KÍ</a>
				</div>
			</form:form>
		</div>
	</div>

	<!-- Form đăng kí tài khoản -->
	<div class="container-registration"
		style="display: ${checkFalseRegestration?'block':'none'};">
		<div class="registration ">
			<form:form action="insert.htm" modelAttribute="User">
				<div class="title flex j-between">
					<p>Đăng Kí</p>
					<div class="close-registration">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<div>
					<form:input path="username" placeholder="Tên đăng nhập" />
					<form:errors path="username" style="color:red;" />
				</div>
				<div>
					<form:input path="fullname" placeholder="Họ và tên" />
					<form:errors path="fullname" style="color:red;" />
				</div>
				<div>
					<form:input path="email" placeholder="email" />
					<form:errors path="email" style="color:red;" />
				</div>
				<div>
					<form:input path="password" placeholder="Mật khẩu" />
					<form:errors path="password" style="color:red;" />
				</div>
				<div class="btn flex j-between">
					<a href="#" class="show-all btn-registration-second">ĐĂNG NHẬP</a>
					<button name="update" class="show-all">ĐĂNG KÍ</button>
				</div>
			</form:form>
		</div>
	</div>

	<!-- Thông báo đăng nhập -->
	<div class="notification-login"
		style="display: ${checkLogin?'block':'none'};">
		<div class="content-notifi">
			<div class="close-notification-login">
				<i class="fas fa-times"></i>
			</div>
			<p>Đăng nhập thành công!</p>
		</div>
	</div>

	<!-- Thông báo đăng kí -->
	<c:if test="${checkRegestration == true }">
		<div class="notification-registration">
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
						<a href="#">THÔNG TIN TÀI KHOẢN</a>
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
							<li>Họ Tên:
								<p>${userMain.getFullname()}</p>
							</li>
							<li>Email:
								<p>${userMain.getEmail()}</p>
							</li>
							<li>SDT:
								<p>${userMain.getPhone()}</p>
							</li>
							<li>Ngày Sinh:
								<p>${userMain.getBirthday()}</p>
							</li>
						</ul>
						<form:form action="logout.htm">
							<div class="flex j-between">

								<button class="btn btn-admin"
									style="display: ${userMain.getUsername().trim().equals('admin')?'block':'none'};">
									<span>Trang Quản Lí</span>
								</button>
								<button name="logout" class="btn btn-logout">
									<span>Đăng Xuất</span>
								</button>
								<button class="btn btn-close">
									<span>close</span>
								</button>

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
          <li>
            <a href="index.htm">Home page</a>
          </li>
          <li id="products-menu">
            <a href="product.htm" class="flex a-end"
              >Product <span class="down-icon"><i class="fas fa-angle-down"></i></span
            ></a>
            <div class="products">
              <div class="flex j-between">
                <div class="item-product">
                  <h2>Bedroom</h2>
                  <ul>
                    <li>Modern Bed</li>
                    <li>Cabinet in fronr of bed</li>
                    <li>Lamp</li>
                    <li>Decorative accessories</li>
                    <li>Luxurious sleeping cushions</li>
                    <li>Blankets, sheets, pollows</li>
                    <li>Wardrobe</li>
                  </ul>
                  <h2>Promotion products</h2>
                </div>
                <div class="item-product">
                  <h2>Living room</h2>
                  <ul>
                    <li>Sofa Set</li>
                    <li>Single Sofa</li>
                    <li>Tea table</li>
                    <li>TV shelf</li>
                    <li>High quality wooden chair</li>
                    <li>Backrest pillow</li>
                    <li>Tapestry</li>
                  </ul>
                  <h2>New product</h2>
                </div>
                <div class="item-product">
                  <h2>Kitchen</h2>
                  <ul>
                    <li>Dining tables and chairs</li>
                    <li>Wooden kitchen cabinets</li>
                    <li>Wall cupboard</li>
                    <li>Kitchen accessories</li>
                  </ul>
                  <h2>Featured products</h2>
                </div>
                <div class="item-product">
                  <img
                    src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/bn_mg.png?1586168599868"
                    alt="banan"
                  />
                </div>
              </div>
            </div>
          </li>
          <li>
            <a href="news.htm">News</a>
          </li>
          <li>
            <a href="introduce.htm">Introduce</a>
          </li>
          <li>
            <a href="contact.htm">Contact</a>
          </li>
        </ul>
      </div>
    </header>

    <section class="introduce">
      <div class="container">
        <div class="introduce-content">
          <h3>INTRODUCE</h3>
          <p>Ladies and gentlemen,</p>
          <p>
            During nearly 5 years of serving - exchanging - meeting with customers, there have been
            many times you are interested in the name "Mew Furniture" with a structure that evokes
            environmental friendliness and its meaning. A lot of affection for that name
          </p>
          <p>
            There is no name right from the thought of it being good. It is only close to people
            once the services and values ââbrought as well as its resonance in the hearts of users,
            through countless "difficulties and challenges" so that at some point it has in memory.
            of many people when searching for products and services, the Uu users think of that name
            first among many other names in the same business category. No exception, the name Mew
            Furniture, too, at first it was just a small idea "unlike anyone" of its owner in the
            beginning of painting and water.
          </p>
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
