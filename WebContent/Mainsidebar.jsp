<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%
	
	String untact = request.getParameter("untact");
	String packing = request.getParameter("packing");
	String deliver = request.getParameter("deliver");
	String tripstart = request.getParameter("tripstart");
	String tripclose = request.getParameter("tripclose");
	String eaterycategory = request.getParameter("eaterycategory");
	String categoryname = request.getParameter("categoryname");
	String categorymemo = request.getParameter("categorymemo");
	
	if(categorymemo == null) {
		categorymemo ="";
	}
%>
   
	<div id="page-wrapper">
 		<!-- 사이드바 -->
  	<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a>지도 검색</a>
      </li>
      <br>
      <form name="SeleteForm" action="/IndexSearch.jsp" method="post">
      <li><a>조건 검색 
      <select id="eaterycategory" name ="categoryname">
      			<option value="" <%=("".equals(categoryname))?"selected":""%>></option>
				<option value="name" <%=("name".equals(categoryname))?"selected":""%>>상호명</option>
				<option value="address" <%=("address".equals(categoryname))?"selected":""%>>주소</option>
	  </select></a></li> 
	  <li><a><input name="categorymemo" type="text" style="text-align:center; width:200px; height:30px;" value="<%=categorymemo %>"></a></li>
	  <br>
      <li><a>업종 &nbsp;&nbsp;&nbsp;
      <select id="eaterycategory" name ="eaterycategory">
      			<option value="" <%=("".equals(eaterycategory))?"selected":""%>></option>
				<option value="cook" <%=("cook".equals(eaterycategory))?"selected":""%>>음식점</option>
				<option value="coffe" <%=("coffe".equals(eaterycategory))?"selected":""%>>커피숍</option>
				<option value="on" <%=("on".equals(eaterycategory))?"selected":""%>>기타</option>
	  		</select></a></li>
      <li><a>비대면 주문 &nbsp;&nbsp;&nbsp;
      <select id="untact" name ="untact">
				<option value="" <%=("".equals(untact))?"selected":""%> ></option>
				<option value="O" <%=("O".equals(untact))?"selected":""%>>O</option>
				<option value="X" <%=("X".equals(untact))?"selected":""%>>X</option>
			</select></a></li>
      <li><a>포장 &nbsp;&nbsp;&nbsp;
      <select id="packing" name ="packing">
				<option value="" <%=("".equals(packing))?"selected":""%>></option>
				<option value="O" <%=("O".equals(packing))?"selected":""%>>O</option>
				<option value="X" <%=("X".equals(packing))?"selected":""%>>X</option>
			</select></a></li>
	  <li><a>배달 &nbsp;&nbsp;&nbsp;
      <select id="deliver" name ="deliver">
				<option value="" <%=("".equals(deliver))?"selected":""%>></option>
				<option value="O" <%=("O".equals(deliver))?"selected":""%>>O</option>
				<option value="X" <%=("X".equals(deliver))?"selected":""%>>X</option>
			</select></a></li><br>
	  <li><a>방역날짜 </a></li>
	  <li><a><input type="date" id="start" name="tripstart" value="<%=tripstart %>" min="2020-01-01" max="2030-12-31"></a></li>
	  <li><a>~ </a></li>
	  <li><a><input type="date" id="start" name="tripclose" value="<%=tripclose %>" min="2020-01-01" max="2030-12-31"></a></li><br><br>
	  			
	  <li><a><input type="submit" class="btn btn-secondary" value="검색"></button> &nbsp;&nbsp;&nbsp;
	  		<input type="button" class="btn btn-secondary" value="전체 검색" onClick="location.href='/index.jsp'"></button></a></li>
	  </form>			
    </ul>
  </div>
  </div>