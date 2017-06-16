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
					button.style.display = "none";
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
        <div class="col-md-1" style="width: 10%"></div>
            <div class="col-md-9">
                <div class="row">
				<c:forEach items="${requestScope.bookingList }" var="bookingList" varStatus="status">
                    <div class="col-sm-4 col-lg-4 col-md-4" style="border:1px solid lightgray; height:400px;">
                        <div class="thumbnail">
                            <div class="caption">
                                <h4 style="color: orange;">예약번호 : ${status.index+1}<%-- ${bookingList.bookingNumber} --%></h4>
                            </div>
                            <div class="table">
                                <table>
                                	<tr class="bookingState">
                                		<td style="font-weight: bold; padding-bottom: 10px;">주문상태</td><span class="bookingResult"><td class="bstate" style="padding-bottom: 10px;">${bookingList.bookingState}</td></span>
                                	</tr>
					<tr>
                                		<td style="font-weight: bold; padding-bottom: 10px;">주문자</td><td style="padding-bottom: 10px;">${bookingList.customerId}</td>
                                	</tr>
                                	<tr>
                                		<td style="font-weight: bold; padding-bottom: 10px;">예약일시</td><td style="padding-bottom: 10px; width:100px;">${bookingList.bookingDate}</td>
                                	</tr>
                                	<tr>
                                		<td style="font-weight: bold; width:96px; padding-bottom: 15px;">메뉴명</td>
                                		<td style="font-weight: bold; width:30px; padding-bottom: 15px;">단가</td>
                                		<td style="font-weight: bold; width:45px; padding-bottom: 15px;">수량</td>
                                		<td style="font-weight: bold; width:33px; padding-bottom: 15px;">금액</td>
                                	</tr>
                                	<c:set value="0" var="totalPrice"/>
                                	<c:set value="0" var="i"/>
                                	<c:forEach items="${bookingList.bookingDetail }" var="bookingDetail">
                                	<tr>
                                		<td style=" padding-bottom: 15px;">${bookingDetail.menuName }
                                		<input type="hidden" name="bookingDetail[${i}].menuId" value="${bookingDetail.menuId}">
                                		</td>                       		
                                		<td style=" padding-bottom: 15px;">${bookingDetail.menuPrice }</td>
                                		<td style=" padding-bottom: 15px;">${bookingDetail.bookingQuantity }
                                		<input type="hidden" name="bookingDetail[${i}].bookingQuantity" value="${bookingDetail.bookingQuantity}">
                                		</td>
                                		<td style=" padding-bottom: 15px;">${bookingDetail.menuPrice*bookingDetail.bookingQuantity }</td>
                                	<c:set value="${totalPrice+bookingDetail.bookingQuantity*bookingDetail.menuPrice}" var="totalPrice"/>
	       						 	<c:set value="${i+1}" var="i"/>
                                	</tr>
                                	</c:forEach>
                                	<tr>
                                	<td width="150px;">
                                	<h5>TOTAL&nbsp; ${totalPrice}</h5>
                                	</td>
                                	</tr>
                                	<tr>
                                		<td colspan="2">
                                		<span>
                                		<c:choose>
                                			<c:when test="${bookingList.bookingState=='결제완료'}">
		                                		<input type="button" onclick="style.display = 'none'" class="cookingBtn" value="조리중">
                                			</c:when>
                                			<c:otherwise>
		                                		<input type="button" class="finishedCookingBtn" value="조리완료">
                                			</c:otherwise>
								        </c:choose>
								        </span>
								        </td>
                                	</tr>
                                </table>              
                            </div>
                        </div>
                    </div>
                    </c:forEach>
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

    