<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ page import = "com.fumigatorProject.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8"); 
   int number = Integer.parseInt(request.getParameter("eaterynumber"));
   pageContext.setAttribute("eaterynumber", number);
   
	String pagenumber = request.getParameter("page");
	
	if(pagenumber == null) {
		pagenumber = "1";
	}
	

	
  
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
            	 <td colspan="2"><%= eateryfumigatorList.get(i).getEateryName() %></td>
            </tr>
            <tr>
            	<td>업종 : </td>
            	<td colspan="2">
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
            <tr>
                 <td>주소 : </td>
            	 <td colspan="2"><%=eateryfumigatorList.get(i).getEateryAddr() %></td>
            </tr>
            <tr>
                <td>연락처 : </td>
            	<td colspan="2"><%=eateryfumigatorList.get(i).getEateryTel()%></td>
            </tr>
            <tr>
               <td>영업시간 : </td>
            	<td colspan="2"><%= eateryfumigatorList.get(i).getEateryTime() %></td>
            </tr>
            <tr>
               <td>방역날짜 : </td>
            	<td colspan="2"><%= eateryfumigatorList.get(i).getEaterydate() %></td>
            </tr>
    		<tr>
	            <td> 비대면 주문 : </td>
	            <td colspan="2"><%= eateryfumigatorList.get(i).getUntact() %></td>
	        </tr>
	        <tr>
	            <td> 포장 : </td>
	            <td colspan="2"><%= eateryfumigatorList.get(i).getPacking() %></td>
	        </tr>
	        <tr>
	            <td> 배달 : </td>
	            <td colspan="2"><%= eateryfumigatorList.get(i).getDeliver() %></td>
	        </tr>
	        <tr>
	        	<td>사진 : </td>
	        	<td colspan="2">
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
	        </tr>
		        <td><input  class="btn btn-secondary" type=submit name=change value='수정'></td>
	         	<td><input   class="btn btn-secondary" type=button name=change value='삭제' onClick ="eateryfumigatordelete(<%=eateryfumigatorList.get(i).getEaterynumber()%>)"></td>
	         	<td><input   class="btn btn-secondary" type=button name=change value='목록' onclick="location.href='/Management.jsp?page=<%=pagenumber%>'"></td>
	    	</tbody>
			</table>	
	 
            <%		
      			}
            %> 
		<script>
		   function eateryfumigatordelete(eaterynumber){
			   var result = confirm("삭제 하시겠어요?");
			   if(result){
				   location.href="/ManagementPageDelete.jsp?eaterynumber="+eaterynumber;
			   }else{
			      
			   } 		      
		   }
		</script>
</body>
</html>