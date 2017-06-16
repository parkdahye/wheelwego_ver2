<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<Script type="text/javascript">

$(document).ready(function(){
	var bookingNumber="";
	var memberId="${sessionScope.memberVO.id}";
	var memberType="${sessionScope.memberVO.memberType}";
	var customerBookingNumber="";
	if(memberId!=""&&memberType=="seller"){
	$.ajax({
		method:"post",
		url:"${pageContext.request.contextPath}/foodtruck/getPreviousBookingNumberBySellerId.do",
		data:"id=${sessionScope.memberVO.id}",
		success:function(result){
				//alert("이전 예약번호"+result);
				bookingNumber=result;
			}
		});
	
	setInterval(function(){
		$.ajax({
			method:"post",
			url:"${pageContext.request.contextPath}/foodtruck/getRecentlyBookingNumberBySellerId.do",
			data:"id=${sessionScope.memberVO.id}",
			success:function(result){
				if(parseInt(result)>parseInt(bookingNumber)){		
					bookingNumber=result;
					alertify.log("새로운 주문내역을 확인해주세요!");
				}
			}
		});
	}, 1000);
}//seller
	if(memberId!=""&&memberType=="customer"){
		customerBookingNumber="${sessionScope.bookingNumber}";
		//alert("customerBookingNumber : "+customerBookingNumber);
		
 		if(customerBookingNumber!=""){ //bookingNumber가 있으면
		var customerTimer=setInterval(ajaxCall, 1000); 
 		function ajaxCall(){
 			$.ajax({
				method:"post",
				url:"${pageContext.request.contextPath}/foodtruck/getBookingStateBybookingNumber.do",
				data:"bookingNumber="+customerBookingNumber,
				success:function(state){
  					if(state=="ok"){		
						//alert(state);
						alertify.log("주문하신 음식이 나왔습니다!");
						clearInterval(customerTimer);
					}  
				}
			});
 		}
 		}
	}//customer

});//ready


</Script>