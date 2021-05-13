<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.fumigatorProject.*,java.util.*"%>
<%@ page import="java.io.*"%>
<%
int eaterynumber = Integer.parseInt(request.getParameter("eaterynumber"));
int fileidx = Integer.parseInt(request.getParameter("fileidx"));

String eateryNameBack = request.getParameter("eateryNameBack");
String filename = null;
String filepath = null;
EateryfumigatorDAO eateryfumigatorDAO = new EateryfumigatorDAO();

ArrayList<FileDTO> fileList = eateryfumigatorDAO.fileQuery(eaterynumber, fileidx);

String savePath = config.getServletContext().getRealPath("/upload/");

File file;
if (fileList != null) {
	for (int i = 0; i < fileList.size(); i++) {
		filename = fileList.get(i).getFile_name();
		filepath = fileList.get(i).getFile_path();

		file = new File(filepath);

		if (file.exists() && file.isFile()) {
	file.delete();
		}

	}
}

eateryfumigatorDAO.fileDelete(eaterynumber, fileidx);
%>
<jsp:forward page="./ManagementPageChange.jsp" />

