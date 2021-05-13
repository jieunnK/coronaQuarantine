<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="com.fumigatorProject.*" %>
<%@ page import = "java.io.*, java.util.*, javax.servlet.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<html>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>추가 확인 </title>
<%
	request.setCharacterEncoding("UTF-8");

	int number = Integer.parseInt(request.getParameter("eaterynumber"));
	pageContext.setAttribute("eaterynumber", number);
	
	String eateryNameBack = null;
	String eateryAddrBack = null;
	String eateryTelBack = null;
	String eateryTimeBack = null;
	String untactBack = null;
	String packingBack = null;
	String deliverBack = null;
	String eateryDate = null;
	String eaterycategory = null;
	
	String count = "";
	String filename = "";
    String fileLength = "";
    File file = null;
    int size = 0;
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024 ; // 10MB 크기 제한
		String savePath = config.getServletContext().getRealPath("/upload/");
		// 저장 경로 설정
		System.out.println("savePath : " + savePath);
		
		try{
			multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
			 
			eateryNameBack = multi.getParameter("eateryNameBack");
			eateryAddrBack = multi.getParameter("eateryAddrBack");
			eateryTelBack = multi.getParameter("eateryTelBack");
			eateryTimeBack = multi.getParameter("eateryTimeBack");
			untactBack = multi.getParameter("untactBack");
			packingBack = multi.getParameter("packingBack");
			deliverBack = multi.getParameter("deliverBack");
			eateryDate = multi.getParameter("eateryDateBack");
			eaterycategory = multi.getParameter("eaterycategory");
			System.out.println(untactBack);
			 
			EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();	
			
			eateryfumigatorDAO.eateryUpDate(number,eateryNameBack,eateryAddrBack,eateryTelBack,eateryTimeBack,untactBack,packingBack,deliverBack,eateryDate,eaterycategory);
			
			size = eateryfumigatorDAO.sequenceQuery(eateryNameBack,eateryAddrBack,eateryTelBack);
			
			out.print(size);
			Enumeration files = multi.getFileNames(); //파일명정보를 배열로 만들다(files에 name들이 담겨있다)
			while(files.hasMoreElements()){ 
			    String name = (String)files.nextElement(); //각각의 파일 name을 String name에 담는다.
			    
			    File file2 = multi.getFile(name);
			    filename = multi.getFilesystemName(name); //각각의 파일 name을 통해서 파일의 정보를 얻는다.
			  	String realpath = savePath+filename; //절대경로
			    String fileType = multi.getContentType(name); // 파일타입
			    long fileSize = file2.length();
				
			
			    eateryfumigatorDAO.fileAdd(size,new FileDTO(realpath,filename,fileType,fileSize));
			
			    
			}
		} catch (Exception e) {
		e.printStackTrace();
		// 예외처리
		}
		}else {
			  out.println("인코딩 타입이 multipart/form-data 가 아님.");
	}
	
	EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();
	ArrayList<FileDTO> fileList = eateryfumigatorDAO.fileQuery(size);
	
%>

</head>
<body>
<jsp:forward page="/ManagementPage.jsp?eaterynumber=${eaterynumber}"/>

</body>
</html>