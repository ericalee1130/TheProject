<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/TProject/css/common.css"/>
    <link rel="stylesheet" href="/TProject/css/reset.css"/>
	<link rel="stylesheet" href="/TProject/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/TProject/js/common.js"></script>
    <script src="/TProject/js/main.js"></script>
    <style>
    	    
		.body_wrap {
            margin: 0 auto;
            width: 1200px;
        }
        .big_sub > li {
            display: inline;
            list-style: none;
        }
        .choose_prod {
            height: 225px;
            border-style: solid;
            border-width: thin;
        }
        .type_display { 
            height: 150px;
            padding: 5px 30px 5px 30px;
            border-bottom: solid thin;
        }
        .type_display > .mid_sub {
            display: grid;
            grid-template-rows: repeat(5, min-content);
            grid-auto-flow: column;
        }

        .type_display > .mid_sub > .main_menu {
            line-height: 2;
            list-style: square;
        }
        
        .choose_prod > .options {
            height: 75px;
            padding: 5px;
        }

        .options > .basic_info {
            width: 50%;
            float: left;
        }

        .options > .basic_info > .condition-seller {
            width: 50%;
            float: left;
            display: flex;
            flex-direction: column;
            height: 65px;
        }

        .condition, .seller {
            height: 50%;
        }

        .price {
            height: 65px;
            display: flex;
            flex-direction: row;
            padding-right: 5px;
            float: right;
        }

        .price_options {
            float: left;
            padding-right: 15px;
        }

        .price_range {
            float: right;
        }
         
        #price_button {
            position:relative;
            left: 100px;
            bottom: 20px;
        }
        
        .selected_prod {
            height: 100px;
            border-style: solid;
            border-width: thin;
            margin-top: 15px;
            padding: 5px 30px 5px 30px;
        }
        
        .selected_prod > .category_selected, .search_within {
            width: 50%;
            float: left;
        }

        .selected_prod > .category_selected > h3, h4 {
            display: inline;
        }

        .selected_prod > .search_within {
            padding-top: 25px;
        }

        .sw_category {float: right;}

        .selections {
            height: 100px;
            padding-top: 20px;
            border-bottom: solid steelblue;
        }

        .selections > .selection_left {
            width: 50%;
            float: left;
        }

        .selection_left, .selection_right {
            display:flex;
            flex-direction: column;
        }

        .prod_selections, .view {
            height: 50px;
        }

        .view {
            display: inline;
            text-align: right;
        }

        .buttons {
            padding: 2px 5px 2px 5px;
            background-color: steelblue;
            color: white;
        }

        .prod_selections #button_selected, #translate_button {
            background-color: black;
        }
