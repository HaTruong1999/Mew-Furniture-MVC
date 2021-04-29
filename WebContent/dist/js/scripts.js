$(function () {
	 //Quên mật khẩu - cấp lại mật khẩu
	// mở form lấy lại mật khẩu
	  $(".btn-open-get-pass").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".container-login").hide();
	    $(".notification-login").hide();
	    $(".container-get-password").show(300);
	  });
	  // đóng form lấy lại mật khẩu
	  $(".close-get-password").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".container-get-password").hide(300);
	  });
	 //form- đặt hàng
	  $(".btn-oder").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".form-product-order").show(300);
	  });

	  $(".close-form-product-order").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".form-product-order").hide(300);
	  });
	//form-add-product
	  $(".btn-add-product").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".form-product").show(300);
	  });

	  $(".close-form-product").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".form-product").hide(300);
	  });
	  
	  $(".close-edit-form-product").click(function (e) {
		    e.preventDefault();
		    e.stopPropagation();
		    $(".edit-form-product").hide(300);
	  });
	  //manage-page
	  $("#manage-product").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".manage-user").hide(300);
	    $(".manage-product").show(300);
	    $(this).css("background-color", "red");
	    $("#manage-user").css("background-color", "#ff7600");
	  });

	  $("#manage-user").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".manage-product").hide(300);
	    $(".manage-user").show(300);
	    $(this).css("background-color", "red");
	    $("#manage-product").css("background-color", "#ff7600");
	  });
	//multi-language
	$("a[data-lang]").click(function() {
		var lang = $(this).attr("data-lang");
		$.get("home/index.htm?language=" + lang, function() {
			location.reload();
		});
		return false;
	});
	//information-user
	  $(".infor-user").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".container-detail-user").show(300);
	  });

	  $(".btn-close").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".container-detail-user").hide(200);
	  });
	//Login-Registration
	  // mở form đăng nhập
	  $(".btn-login").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    console.log("dang click mo dang nhap 123")
	    $(".container-login").show(300);
	    $(".notification-login").hide();
	    //$(".container-get-password").hide(300);
	  });
	  // đóng form đăng nhập
	  $(".close-login").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    console.log("dang click close")
	    $(".container-login").hide(300);
	  });
	  // mở form đăng nhập từ phần đăng kí
	  $(".btn-registration-second").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(".container-registration").hide();
	    $(".container-get-password").hide(300);
	    $(".container-login").show(300);
	  });
	  // mở form đăng kí
	  $(".btn-registration").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    console.log("dang click")
	    $(".container-registration").show(300);
	  });
	  // đóng form đăng kí
	  $(".close-registration").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    console.log("dang click close")
	    $(".container-registration").hide(300);
	  });
	  // mở form đăng kí từ phần đăng nhặp
	  $(".btn-login-second").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    console.log("dang click close")
	    $(".container-login").hide();
	    $(".container-registration").show(300);
	  });
	  //tắt thông báo đăng nhập
	  $(".notification-login").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(this).hide();
	  });
	  //tắt thông báo đăng kí
	  $(".notification-registration").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    $(this).hide();
	  });
  // show scroll when scroll web page bigger than 300px
  $(window).scroll(function () {
    const currentPos = $(window).scrollTop();
    if (currentPos > 500) {
      $(".totop").fadeIn();
      // $(".list-form-suggestion").show();
    } else {
      $(".totop").hide();
    }
  });
  // to the page top when click to "totop"
  $(".totop").click(function (e) {
    e.preventDefault();
    // $(window).scrollTop(0);
    $("html").animate(
      {
        scrollTop: 0,
      },
      1500,
      "easeOutExpo"
    );
  });
  // list-form-suggestion
