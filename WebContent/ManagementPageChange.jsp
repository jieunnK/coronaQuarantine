<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.fumigatorProject.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String image = null;
request.setCharacterEncoding("utf-8");
int number = Integer.parseInt(request.getParameter("eaterynumber"));
pageContext.setAttribute("eaterynumber", number);

EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();
ArrayList<EateryfumigatorDTO> eateryfumigatorList = eateryfumigatorDAO.onesQuery(number);

ArrayList<FileDTO> fileList = eateryfumigatorDAO.fileQuery(number);
%>

<jsp:include page="top.jsp" flush="true" />

<br>
<br>
<br>
<center>
	<h3>수정 하기</h3>
</center>
<br>
<form name=ChangeForm method=post action="./ManagementPageChangefunction.jsp?eaterynumber=${eaterynumber}" enctype="multipart/form-data">
	<div class="container">
		<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
			<%
				for (int i = 0; i < eateryfumigatorList.size(); i++) {
			%>
			<tr>
				<td>상호명 :</td>
				<td colspan="2"><input type="text" name="eateryNameBack"
					value="<%=eateryfumigatorList.get(i).getEateryName()%>"></td>
			</tr>
			<tr>
				<td>업종 :</td>
				<td colspan="2">
					<select id="eaterycategory" name="eaterycategory">
						<option value="cook" <%=("cook".equals(eateryfumigatorList.get(i).getEaterycategory())) ? "selected" : ""%>>음식점</option>
						<option value="coffe" <%=("coffe".equals(eateryfumigatorList.get(i).getEaterycategory())) ? "selected" : ""%>>커피숍</option>
						<option value="on" <%=("on".equals(eateryfumigatorList.get(i).getEaterycategory())) ? "selected" : ""%>>기타</option>
					</select>
				</td>

			</tr>
			<tr>
				<td>주소 :</td>
				<td colspan="2"><input type="text" name="eateryAddrBack" value="<%=eateryfumigatorList.get(i).getEateryAddr()%>"></td>
			</tr>
			<tr>
				<td>연락처 :</td>
				<td colspan="2"><input type="text" name="eateryTelBack" value="<%=eateryfumigatorList.get(i).getEateryTel()%>"></td>
			</tr>
			<tr>
				<td>영업시간 :</td>
				<td colspan="2"><input type="text" name="eateryTimeBack" value="<%=eateryfumigatorList.get(i).getEateryTime()%>"></td>
			</tr>
			<tr>
				<td>방역날짜 :</td>
				<td colspan="2"><input type="date" name="eateryDateBack" value="<%=eateryfumigatorList.get(i).getEaterydate()%>"></td>
			</tr>
			<tr>
				<td>비대면 주문 :</td>
				<td colspan="2">
					<input type="radio" name="untactBack" value="O" <%=("O".equals(eateryfumigatorList.get(i).getUntact())) ? "checked" : ""%>>O
					 &nbsp;&nbsp;&nbsp; 
					<input type="radio" name="untactBack" value="X" <%=("X".equals(eateryfumigatorList.get(i).getUntact())) ? "checked" : ""%>>X
				</td>
			</tr>
			<tr>
				<td>포장 :</td>
				<td colspan="2">
					<input type="radio" name="packingBack" value="O" <%=("O".equals(eateryfumigatorList.get(i).getPacking())) ? "checked" : ""%>>O
					&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="packingBack" value="X" <%=("X".equals(eateryfumigatorList.get(i).getPacking())) ? "checked" : ""%>>X
				</td>
			</tr>
			<tr>
				<td>배달 :</td>
				<td colspan="2">
					<input type="radio" name="deliverBack" value="O" <%=("O".equals(eateryfumigatorList.get(i).getDeliver())) ? "checked" : ""%>>O
					&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="deliverBack" value="X" <%=("X".equals(eateryfumigatorList.get(i).getDeliver())) ? "checked" : ""%>>X
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<%
					for (int j = 0; j < fileList.size(); j++)
					{
						%> 
							<input type="text" name="imageBack" value="<%=fileList.get(j).getFile_name()%>"> 
							<input id="page" type="button" value="파일 삭제" onClick="pageDelete(<%=eateryfumigatorList.get(i).getEaterynumber()%>,<%=fileList.get(j).getFile_idx()%>)" />
							<br>
	
						<%
					}
					%>
					<table class="table table-hover" style="text-align: center;" id="dynamic_table">
						<input type="hidden" name="count">
					</table>
				</td>
				<td>
					<input class="btn btn-secondary" type="button" value="추가" onclick="javascript:addInputBox();"> 
					<input class="btn btn-secondary" type="button" value="삭제" onclick="javascript:subtractInputBox();"><br>
					<br>
				</td>
				<%
				}
			%>
			</tr>
		</table>
	</div>
	<div class="text-center">
		<input class="btn btn-secondary" type="submit" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="btn btn-secondary" type="button" value="취소"
			onclick="location.href='./ManagementPage.jsp?eaterynumber=${eaterynumber}' ">
	</div>
</form>
<script>
	   var count = 1;
	   var addCount;
	       
	   //파일 추가
	   function addInputBox() {
		   for(var i=1; i<=count; i++) {
		    if(!document.getElementsByName("test"+i)[0]) {
		     addCount = i;
		     break;
		    }
		    else addCount = count;
	   }
	   
	   var addStr = "<tr><td width=40><input type=checkbox name=checkList value="+addCount+" size=40 ></td>&nbsp;<td width=140><input type=file name=test"+addCount+" size=40></td></tr>";
	   var table = document.getElementById("dynamic_table");
	   var newRow = table.insertRow();
	   var newCell = newRow.insertCell();
	   newCell.innerHTML = addStr;
	   count++;
	   }
	   
	   //파일 삭제
	   function subtractInputBox() {
		   var table = document.getElementById("dynamic_table");
		   var rows = dynamic_table.rows.length;
		   var chk = 0;
		   if(rows > 1){
		    for (var i=0; i<document.ChangeForm.checkList.length; i++) {
		     if (document.ChangeForm.checkList[i].checked == true) {
		      table.deleteRow(i);
		      i--;
		      count--;
		      chk++;
		     }
		    }
		    if(chk <= 0){
		     alert("삭제할 행을 체크해 주세요.");
		    }
		     }else{
		      alert("더이상 삭제할 수 없습니다.");
		  }
	   }
	   
	   //파일 삭제를 눌렀을 때 
	   function pageDelete(eaterynumber,fileidx) {
	       if (confirm("정말 삭제하시겠습니까??") == true){    //확인  
	          document.location.href="/Change.jsp?eaterynumber="+eaterynumber+"&fileidx="+fileidx;
	       }else{   //취소
	           return false;
	   }
	   
	}
	 
	</script>


</body>
</html>