/*
        span {
            color: steelblue;
        }
*/
        .total_prod, .align_options {
            vertical-align: bottom;
            font-size: larger;
        }

        .align_options {
            text-align: right;
        }

        .product_page {
            width: 1200px;
            height: 1600px;
            float: left;
        }
        .product_page > .row {
            padding-left: 15px;
            width: 100%;
            height: 400px;
            margin-left: 0;
            margin-top: 10px;
            
        }

        .product_page > .row > .product {
            width: 19%;
            height: 400px;
            display: inline-block;
            border: 1px solid grey;
            vertical-align: top;
            margin-bottom: 10px;
            margin-right: 5px;
        }

        .product > .product_div {
            padding: 5px;
            width: 100%;
            height: 100%;

        }

        .product > .product_div > .main_img {
            object-fit: contain;
            height: 200px;
            max-width: 100%;
         
        }

        .product > .product_div > .info {
            vertical-align: bottom;
            width: 95%;
            max-height: 200px;
        }
        
        .product_div > .info > .buttons {
        	width: 90%;
        	height: 25px;
        	left: -5px;
        	background-color: white;
        	margin: 10px auto;
        }
        
        .info > .buttons > a > img {
	        object-fit: contain;
	        width: 17%;
	        height: 27px;
	        border: solid thin gray;
	        margin: 0px 5px 0px 5px;
        }
        

        .info > span {
            font-style: bold;
        }

        .info > #date {
            line-height: 4;
        }

        .pagination {
            margin-left: 370px;
            margin-bottom: 50px;
        }
        
        .paging {
        	height: 100px;
            bottom: -10px;
        }
       
        
        

        * {
            margin:0;
            padding:0;
            box-sizing: border-box;
        }
        .wrap {
            width:100%;
            margin : 0 auto;
        }
        .logo{
            float : left;
        }
        .header {
            width:1200px;
            margin:0 auto;
            text-align: center;
            padding:10px 20px;
        }
        .size {position: relative;}
        .header > .size > .login {
            position:absolute;
            top:0;
            right:0;
        }
        .search_form {
            border-style: solid;
            border-width: 900px;
            border-radius: 25px;
            padding: 4px 15px;
            float: auto;
        }
        .search_form {
                float: middle;
                display: inline-flex;
                background: #FFFFFF;
                border: 1px solid #61666D;

                        }
        .placeholder {
                padding-left: -5px;
                float: middle;
                display: inline-flex;
        }
        .autoKeyword {
            padding-bottom: 10px;
        }
        .menu {
            width:1200px;
            margin:0 auto;
            height:40px;
        }
        .menu > ul > li {
            list-style: none;
            border:1px solid #000000;
            background-color: #fff;
            color:#000000;
            text-align: center;
            float:left;
            width: 16.6%;
            height:40px;
            line-height: 40px;
        }
        .menu > ul > li > a:hover {
            background-color: #999;
            color:#fff;
        }
        ul, li {
            list-style: none;
            position:relative;
        }
        .depth2 {
            width:100%;
            z-index:10;
            background-color: #fff;
            display: none;
        }
        .depth1 > li > a {
            display:block;
        }
        .depth2 > li > a {
            display:block;
        }
        a {
            text-decoration: none;
        }
        .section_1 {
            width:1200px;
            margin:0 auto;
        }
        .section_1 > .content_1 {
            width:60%;
            float:left;
            padding:20px 20px;
        }
        .section_1 > .content_2 {
            width:40%;
            float:left;
            padding:20px 20px;
        }
        
        .detail {
        	display: flex;
        	justify-content: center;
        }
        .section_1 > .content_1 > .now_auction {
            width:100%;
            height:350px;
            border:1px solid #999;
            padding:20px;
        }
        .section_1 > .content_1 > .now_auction > .best_title {
            font-size:10px;
            line-height: 50px;
            float:left;
            cursor:pointer;
            width:95px;
            text-align: center;
        }
        .section_1 > .content_1 > .now_auction > .best_title.on {
            color:#fff;
            background-color: #d3d3d3;
        }
        .section_1 > .content_1 > .now_auction > .now_auction > ul {
            clear:both;
        }
        .now_action_area > ul > li{
            font-size: 15px;
            line-height: 30px;
            border-bottom: 1px solid #d3d3d3;
            list-style: none;
        }
        .now_action_area > ul:first-child{
            padding-top: 50px;
            border-top:1px solid #d3d3d3;
        } /*첫번째 자식*/
        .now_action_area > ul > li > span {
            float :right;
        }
        #best_sales {display: none;}
        #best_recent {display: none;}
        #best_price {display: none;}
        #best_success {display: none;}
        #best_ing {display: none;}

        .section_1 > .content_2 > .my_info {
            width:100%;
            height:350px;
            border:1px solid #999;
            padding:20px 20px;
        }
        .section_1 > .content_2 > .my_info >.login_info {
            font-size: 20px;
            padding:20px;
            
        }
        .login_info{
            padding: 50px 20px;
        }
        .login_info > .login_regist > .login {
            width:50%;
            float:right;
        }
        .login_info > .login_regist > .regist {
            width:50%;
            float:left;
        }
        .info > .content > .notice_area {
            width:100%;
            height:400px;
            border:1px solid #999;
            padding:10px;
        }
        .info > .content > .notice_area > .notice_title {
            font-size:25px;
            line-height: 50px;
            float:left;
            width:100px;
            text-align: center;
        }
        .info > .content > .notice_area > .notice_content > ul {
            clear:both;
        }
        .notice_content > ul > li{
            font-size: 10px;
            line-height: 40px;
            border-bottom: 1px solid #d3d3d3;
        }
        .notice_content > ul:first-child{border-top:1px solid #d3d3d3;} /*첫번째 자식*/
        .notice_content > ul > li > span {
            float :right;
        }
        #find{
            font-size: 15px;
            text-align: right;
        }
        .section_2 {
            width:1200px;
            margin:0 auto;
            height: auto;
            
        }
        .section_2 > .container{
            overflow: hidden;
            height:auto;
        }
        .section_2 > .container > .size{
            text-align: center; /*가운데정렬*/            
        } 
        .section_2 > .container > .size > .section{
            float:left; /*왼쪽으로 붙임*/
            width:31.3333333%; /*컨테이너 이미지 3개씩정렬*/
            margin:1%;/*마진에서 1퍼주면 width에서 1%빼면*/
        }
        .footer {
            /*width:1200px;*/
            margin:0 auto;
            background-color: #221f1f;
            color:#999;
            clear:both;
            
        }
        .footer > .size > .info > p {
            line-height: 17px;
        }
        
        .paging {
        	bottom: -50px;
        }
        
        .main_menu {
    		position: relative;
    	}
    	
    	.sub_menu {
	    	display:none;
	    	position: absolute;
    		z-index: 2;
    		left: 20px;
    		backgroud-image: none;
    		background-color: WhiteSmoke;
    	}
    	 
    	.main_menu:hover ~ .sub_menu {
        	display: block;
        }
        
        .sub_menu:hover {
        	display: block;
        }
    </style>