//  $(".list-form-suggestion").delay(15000).fadeIn();
//  $(".list-form-suggestion .item-form-suggestion .item-form-suggestion-close").click(function (e) {
//    e.preventDefault();
//    $(".list-form-suggestion").fadeOut();
//  });
  // Slide home page
  $("#slide-bg").owlCarousel({
    items: 1,
    loop: true,
    autoplay: true,
    autoplayTimeout: 4000,
  });
  // slide featured products
  $("#slide-item-featured-products").owlCarousel({
    items: 4,
    loop: true,
    nav: true,
    margin: 15,
    autoplay: true,
    autoplayTimeout: 3000,
  });
  // slide home-handbook
  $("#slide-home-handbook").owlCarousel({
    items: 1,
    loop: true,
    nav: true,
    autoplay: true,
    autoplayTimeout: 4000,
  });
  // slide ecperience
  $("#slide-experience").owlCarousel({
    items: 1,
    loop: true,
    dots: true,
    autoplay: true,
    autoplayTimeout: 7000,
    // nav: true,
  });
  // animation for search
  const listSuggestions = [
    "Bạn cần tìm gì....",
    "Bàn gỗ sồi chân thép",
    "Sofa giường",
    "Ghế LieMax cao cấp",
  ];
  $("#search").attr("placeholder", listSuggestions[0]);
  $("#products-menu").hover(
    function () {
      // over
      $(".products").fadeIn(100);
    },
    function () {
      // out
      $(".products").fadeOut(100);
    }
  );
  
  //hieu ung cho phan detail.htm
  $(".down").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    const typeBtn = $(".amount input").attr("placeholder");
	    var value = parseInt(typeBtn) - 1;
	    if(value>=1)
	      $(".amount input").attr("placeholder",value);
	  });
  $(".up").click(function (e) {
	    e.preventDefault();
	    e.stopPropagation();
	    console.log("dang click");
	    const typeBtn = $(".amount input").attr("placeholder");
	    var value = parseInt(typeBtn) + 1;
	    $(".amount input").attr("placeholder",value);
	  });
  
