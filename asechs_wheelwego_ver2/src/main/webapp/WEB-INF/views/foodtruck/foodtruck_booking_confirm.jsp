<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
<div class="col-sm-3"></div>
<div class="container col-sm-6">
  <h2>주문 내역</h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>MENU</th>
        <th>PRICE</th>
        <th>AMOUNT</th>
        <th>TOTAL</th>
      </tr>
    </thead>
        <c:set value="0" var="total"/>
    <tbody>
    <c:forEach items="${requestScope.bvo.bookingDetail}" var="bookingList">
      <tr>
        <td>${bookingList.menuName}</td>
        <td>${bookingList.menuPrice}</td>
        <td>${bookingList.bookingQuantity}</td>
        <td>${bookingList.bookingQuantity*bookingList.menuPrice}</td>
        <c:set value="${total+bookingList.bookingQuantity*bookingList.menuPrice}" var="total"/>
      </tr>
      </c:forEach>
    </tbody>
  </table>
<div align="right">
<span style="font-weight: bold;">총 주문금액 : ${total}</span>
<br><br>
</div>
<div>
<h4>나의 포인트</h4>
<div style="border:1px solid lightgray; text-align: center;">
<br>
	보유 포인트 : <br>
	<input type="radio" name="pointOption" value="">선택안함&nbsp;&nbsp;&nbsp;
	<input type="radio" name="pointOption" value="">포인트차감<br>
	<input type="text" value="">p
<br><br>
</div>
</div><br>
<div align="right">
<span style="font-weight: bold;">최종결제금액 : ${total}</span>
<br><br>
</div>
<div align="right">
<input type="button" class="btn btn-primary" value="주문하기">
</div>
</div>
<div class="col-sm-3"></div>
</div>
