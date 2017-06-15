<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
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
  <span style="position: fixed; right: 150px;">총 주문금액 : ${total}</span>
  <br>
  <input type="button" class="btn" value="주문하기" style="position: fixed; right: 150px;">
</div>
