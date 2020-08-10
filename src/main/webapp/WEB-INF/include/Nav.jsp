<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
	<!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>

<!-- Search Wrapper -->
<div class="search-wrapper">
	<!-- Close Btn -->
	<div class="close-btn">
		<i class="fa fa-times" aria-hidden="true"></i>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<form action="searchAction">
                        <input type="search" id="myInput" name="searchValue" placeholder="검색어를 입력하세요.."  autocomplete="off">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                         <table class="table table-bordered">
						    <tbody id="myTable" style ="background-color : white;">
						    </tbody>
						  </table>
                    </form>
			</div>
		</div>
	</div>
</div>


<!-- ##### Header Area Start ##### -->
<header class="header-area">

	<!-- Top Header Area -->
	<div class="top-header-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center justify-content-between">
				<!-- Breaking News -->
				<div class="col-12 col-sm-6">
					<div class="breaking-news">
						<div id="breakingNewsTicker" class="ticker">
							<ul>
								<li><a href="#">Hello World!</a></li>
								<li><a href="#">Welcome to Colorlib Family.</a></li>
								<li><a href="#">Hello Delicious!</a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Top Social Info -->
				<div class="col-12 col-sm-6">
					<div class="top-social-info text-right">
						<c:if
							test="${ member_id == null && kname == null && nname == null}">
							<div>
								<a href="clientlogin">로그인</a> 
								<a href="join">회원가입</a> 
								<a href="#">마이페이지</a> 
								<a href="#">장바구니</a>
								<a href="#"></a> <a href="#"></a>
							</div>
						</c:if>
						<c:if
							test="${ member_id != null || kname != null || nname != null }">
							<div>
								${ member_nick }${ kname }${ nname }님 반갑습니다! &nbsp;&nbsp;&nbsp;
								<a href="logout">로그아웃</a> 
								<a href="#">마이페이지</a>
								<a href="#">장바구니</a> 
								<a href="#"></a> <a href="#"></a> 
								<a href="#"></a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Navbar Area -->
	<div class="delicious-main-menu">
		<div class="classy-nav-container breakpoint-off">
			<div class="container">
				<!-- Menu -->
				<nav class="classy-navbar justify-content-between" id="deliciousNav">

					<!-- Logo -->
					<a class="nav-brand" href="index.jsp"><img
						src="${pageContext.request.contextPath}/resources/img/core-img/logo.png"
						alt=""></a>

					<!-- Navbar Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span><span></span><span></span></span>
					</div>

					<!-- Menu -->
					<div class="classy-menu">

						<!-- close btn -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>

						<!-- Nav Start -->
						<div class="classynav">
							<ul>
								<li><a href="getDivision_re">레시피</a></li>
								<li><a href="getDivision_ingre">식재료</a></li>
								<li><a href="#">랭크</a></li>
								<li><a href="getClientFaqList.do">FAQ</a></li>
								<li><a href="#">공지사항</a></li>
							</ul>
							<!-- Newsletter Form -->
							<div class="search-btn">
								<i class="fa fa-search" aria-hidden="true"></i>
							</div>

						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- ##### Footer Area Start ##### -->
    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="<c:url value ="/resources/js/jquery/jquery-2.2.4.min.js" />"></script>
    <!-- Popper js -->
    <script src="<c:url value ="/resources/js/bootstrap/popper.min.js" />"></script>
    <!-- Bootstrap js -->
    <script src="<c:url value ="/resources/js/bootstrap/bootstrap.min.js" />"></script>
    <!-- All Plugins js -->
    <script src="<c:url value ="/resources/js/plugins/plugins.js" />"></script>
    <!-- Active js -->
    <script src="<c:url value ="/resources/js/active.js" />"></script>
    <script>
    $("#myInput").on("keyup", function() {
    	
    	let search_value = $(this).val();
   		let search_value_sum = "";
   		
   		if(search_value === "") {
   			$("#myTable").replaceWith('<tbody id="myTable" style ="background-color : white;"></tbody>');
   			return;
   		}
   		
  	$.ajax({
		type : "POST",
		url : "searchInputAction",
		data : {
			search_value: search_value
		},
		dataType: "JSON",
		success : function(result) {
	        $.each(result, function(index, value){
	        	
	        	search_value_sum +='<tr><td>'+ value.search_data +'</td></tr>';
	        			
	        });
	        
	        search_value_sum= '<tbody id="myTable" style ="background-color : white;">'+ search_value_sum +'</tbody>'
	        
	        $("#myTable").replaceWith(search_value_sum);
		},
		error: function(request, status, error) {
			alert("오류");
		}
	});
    
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
    
    
 
    </script>
</html>