<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ page import = "com.fumigatorProject.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8"); 
   int number = Integer.parseInt(request.getParameter("eaterynumber"));
   pageContext.setAttribute("eaterynumber", number);
   
    String untact = request.getParameter("untact");
	String packing = request.getParameter("packing");
	String deliver = request.getParameter("deliver");
	String tripstart = request.getParameter("tripstart");
	String tripclose = request.getParameter("tripclose");
	String eaterycategory = request.getParameter("eaterycategory");
   
   EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();
   ArrayList<EateryfumigatorDTO> eateryfumigatorList = eateryfumigatorDAO.onesQuery(number);
   
   ArrayList<FileDTO> fileList = eateryfumigatorDAO.fileQuery(number);
	 
%>
<jsp:include page="top.jsp" flush="true"/>			
	<br>		
	<form name="ChangeForm" action="/ManagementPageChange.jsp?eaterynumber=${eaterynumber}" method="post">
		<div class="container">
			<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
				<h3 style="text-align: center" >글 목록</h3>		
			<tbody>
			   <%
      				for(int i =0; i<eateryfumigatorList.size(); i++){                  
   				%>
            <tr>
                 <td>상호명 : </td>
            	 <td><%= eateryfumigatorList.get(i).getEateryName() %></td>
            	 <td>
	        	</td>
            </tr>
            <tr>
            	<td>업종 : </td>
            	<td>
            	<%
            		String category = eateryfumigatorList.get(i).getEaterycategory();
            		String categoryname = null;
            		if(category.equals("cook")){
            			categoryname = "음식점";
            		}else if(category.equals("coffe")){
            			categoryname ="커피숍";
            		}else {
            			categoryname = "기타";
            		}
            	%>
            	<%= categoryname %></td>
            	<td>
	        	</td>
            <tr>
                 <td>주소 : </td>
            	 <td><%=eateryfumigatorList.get(i).getEateryAddr() %></td>
            	 <td>
	        	</td>
            </tr>
            <tr>
                <td>연락처 : </td>
            	<td><%=eateryfumigatorList.get(i).getEateryTel()%></td>
            	<td>
	        	</td>
            </tr>
            <tr>
               <td>영업시간 : </td>
            	<td><%= eateryfumigatorList.get(i).getEateryTime() %></td>
            	<td>
	        	</td>
            </tr>
            <tr>
               <td>방역날짜 : </td>
            	<td><%= eateryfumigatorList.get(i).getEaterydate() %></td>
            	<td>
	        	</td>
            </tr>
    		<tr>
	            <td> 비대면 주문 : </td>
	            <td><%= eateryfumigatorList.get(i).getUntact() %></td>
	            <td>
	        	</td>
	        </tr>
	        <tr>
	            <td> 포장 : </td>
	            <td><%= eateryfumigatorList.get(i).getPacking() %></td>
	            <td>
	        	</td>
	        </tr>
	        <tr>
	            <td> 배달 : </td>
	            <td><%= eateryfumigatorList.get(i).getDeliver() %></td>
	            <td>
	        	</td>
	        </tr>
	        <tr>
	        	<td>사진 : </td>
	        	<td>
	        	<%	
      				
	        		if(fileList != null) {
	        			
	        			for(int j =0; j<fileList.size(); j++) {
	        	%>
	        			<img alt"" src="/upload/<%=fileList.get(j).getFile_name() %>" width="100" height="80">
	        	<% 		
	        			}
	        		}
	        	%>	
	        	</td>
	        	<td>
	        	</td>
	 			
	        </tr>
		        <td></td>
	         	<td></td>
	         	<td><input class="btn btn-secondary" type=button name=change value='뒤로가기' onclick="javascript:history.back();"></td>
	    	</tbody>
			</table>	
	 
            <%		
      			}
            %> 
</body>
</html>