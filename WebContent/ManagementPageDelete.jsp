<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="com.fumigatorProject.*,java.util.*,java.io.*" %>
<html>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>추가 확인 </title>
<%
	request.setCharacterEncoding("UTF-8");

	int number = Integer.parseInt(request.getParameter("eaterynumber"));
	
	EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();
	
	ArrayList<FileDTO> fileList = eateryfumigatorDAO.fileQuery(number);
	
	System.out.println(fileList.size());
	String filename = null;
	String filepath = null;
	String savePath = config.getServletContext().getRealPath("/upload/");
	  
	   
	File file;
	if(fileList != null){
		for(int i =0; i<fileList.size(); i++){
			filename = fileList.get(i).getFile_name();
		   	filepath = fileList.get(i).getFile_path();
		   		
		   	file = new File(filepath);
		   	   
		   	   if(file.exists()&&file.isFile()){
		   		   file.delete();
		   	   }
		   	   
		   }
	   }  
	   eateryfumigatorDAO.eateryDelete(number);
	   eateryfumigatorDAO.fileAllDelete(number);
	
	
%>
</head>
<body>
	<jsp:forward page="./Management.jsp"/>

</body>
</html>