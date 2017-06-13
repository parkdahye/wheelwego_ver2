<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn:focus{
 outline:none !important;
 }
</style>
<div class="container">
	<div class="dropdown">
		<button class="btn btn-default dropdown-toggle" type="button"
			data-toggle="dropdown">
			SELECT <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<c:forEach items="${requestScope.truckDetailInfo.foodList}" var="foodList">
				<li>
				 <a href="" name="menu" value="${foodList.menuName}"><input type="hidden" value="${foodList.menuPrice}">
				 ${foodList.menuName}</a>
				<input type="hidden" value="${foodList.menuPrice}">
				</li>
			</c:forEach>
		</ul>
	</div>
	<!--수량 증감 -->

	<form name="form" method="get">
	<table class="table table-hover" id="testTable" style="width:30%">
	<thead>
	<tr>
	<th>MENU</th>
	<th>AMOUNT</th>
	<th>TOTAL</th>
	</tr>
	<thead>
	<tbody>
	</tbody>
	</table>
	</form>

</div>

<script>
	$(document).ready(function() {
		$("ul.dropdown-menu a").click(function(e){
			var menu = $(this).attr('value');
			var price = /* $('input[type=hidden]') */$(this).next().val();
			alert(menu+" "+price);
			e.preventDefault();
			$("#testTable > tbody:last-child").append("<tr>"+
				        "<td>"+menu+"</td>"+
				        "<td>"+
				        "<input type=hidden name='sell_price' value='"+price+"'>"+
				        "<input type='button' value='-' onclick='del()'>"+
				        "<input type='text' name='amount' value='1' size='1' onchange='change();'>"+
				        "<input type='button' value='+' onclick='add();'>"+
				        "</td>"+
				        "<td><input type='text' name='sum' size='4' readonly></td></tr>"
			);
			init();
/* 		$("#selectedMenu").append(
		"<table class='table table-hover' style='width:30%'>"+
		"<thead>"+
	     "<tr>"+
	        "<th>MENU</th>"+
	        "<th>AMOUNT</th>"+
	        "<th>TOTAL</th>"+
	      "</tr>"+
	    "</thead>"+
	    "<tbody>"+
	      "<tr>"+
	        "<td>"+menu+"</td>"+
	        "<td><button onclick='form_btn(-1)' class='btn btn-link'>-</button>"+
			"<input type='text' id='text' value='1' size='1'/>"+
			"<button onclick='form_btn(+1)' class='btn btn-link'>+</button></td>"+
	        "<td><input type='text' name='sum' size='4' value='"+price+"'readonly></td>"+
	     "</tr>"+
	    "</tbody>"+
	  "</table>"); */
		 });
	});
	
	//수량 증감
/* 	function form_btn(n) {
		var text = document.getElementById("text"); // 폼 선택
		text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
		text_val += n; // 계산
		text.value = text_val; // 계산된 값을 바꾼다
		if (text_val <= 0) {
			text.value = 1; // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
		}
	} */ 
	
// 수량증감 + 가격
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  
</script>