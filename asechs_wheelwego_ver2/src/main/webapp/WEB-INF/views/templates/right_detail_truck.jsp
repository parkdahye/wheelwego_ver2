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
   TOTAL : <span id="total">0</span><span style="padding-left: 150px;"><button type="button" class="btn btn-xs" style="position: fixed; right:20px">ORDER</button></span>
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
	                    "<td class='menuId'>"+menu+"</td>"+
	                    "<td>"+
	                    "<input type=hidden name='sell_price' value='"+price+"'>"+
	                    "<input type='number' name='amount' class='countId' value='1' size='1' style='width:30%;' onclick='change()' min='1'>"+
	                    "</td>"+
	                    "<td><input type='text' class='sumId' name='sum' size='4' readonly value="+price+"></td>"+
	                    "<td>"+
	                    "<span class='glyphicon glyphicon-remove' role='button'></span></td></tr>");
	        
			 totalPrcie();

		 }); //dropdown
		$("#testTable").on("change",":input[type=number]",function(){
			var unitPrice=$(this).parent().find(":input[name=sell_price]").val();
			var price=$(this).parent().next().find(":input[name=sum]");
			var amount=$(this).val();
			price.val(parseInt(unitPrice)*parseInt(amount));
			totalPrcie();
		});//수량 및 총액계산
		
		$("#testTable").on("click",".glyphicon",function(){
			if(confirm("메뉴를 삭제하시겠습니까?")){
				$(this).parent().parent().remove();
				totalPrcie();
			}
		});
	
	}); //ready
function totalPrcie(){
	var sum_val=0;
    for(var i=0; i<document.getElementsByName("sum").length; i++){
   	 sum_val += parseInt(document.getElementsByName("sum")[i].value);
    }
    $("#total").text(sum_val);
	}
</script>