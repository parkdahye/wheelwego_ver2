<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
	$(document).ready(function(){
		$(".cookingBtn").click(function(){
			var bookingNumber=$(this).parent().parent().parent().find(".bookingNumber").children(".bno").text();
			var bookingState=$(this).parent().parent().parent().find(".bookingState").children(".bstate").text();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/afterLogin_mypage/updateState.do",
				data:"bookingState=조리중&bookingNumber="+bookingNumber,
				success:function(bookingResult){
					location.reload();
				}
			});
		});//click
		
		$(".finishedCookingBtn").click(function(){
			var bookingNumber=$(this).parent().parent().parent().find(".bookingNumber").children(".bno").text();
			var bookingState=$(this).parent().parent().parent().find(".bookingState").children(".bstate").text();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/afterLogin_mypage/updateState.do",
				data:"bookingState=조리완료&bookingNumber="+bookingNumber,
				success:function(bookingResult){
					location.reload();
				}
			});
		});//click
	});//ready
</script>
<body>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-md-9" >

                <div class="row">
				<c:forEach items="${requestScope.bookingList }" var="bookingList">
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <div class="caption">
                                <h4 class="pull-right">합계:${totalPrice }원</h4>
                                <h4><a href="#">예약번호:${bookingList.bookingNumber }</a>
                                </h4>
                            </div>
                            <div class="table">
                                <table>
                               		 <tr class="bookingNumber">
                                		<td>예약번호</td><td class="bno">${bookingList.bookingNumber }</td>
                                	</tr>
                                	<tr class="bookingState">
                                		<td>주문상태</td><span class="bookingResult"><td class="bstate">${bookingList.bookingState }</td></span>
                                	</tr>
                                	<tr>
                                		<td>주문자</td><td>${bookingList.customerId }</td>
                                	</tr>
                                	<tr>
                                		<td>예약일시</td><td>${bookingList.bookingDate}</td>
                                	</tr>
                                	<tr>
                                		<td>메뉴명</td><td>단가</td><td>수량</td><td>금액</td>
                                	</tr>
                                	<c:forEach items="${bookingList.bookingDetail }" var="bookingDetail">
                                	<c:set var="totalPrice"  value="${totalPrice+bookingDetail.menuPrice*bookingDetail.bookingQuantity }"/>
                                	<tr>
                                		<td>${bookingDetail.menuName }</td>
                                		<td>${bookingDetail.menuPrice }</td>
                                		<td>${bookingDetail.bookingQuantity }</td>
                                		<td>${bookingDetail.menuPrice*bookingDetail.bookingQuantity }</td>
                                	</tr>
                                	</c:forEach>
                                	<tr>
                                		<td><input type="button" class="cookingBtn" value="조리중"></td>
                                		<td><input type="button" class="finishedCookingBtn" value="조리완료"></td>
                                	</tr>
                                </table>
                                
						        <input type="hidden" class="bookingNumber" value="">
						        
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$64.99</h4>
                                <h4><a href="#">Second Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$74.99</h4>
                                <h4><a href="#">Third Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$84.99</h4>
                                <h4><a href="#">Fourth Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$94.99</h4>
                                <h4><a href="#">Fifth Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <h4><a href="#">Like this template?</a>
                        </h4>
                        <p>If you like this template, then check out <a target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this tutorial</a> on how to build a working review system for your online store!</p>
                        <a class="btn btn-primary" target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View Tutorial</a>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->
  <%-- <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$(".cookingBtn").click(function(){
			//alert($(this).parent().parent().children(".no").text());
			var bookingNumber=$(this).parent().parent().children(".no").text();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/afterLogin_mypage/updateState.do",
				data:"bookingState=결제완료&bookingNumber="+bookingNumber,
				success:function(bookingResult){
					var bookingInfo="";
					bookingInfo="<td>"+bookingResult+"</td>";
					$(this).parent().parent().children(".bookingState").html(bookingInfo);
				}
			});
		});//click
	});//ready
</script>
<div class="container">
  <h2>주문 상세내역</h2>
  <p>판매자에게 하기와 같이 주문이 들어왔습니다</p>            
  <table class="table table-condensed">
    <thead>
      <tr>
        <th>주문 예약 번호</th>
        <th>고객아이디</th>
        <th>메뉴번호</th>
        <th>수량</th>
        <th>예약시각</th>
        <th>결제상태</th>
        <th>상태버튼</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.bookingList }" var="bookingList">
      <tr>
        <td  class="no">${bookingList.bookingNumber }</td>
        <td>${bookingList.customerId }</td>
        <td>${bookingList.menuId }</td>
        <td>${bookingList.bookingQuantity }</td>
        <td>${bookingList.bookingDate }</td>
        <span class="bookingState">
        <td>${bookingList.bookingState }</td>
        </span>
        <td>
        <input type="button" class="cookingBtn" value="조리중">
        <input type="hidden" class="bookingNumber" value="${bookingList.menuId }">
        <input type="button" class="finishedCookingBtn" value="조리완료">
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div> --%>

    