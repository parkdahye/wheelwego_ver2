<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
<div class="col-sm-3"></div>
<div class="container col-sm-6">
 <h2>주문 내역</h2><br>
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
<h4>MY POINT</h4>
<div style="border:1px solid lightgray; text-align: center;">
<br>
	보유 포인트 : ${myPoint} <br>
	<input type="radio" name="pointOption" value="uncheck" checked>선택안함&nbsp;&nbsp;&nbsp;
	<input type="radio" name="pointOption" value="check">포인트차감<br>
	<input type="text" value="" size="10" disabled="disabled">p
<br><br>
</div>
</div><br><br>
<div align="right">
<span style="font-weight: bold;">최종결제금액 : ${total}</span>
<br><br>
</div>
<div align="right">
<button type="button" class="btn btn-primary btn-sm">
<span class="glyphicon glyphicon-credit-card"></span> 결제하기
</button>
</div>
</div>
<div class="col-sm-3"></div>
</div>
<script>
$("input:radio[name=pointOption]").click(function() {
    if($(this).val()=="uncheck"){
    	$("input:text").val("");
		$("input:text").attr("disabled", true);
    }else if($(this).val()=="check")
    	$("input:text").attr("disabled", false);
});
</script>