//Hieu ung hover products-main
  $(".item-title").hover(
    function () {
      const title = $(this).attr("name-room");
      scaleItem(title);
    },
    function () {
      const title = $(this).attr("name-room");
      unscaleItem(title);
    }
  );
  // Hieu ung hover Living room
  $("#img-item-room").hover(
    function () {
      // over
      $(".detail-purchase").css("display", "block");
    },
    function () {
      // out
    }
  );

  // Hieu ung cho phan product.html
  $(".item-filter-chose").click(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $(".list-suggestion-filters").hide();
    const name_list = $(this).attr("name-list");
    const strTemp = name_list + ".list-suggestion-filters";
    $(`#${strTemp}`).show();
  });
  // khi an ngoai thi hide list suggestion di
  $("body .product").click(function (e) {
    e.preventDefault();
    $(".list-suggestion-filters").hide();
  });

  // xu li phan sortby
  $(".all-products .sort-all-products").hover(
    function () {
      // over
      $(".sort-all-products .list-suggestion-filters").show();
    },
    function () {
      // out
      $(".sort-all-products .list-suggestion-filters").hide();
    }
  );

  // Phan filter cua product.html
  $(".list-suggestion-filters li").click(function (e) {
	  e.preventDefault();
	  e.stopPropagation();
	  $(".list-suggestion-filters li:before").hide();
	  $(".list-suggestion-filters li:after").show();
 });
  const products = [
    {
      name: "5CKT-17 unique living room TV shelf",
      price: 300,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-ti-vi-phong-khach-doc-dao-600x600.jpg?v=1577206265000",
    },
    {
      name: "5CBT-136 natural wooden tea table",
      price: 320,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-go-tu-nhien-bt136-600x600.jpg?v=1577206353000",
    },
    {
      name: "Beautiful living room TV shelf 5CKT-08",
      price: 500,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-tivi-phong-khach-kieu-dang-trang-nha-600x600.jpg?v=1577206170000",
    },
    {
      name: "High quality natural wood TV stand 5CKT-168",
      price: 250,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-tivi-go-tu-nhien-chan-cao-kt168-600x600.jpg?v=1577206060000",
    },
    {
      name: "5CKT-64 natural wood TV shelf",
      price: 270,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-tivi-go-tu-nhien-kt64-600x600.jpg?v=1577205866000",
    },
    {
      name: "Natural wood tea table drawers 5CBT-130 color",
      price: 290,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-go-tu-nhien-ngan-keo-son-mau-bt130-600x600.jpg?v=1577205550000",
    },
    {
      name: "5CBT-17 modern living room tea table",
      price: 200,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-phong-khach-hien-dai4152-13c-600x600.jpg?v=1577205407000",
    },
    {
      name: "Industrial wood table high leg natural wood 5CBT-124",
      price: 210,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-go-cong-nghiep-chan-cao-go-tu-nhien-bt124-600x600.jpg?v=1577204902000",
    },
    {
      name: "5CKT-17 unique living room TV shelf",
      price: 7500,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-ti-vi-phong-khach-doc-dao-600x600.jpg?v=1577206265000",
    },
    {
      name: "5CBT-136 natural wooden tea table",
      price: 120,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-go-tu-nhien-bt136-600x600.jpg?v=1577206353000",
    },
    {
      name: "Beautiful living room TV shelf 5CKT-08",
      price: 50,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-tivi-phong-khach-kieu-dang-trang-nha-600x600.jpg?v=1577206170000",
    },
    {
      name: "High quality natural wood TV stand 5CKT-168",
      price: 25,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-tivi-go-tu-nhien-chan-cao-kt168-600x600.jpg?v=1577206060000",
    },
    {
      name: "5CKT-64 natural wood TV shelf",
      price: 2700,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ke-tivi-go-tu-nhien-kt64-600x600.jpg?v=1577205866000",
    },
    {
      name: "Natural wood tea table drawers 5CBT-130 color",
      price: 290,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-go-tu-nhien-ngan-keo-son-mau-bt130-600x600.jpg?v=1577205550000",
    },
    {
      name: "5CBT-17 modern living room tea table",
      price: 1200,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-phong-khach-hien-dai4152-13c-600x600.jpg?v=1577205407000",
    },
    {
      name: "Industrial wood table high leg natural wood 5CBT-124",
      price: 85,
      img:
        "https://bizweb.dktcdn.net/100/368/970/products/ban-tra-go-cong-nghiep-chan-cao-go-tu-nhien-bt124-600x600.jpg?v=1577204902000",
    },
  ];
  const prices = [
    {
      name: "Price under 100 USD",
      min: 0,
      max: 100,
    },
    {
      name: "100 USD - 200 USD",
      min: 100,
      max: 200,
    },
    {
      name: "200 USD - 500 USD",
      min: 200,
      max: 500,
    },
    {
      name: "Price over 500 USD",
      min: 500,
      max: Infinity,
    },
  ];

  // xu li phan list suggestion filter
  $(".list-suggestion-filters li").click(function (e) {
    e.preventDefault();
    const tempCurClass = $(this).attr("class");
    if (tempCurClass === undefined || tempCurClass.includes("noActive")) {
      $(this).removeClass("noActive");
      $(this).addClass("active");
    } else if (tempCurClass === undefined || tempCurClass.includes("active")) {
      $(this).removeClass("active");
      $(this).addClass("noActive");
    }
  });

