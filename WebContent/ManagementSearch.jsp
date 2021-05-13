<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.fumigatorProject.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String untact = request.getParameter("untact");
String packing = request.getParameter("packing");
String deliver = request.getParameter("deliver");
String tripstart = request.getParameter("tripstart");
String tripclose = request.getParameter("tripclose");
String eaterycategory = request.getParameter("eaterycategory");
String categoryname = request.getParameter("categoryname");
String categorymemo = request.getParameter("categorymemo");

EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();

String pagenumber = request.getParameter("page"); //eateryfumigatorList.jsp?page=?

int rowSize = 4; //한페이지에 보여줄 글의 수
int pg = 1; //페이지 , eateryfumigatorList 넘어온 경우 , 초기값 =1

if (pagenumber == null) {
	pagenumber = "1";
}

if (pagenumber != null) {
	pg = Integer.parseInt(pagenumber);
}

int fromBoard = (pg * rowSize) - (rowSize - 1); //처음보여줄 게시물
int toBoard = (pg * rowSize); //(1*10) = 10 //마지막 보여줄 게시물

ArrayList<EateryfumigatorDTO> eateryfumigatorList = eateryfumigatorDAO.pageQueryPage(fromBoard, toBoard, untact,
		packing, deliver, tripstart, tripclose, eaterycategory, categoryname, categorymemo);

int total = eateryfumigatorDAO.managementgetCount(untact, packing, deliver, tripstart, tripclose, eaterycategory,
		categoryname, categorymemo); //총 게시물 수
System.out.println(total);
int allPage = (int) Math.ceil(total / (double) rowSize); //페이지수
int block = 5; //한페이지에 보여줄  범위

int fromPage = ((pg - 1) / block * block) + 1; //보여줄 페이지의 시작
int toPage = ((pg - 1) / block * block) + block; //보여줄 페이지의 끝
if (toPage > allPage) {
	toPage = allPage;
}
%>

<jsp:include page="top.jsp" flush="true" />
<jsp:include page="ManagementSideBar.jsp" flush="true" />
<div class="container">
	<br> 전체 페이지수 :<%=allPage%>
	전체 데이터 수 :<%=total%>
	현재 페이지
	<%=pagenumber%>

	<div class="text-right">
		<button class="btn btn-secondary"
			onclick="location.href='/ManagementPageAdd.html' ">추가</button>
	</div>
	<br>
	<table class="table table-hover"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<td style="text-align: center;">상호명</td>
				<td style="text-align: center;">주소</td>
				<td style="text-align: center;">연락처</td>
				<td style="text-align: center;">영업시간</td>
			</tr>
		</thead>
		<tbody>
		<%
		for (int i = 0; i < eateryfumigatorList.size(); i++) {
			%>
			<tr>
				<td><a href="./ManagementPage.jsp?eaterynumber=<%=eateryfumigatorList.get(i).getEaterynumber()%>"><%=eateryfumigatorList.get(i).getEateryName()%></a></td>
				<td><a href="./ManagementPage.jsp?eaterynumber=<%=eateryfumigatorList.get(i).getEaterynumber()%>"><%=eateryfumigatorList.get(i).getEateryAddr()%></a></td>
				<td><a href="./ManagementPage.jsp?eaterynumber=<%=eateryfumigatorList.get(i).getEaterynumber()%>"><%=eateryfumigatorList.get(i).getEateryTel()%></a></td>
				<td><a href="./ManagementPage.jsp?eaterynumber=<%=eateryfumigatorList.get(i).getEaterynumber()%>"><%=eateryfumigatorList.get(i).getEateryTime()%></a></td>
				<%
				}
			%>
			</tr>
		</tbody>
	</table>
	<div>
		<ul class="pagination">
			<%
			if (pg > 1) { //처음, 이전 링크
				%>
					<li class="page-item"><a class="page-link" href="./ManagementSearch.jsp?page=1&untact=<%=untact%>&packing=<%=packing%>&deliver=<%=deliver%>&tripstart=<%=tripstart%>&tripclose=<%=tripclose%>&eaterycategory=<%=eaterycategory%>&categoryname=<%=categoryname%>&categorymemo=<%=categorymemo%>">처음</a></li>
					<li class="page-item"><a class="page-link" href="ManagementSearch.jsp?page=<%=pg - 1%>&untact=<%=untact%>&packing=<%=packing%>&deliver=<%=deliver%>&tripstart=<%=tripstart%>&tripclose=<%=tripclose%>&eaterycategory=<%=eaterycategory%>&categoryname=<%=categoryname%>&categorymemo=<%=categorymemo%>">이전</a></li>
				<%
			}
 			//페이지 번호
			for (int i = fromPage; i <= toPage; i++) 
			{
			 	if (i == pg) 
			 	{
			 		%>
						<li class="active"><a class="page-link" style="background-color: #D3D3D3;" href="#"><%=i%></a></li>
					<%
			 	}else 
			 	{
			 		%>
						<li class="page-item"><a class="page-link" href="ManagementSearch.jsp?page=<%=i%>&untact=<%=untact%>&packing=<%=packing%>&deliver=<%=deliver%>&tripstart=<%=tripstart%>&tripclose=<%=tripclose%>&eaterycategory=<%=eaterycategory%>&categoryname=<%=categoryname%>&categorymemo=<%=categorymemo%>"><%=i%></a></li>
					<%
			 	}
			 }
			 if (pg <= 1 || pg < allPage) { //다음, 이후 링크
				 %>
					<li class="page-item"><a class="page-link" href="ManagementSearch.jsp?page=<%=pg + 1%>&untact=<%=untact%>&packing=<%=packing%>&deliver=<%=deliver%>&tripstart=<%=tripstart%>&tripclose=<%=tripclose%>&eaterycategory=<%=eaterycategory%>&categoryname=<%=categoryname%>&categorymemo=<%=categorymemo%>">다음</a></li>
					<li class="page-item"><a class="page-link" href="ManagementSearch.jsp?page=<%=allPage%>&untact=<%=untact%>&packing=<%=packing%>&deliver=<%=deliver%>&tripstart=<%=tripstart%>&tripclose=<%=tripclose%>&eaterycategory=<%=eaterycategory%>&categoryname=<%=categoryname%>&categorymemo=<%=categorymemo%>">마지막</a></li>
				<%
				}
			%>
		</ul>
	</div>
</div>
</body>
</html>