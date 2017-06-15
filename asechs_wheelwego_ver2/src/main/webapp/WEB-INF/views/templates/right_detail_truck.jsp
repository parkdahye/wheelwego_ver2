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

  <form name="form" method="get">
   <table class="table table-hover" id="testTable" style="width:30%">
   <thead>
   <tr>
   <th>MENU</th>
   <th>AMOUNT</th>
   <th>TOTAL</th>
   <th></th>
   </tr>
   <thead>
   <tbody>
   </tbody>
   </table>
   </form>
   <hr>
   TOTAL : <span id="total"></span><span style="padding-left: 150px; position: fixed;"><button type="button" class="btn btn-xs">ORDER</button></span>
</div>

<script>
	$(document).ready(function() {
		var arr = [''];
		$("ul.dropdown-menu a").click(function(e){
			var menu = $(this).attr('value');
			var price = $(this).next().val();
			var flag = false;
			for(var i=0; i<arr.length; i++)	{
				if(arr[i]==menu){
					flag=true;
				}
			}
			if(flag==false){
				arr.push(menu);
			}
			else{
				alert("이미 메뉴를 선택하셨습니다. 수량을 체크해주세요.");
				return false;
			}
			e.preventDefault();
			 $("#testTable > tbody:last-child").append("<tr>"+
	                    "<td class='menuId' id='"+menu+"' name='menu'>"+menu+"</td>"+
	                    "<td>"+
	                    "<input type=hidden name='sell_price' value='"+price+"'>"+
	                    "<input type='number' name='amount' id ='"+menu+"' class='countClass' value='1' size='1' style='width:30%;' onchange='change();'>"+
	                    "</td>"+
	                    "<td><input type='text' class='amountClass' name='sum' size='4' readonly></td>"+
	                    "<td>"+
	                    "<span class='glyphicon glyphicon-remove' role='button'></span></td></tr>");
	         init();
  	         var sum_val=0;
	         for(var i=0; i<document.getElementsByName('sum').length; i++){
	        	 sum_val += parseInt(document.getElementsByName('sum')[i].value);
	         }
	         $("#total").text(sum_val); 
	 			$("input[type='number']").change(function(){
					var sum_val=0;
			         for(var i=0; i<document.getElementsByName('sum').length; i++){
			        	 sum_val += parseInt(document.getElementsByName('sum')[i].value);
			         }
			         $("#total").text(sum_val);
				}); 
/*  			$(".countClass").change(function(){
				alert("change");
				var sum_val=0;
		         for(var i=0; i<document.getElementsByName('sum').length; i++){
		        	 sum_val += parseInt(document.getElementsByName('sum')[i].value);
		         }
		         $("#total").text(sum_val);
			});  */
		 });
	});

	
// 수량증감 + 가격
var sell_price;
var amount;

function init () {
		priceNo = document.getElementsByName('sell_price').length;
		price = document.getElementsByName('sell_price')[priceNo-1].value;
		amountNo = document.getElementsByName('amount').length;
		amount_val = document.getElementsByName('amount')[amountNo-1].value;
		sumNo = document.getElementsByName('sum').length;
		sum_val = document.getElementsByName('sell_price')[sumNo-1].value;
 		sell_price=price;
 		amount = amount_val;
 		sum = sell_price;
		change();
}

/*  function add () {
	
 	amountNo = document.getElementsByName('amount').length;
 	hm = document.getElementsByName('amount')[amountNo-1].value;
	hm ++;
	document.getElementsByName('amount')[amountNo-1].value=hm;
	sumNo = document.getElementsByName('sum').length;
	document.getElementsByName('sum')[sumNo-1].value=parseInt(hm) * sell_price; 
	document.form.sum.value = document.getElementsByName('sum')[sumNo-1].value;
}

function del () {
 		amountNo = document.getElementsByName('amount').length;
		hm = document.getElementsByName('amount')[amountNo-1].value;
		if(hm>1){
			hm --;
			document.getElementsByName('amount')[amountNo-1].value=hm;
			document.getElementsByName('sum')[sumNo-1].value=parseInt(hm) * sell_price;
		} 
}  */

function change () {
	amountNo = document.getElementsByName('amount').length;
	hm = document.getElementsByName('amount')[amountNo-1].value;
    sumNo = document.getElementsByName('sum').length;
		if (hm < 0) { 
			hm = 0;
		}
	document.getElementsByName('sum')[sumNo-1].value = parseInt(hm) * sell_price;
}  
</script>