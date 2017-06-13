<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$(".cookingBtn").click(function(){
			alert($(this).next().val());
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
        <td>${bookingList.bookingNumber }</td>
        <td>${bookingList.customerId }</td>
        <td>${bookingList.menuId }</td>
        <td>${bookingList.bookingQuantity }</td>
        <td>${bookingList.bookingDate }</td>
        <td>${bookingList.bookingState }</td>
        <td>
        <input type="button" class="cookingBtn" value="조리중">
        <input type="hidden" class="bookingNumber" value="${bookingList.menuId }">
        <input type="button" class="finishedCookingBtn" value="조리완료">
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

    