</head>
<body>
    <div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp" %>
        <div class="body_wrap">
            <ul class="big_sub">
                <li><img src=""></li>
                <li> > <a href="">쇼핑몰</a>
                <li> > <a href="">${category}</a>
                <li> > <a href="">중 종류</a>
                <li> > <a href="">소 종류</a>
                <li><img src=""></li>
            </ul>
            <div class="choose_prod">
                <div class="type_display">
                    <ul class="mid_sub">
                        <li class="main_menu"><a href="">Art</a></li> 
                        	<ul class="sub_menu">
                        	<c:forEach var="pc" items="${primaryCategory_list}">
	                    		<li class="detail_menu"><a href="index.do?primary_category=${pc}">${pc}</a></li>
	                    	</c:forEach>
	                    	</ul>
		                <li class="main_menu"><a href="">종류2</a></li>
		                <li class="main_menu"><a href="">종류3</a></li>
		                <li class="main_menu">종류4</a></li>
		                <li class="main_menu">종류5</a></li>
		                <li class="main_menu">종류6</a></li>
		                <li class="main_menu">종류7</a></li>
		                <li class="main_menu">종류8</a></li>
		                <li class="main_menu">종류9</a></li>
		                <li class="main_menu">종류10</a></li>
		                <li class="main_menu">종류11</a></li>
		                <li class="main_menu">종류12</a></li>
		                <li class="main_menu">종류13</a></li>
		                <li class="main_menu">종류14</a></li>
		                <li class="main_menu">종류15</a></li>
		                <li class="main_menu">종류16</a></li>
		                <li class="main_menu">종류17</a></li>
		                <li class="main_menu">종류18</a></li>
		                <li class="main_menu">종류19</a></li>        
		                <li class="main_menu">종류20</a></li>
		                <li class="main_menu">종류21</a></li>
		                <li class="main_menu">종류22</a></li>
		                <li class="main_menu">종류23</a></li>
		                <li class="main_menu">종류24</a></li>
		                <li class="main_menu">종류25</a></li>      
                    </ul>      
                </div>
                <div class="options">
                    <div class="basic_info">
                        <div class="condition-seller">
                            <div class="condition">
                                <img src=""> 상태 &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="condition" value="all">전체 &nbsp;
                                <input type="radio" name="condition" value="new">신품  &nbsp;
                                <input type="radio" name="condition" value="used">중고
                            </div>
                        </div>
                    </div>
                    <div class="price">
                        <div class="price_options">즉시낙찰가</div>
                        <div class="price_range">
                            <input type="range" value="0" min="0" max="${max_price}" oninput="this.nextElementSibling.value = this.value">
                            <output>0</output>
                            <input id="price_button" type="button" value="검색">
                        </div>
                    </div>
                </div>  
            </div>
            <div class="selected_prod">
                <div class="category_selected">
                    <img src=""><p><h3><c:if test="${param.primary_category == null}">All Items</c:if><c:if test="${param.primary_category != null}">Art</h3>&nbsp;&nbsp;<h4>(${param.primary_category})</h4></c:if></p>
                </div>
                <form class="search_within" method="get" action="index.do">
                    <span class="sw_category" onmousedown ="$('#tags').focus();">
                        <input type="text" name="sw_categ" id="tags" value="" placeholder="현재카테고리에서 검색" />
                        <input button type="submit" value="검색" ></button>
                    </span>
                </form>
            </div>
            <div class="selections">
                <div class="selection_left">
                    <div class="prod_selections">
                        <input class="buttons" id="button_selected" type="button" value="전체상품">&nbsp;
                        <input class="buttons" type="button" value="즉시낙찰">&nbsp;
                        <input class="buttons" type="button" value="흥정하기">
                    </div>
                    <div class="total_prod">
                        <h6>검색결과 (전체 <span>${totCount}</span>개)</h6>
                    </div>
                </div>
                <div class="selection_right">
                    <div class="view">
                        <img src=""><a href=""></a>
                        <img src=""><a href=""></a>
                        <input class="buttons" id="translate_button" type="button" value="내용번역">
                    </div>
                    <div class="align_options"><!-- 클릭시 span태그 -->
                        <h6>
                        	<a href="index.do?primary_category=${param.primary_category}&s_site=${param.s_site}&s_type=${param.s_type}&searchword=${param.searchword}&orderCond=watchcount_desc" <c:if test="${param.orderCond == 'watchcount_desc' }">style="color: steelblue;"</c:if>>인기상품순</a> | 
                        	<a href="index.do?primary_category=${param.primary_category}&s_site=${param.s_site}&s_type=${param.s_type}&searchword=${param.searchword}&orderCond=endtime_asc" <c:if test="${param.orderCond == 'endtime_asc'}">style="color: steelblue;"</c:if>>마감임박순</a>| 
                        	<a href="index.do?primary_category=${param.primary_category}&s_site=${param.s_site}&s_type=${param.s_type}&searchword=${param.searchword}&orderCond=price_asc" <c:if test="${param.orderCond == 'price_asc'}">style="color: steelblue;"</c:if>>낮은가격순</a> | 
                        	<a href="index.do?primary_category=${param.primary_category}&s_site=${param.s_site}&s_type=${param.s_type}&searchword=${param.searchword}&orderCond=price_desc" <c:if test="${param.orderCond == 'price_desc'}">style="color: steelblue;"</c:if>>높은가격순</a> | 
                        	<a href="">입찰수높은순</a> | 
                        	<a href="">입찰수낮은순</a> | 
                        	<a href="index.do?primary_category=${param.primary_category}&s_site=${param.s_site}&s_type=${param.s_type}&searchword=${param.searchword}&orderCond=start_time_desc" <c:if test="${param.orderCond == 'start_time_desc'}">style="color: steelblue;"</c:if>>신상품순</a>
                        </h6>
                    </div>
                </div>
            </div>
            <div class="product_page">
                <div class="row">
                	<c:forEach var="vo" items="${list}">
                    <div class="product">
                        <div class="product_div">
                            <img class="main_img" src=${vo.thumbnail } />
                            <div class="info">
                            	<div class="buttons">
                            		<a href=""><img src="/TProject/img/see_detail.png"/></a>
                            		<a href="detailPage.do?itemid=${vo.itemid }"><img src="/TProject/img/newtab.png"/></a>
                            		<a href=${vo.url }><img src="/TProject/img/to_url.png"/></a>
                            		<a href=""><img src="/TProject/img/saved.png"/></a>
                            	</div>
                                <h6>${vo.title }</h6><br>
                                <h4>$${vo.price }</h4><h6>(즉시낙찰 <span>$${vo.price }</span>)</h6>
                                <h6 id="date">${vo.endtime } (${vo.timeleft_str })</h6>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            ${pageArea}
        </div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>