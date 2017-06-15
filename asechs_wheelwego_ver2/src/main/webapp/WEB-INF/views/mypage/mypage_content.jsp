<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.star_point_list {
	font-size: 10pt;
	color: gold;
	cursor: pointer;
}

.paging a {
	color: grey;
}
</style>
<script>
	$(document).ready(function(){
		$("#freeboardBtn").click(function(){
			/* var id=$("#id").val();
			var contentPageNo=1;
			var newInfo="";
			  $.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/afterLogin_mypage/showMyContentByFreeList.do",
				data:"id="+id,
				datatype: "json",
				success:function(result){
					var paging = result.pagingBean
					alert(paging);
					for(var i=0;i<result.boardList.length;i++){
						 newInfo+="<tr><td class='no'>"+result.boardList[i].no+"</td>";
						 newInfo+="<td>"+result.boardList[i].title+"</td>";
						 newInfo+="<td>"+result.boardList[i].content+"</td>";
						 newInfo+="<td>"+result.boardList[i].timePosted+"</td>";
						 newInfo+="<td>"+result.boardList[i].hits+"</td>";
						 newInfo+="<td>"+"<button type='button' class='updateBtn btn btn-default btn-sm'>"+
						 "<span class='glyphicon glyphicon-pencil'>"+"</span></button>";
						 newInfo+="<button type='button' class='deleteBtn btn btn-default btn-sm'>"+
						 "<span class='glyphicon glyphicon-remove'>"+"</span></button></td></tr>";
					}// for 문
					$("#divzone").append(newInfo);
				 	
					//이부분이 페이징처리
			        $(".pagingzone").empty();  //페이징에 필요한 객체내부를 비워준다.

			        for(var i = paging.startPageOfPageGroup ; i <= paging.endPageOfPageGroup ; i++){        //시작페이지부터 종료페이지까지 반복문
			        	
			        	if(paging.nowPage == i){                            //현재페이지가 반복중인 페이지와 같다면
			                	$(".pagingzone").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화
			        	}else{
			        		$(".pagingzone").append("<li class=\"goPage\" data-page=\""+i+"\"><a>"+i+"</a></li>");

			        	}
			        }
				}
			})//ajax  */
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyContentByFreeList.do?id=${sessionScope.memberVO.id}";
		})//click
		//클릭된 페이지로 가기 이벤트
		$(document).on('cilck','.goPage',function(){
			alert(22)
			page = $(this).attr("data-page");
			pageFlag = 1;
		       //	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
		});

		 $(document).on('click', '.deleteBtn', function(){
			var contentNo=$(this).parent().parent().children(".no").text();
			if(confirm("등록된 게시글을 삭제하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/afterLogin_mypage/freeboardDeleteInMaypage.do",
					data:"contentNo="+contentNo,
					success:function(data){
						if(data=="deleteOk"){
							alert("삭제되었습니다.");
							location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyContentList.do";
						}
					}
				});//ajax
			}
		  });//on click - delete
		  $(document).on('click','.updateBtn',function(){
			  var contentNo=$(this).parent().parent().children(".no").text();
			  alert(contentNo);
			   if(confirm("등록된 게시물을 수정하시겠습니까?")){
				  alert("수정페이지로 넘어간다");
				  location.href="${pageContext.request.contextPath}/afterLogin_board/freeboard_update_form.do?no="+contentNo;
			  }
		  });//on click - update
	});//ready
</script>

<input type="hidden" value="${sessionScope.memberVO.id}" id="id">

<jsp:include page="./mypage.jsp"/><br>
<div align="center">

	<button type="button" id="freeboardBtn" class="btn btn-warning">자유
		게시판</button>
	&nbsp;&nbsp;
	<button type="button" id="businessBtn" class="btn btn-warning">창업
		게시판</button>
	&nbsp;&nbsp;
	<button type="button" id="qnaBtn" class="btn btn-warning">QnA
		게시판</button>
	&nbsp;&nbsp;
</div>
<br>

<!-- <div class="row">
	<div class="col-sm-2"></div>
	<div class="container col-sm-8">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>NO</th>
					<th>Title</th>
					<th>Content</th>
					<th>timePosted</th>
					<th>hits</th>
				</tr>
			</thead>
			<tbody id="divzone">
			</tbody>
			<tfoot class="pagingzone">
			
	 
				</tfoot>
		</table>
	</div>
	<div class="col-sm-2"></div>
</div>
<br>
<p class="paging text-center" style="font-size: 17px; color: black;">
	

 -->