//  showListProduct(products);
  // Phan filter choose
  var listProductFilter = [];
  var listPriceFilter = [];

  $(".list-item-filter-chose ul li").click(function (e) {
    e.preventDefault();
    e.stopPropagation();
    removeAllProducts();
    const valFilter = $(this).text().trim();
    // dua gia tri vua chon vao mang Filter by
    if (!listPriceFilter.includes(valFilter)) {
      listPriceFilter.push(valFilter);
    } else {
      listPriceFilter = listPriceFilter.filter((val) => val != valFilter);
    }

    // hien thi o phan filter by
    removeAllFilterBy();
    showListFilterBy(listPriceFilter);

    // hien thi cac san pham da filter
    let tempListPrice = prices.filter((val) => listPriceFilter.includes(val.name));
    // loc ra list Min Price
    let listMinPrice = [];
    for (let i = 0; i < tempListPrice.length; i++) {
      listMinPrice[i] = tempListPrice[i].min;
    }
    var minPrice = Math.min.apply(Math, listMinPrice);
    // loc ra list Max Price
    let listMaxPrice = [];
    for (let i = 0; i < tempListPrice.length; i++) {
      listMaxPrice[i] = tempListPrice[i].max;
    }
    var maxPrice = Math.max.apply(Math, listMaxPrice);
    // filter list product
    listProductFilter = products.filter((val) => minPrice < val.price && val.price <= maxPrice);
    showListProduct(listProductFilter);
  });
  // phan order
  $("#sort-by li").click(function (e) {
    e.preventDefault();
    e.stopPropagation();
    let sortBy = $(this).text().trim();
    if (sortBy === "A -> Z") {
      var newListProductFilter = listProductFilter.sort();
    } else if (sortBy === "Z -> A") {
      var newListProductFilter = listProductFilter.sort().reverse();
    }
    removeAllProducts();
    showListProduct(listProductFilter);
  });
  // Phan filter by
  $("body").on("click", ".list-filter-by li img", function (e) {
    e.stopPropagation();
    const valFilter = $(this).parent().text().trim();
    // bo class active trong list suggestion filter
    const newId = valFilter.split(" ").join("").split("-").join("");
    $(`.list-suggestion-filters #${newId}`).removeClass("active");
    $(`.list-suggestion-filters #${newId}`).addClass("noActive");

    removeAllProducts();
    listPriceFilter = listPriceFilter.filter((val) => val != valFilter);
    // hien thi cac san pham da filter
    let tempListPrice = prices.filter((val) => listPriceFilter.includes(val.name));
    // loc ra list Min Price
    let listMinPrice = [];
    for (let i = 0; i < tempListPrice.length; i++) {
      listMinPrice[i] = tempListPrice[i].min;
    }
    var minPrice = Math.min.apply(Math, listMinPrice);
    // loc ra list Max Price
    let listMaxPrice = [];
    for (let i = 0; i < tempListPrice.length; i++) {
      listMaxPrice[i] = tempListPrice[i].max;
    }
    var maxPrice = Math.max.apply(Math, listMaxPrice);
    // filter list product
    listProductFilter = products.filter((val) => minPrice < val.price && val.price <= maxPrice);
    // listProductFilter = listProductAfterFilter(products, prices, valFilter);
    showListProduct(listProductFilter);
    $(this).parent().remove();
  });
  // remove all filter
  $(".remove-all-filter").click(function (e) {
    e.preventDefault();
    removeAllFilterBy();
  });
});

function scaleItem(name) {
  $(`#${name}`).css("transform", "scale(1.1)");
}
function unscaleItem(name) {
  $(`#${name}`).css("transform", "scale(1.0)");
}
// function show list filter at the filter by
function showFilterBy(valFilter) {
  $(`<li>
  <img
    src="https://bizweb.dktcdn.net/100/368/970/themes/740033/assets/close.png?1580806875262"
    alt="icon"
  />
  ${valFilter}
</li>`).appendTo(".list-filter-by");
}
function showListFilterBy(listFilterBy) {
  listFilterBy.forEach((val) => showFilterBy(val));
}
function removeAllFilterBy() {
  $(".list-filter-by").empty();
}
// function show products form listPrice filter
function showProduct(Product) {
  $(`<div class="item-products col-md-3">
  <a href="#"
    ><img
      src="${Product.img}"
      alt="#"
  /></a>
  <div class="detail-purchase">
    <a class="detail-purchase-item detail-purchase-item-left" href="#">Detail</a>
    <a class="detail-purchase-item detail-purchase-item-right" href="#">Purchase</a>
  </div>
  <div class="content-item-featured">
    <a href="#">${Product.name}</a>
    <h4>${Product.price} USD <span> 500 USD</span></h4>
  </div>
</div>`).appendTo(".all-products-content .row");
}
function showListProduct(listProduct) {
  listProduct.forEach((val) => {
    showProduct(val);
  });
}
function removeAllProducts() {
  $(".all-products-content .row").empty();
}
