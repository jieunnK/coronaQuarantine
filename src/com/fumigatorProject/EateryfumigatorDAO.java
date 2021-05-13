package com.fumigatorProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EateryfumigatorDAO {
	
	String db_connect = "jdbc:oracle:thin:@127.0.0.1:1521:XE";  //JDBC URL
    String db_user = "SCOTT";
    String db_passwd = "TIGER";	
    
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
	
	static {
		// JDBC 드라이버 로딩
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}	
	}
	
	public EateryfumigatorDAO() {
		super();
	}
	
	public Connection getConnection(){
		try{
			connection = DriverManager.getConnection(db_connect, db_user, db_passwd);
		}catch( SQLException e){
			e.printStackTrace();
			System.out.println("오류");
		}
		return connection;
	}
	
	//추가
	public int eateryAdd(EateryfumigatorDTO eateryfunugatordto) {		
		String sql = "INSERT INTO fumigator VALUES(NO_SEQ.NEXTVAL,'";		
		sql += eateryfunugatordto.getEateryName() + "','";
		sql += eateryfunugatordto.getEateryAddr() + "','";
		sql += eateryfunugatordto.getEateryTel() + "','";
		sql += eateryfunugatordto.getEateryTime() + "','";
		sql += eateryfunugatordto.getUntact() + "','";
		sql += eateryfunugatordto.getPacking() + "','";
		sql += eateryfunugatordto.getDeliver() + "','";
		sql += eateryfunugatordto.getEaterydate() + "','";
		sql += eateryfunugatordto.getEaterycategory() + "')";
				
		int n = 0;
			try{
				connection = getConnection();
				statement = connection.createStatement();
					
				n = statement.executeUpdate(sql);
			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("추가에 실패했습니다.!");
			}finally{
				close();
			}
				
				return n;
	}
	
	//검색
	public ArrayList<EateryfumigatorDTO> eateryQuery(){
		
		String sql = "SELECT * FROM fumigator "; 
		ArrayList<EateryfumigatorDTO> arraylist = new ArrayList<EateryfumigatorDTO>();
		
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
			
			int eaterynumber = 0;
			String eateryName = null;
			String eateryAddr = null;
			String eateryTime = null;
			String eateryTel = null;
			String untact = null;
			String packing = null;
			String deliver = null;
			String eateryDate = null;
			String eaterycategory = null;
			
			while(resultSet.next()){
				eaterynumber = resultSet.getInt(1);
				eateryName = resultSet.getString("eateryName");
				eateryAddr = resultSet.getString("eateryAddr");
				eateryTime = resultSet.getString("eateryTime");
				eateryTel = resultSet.getString("eateryTel");
				untact = resultSet.getString("untact");
				packing = resultSet.getString("packing");
				deliver = resultSet.getString("deliver");
				eateryDate = resultSet.getString("eateryDate");
				eaterycategory = resultSet.getString("eaterycategory");
				
				
				EateryfumigatorDTO eateryfumigatorDTO = new EateryfumigatorDTO(eaterynumber,eateryName,eateryAddr,eateryTime,eateryTel,untact,packing,deliver,eateryDate,eaterycategory);
				arraylist.add(eateryfumigatorDTO);
			}					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		close();
		return arraylist;
	}
	
	//해당 페이지 게시물 보여주기 
	public ArrayList<EateryfumigatorDTO> pageQuery(int pageStart, int pageEnd){
		
		String sql =  "SELECT * FROM (";
			   sql += "SELECT p.*, ROW_NUMBER() OVER(ORDER BY eaterynumber DESC) AS RNUM FROM fumigator p";
			   sql += ")";
			   sql += "WHERE RNUM BETWEEN "+pageStart+" AND "+pageEnd+"";
			
			   
		ArrayList<EateryfumigatorDTO> arraylist = new ArrayList<EateryfumigatorDTO>();
		
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
			
			int eaterynumber = 0;
			String eateryName = null;
			String eateryAddr = null;
			String eateryTime = null;
			String eateryTel = null;
	
			while(resultSet.next()){
				eaterynumber = resultSet.getInt(1);
				eateryName = resultSet.getString("eateryName");
				eateryAddr = resultSet.getString("eateryAddr");
				eateryTime = resultSet.getString("eateryTime");
				eateryTel = resultSet.getString("eateryTel");
				
					
				EateryfumigatorDTO eateryfumigatorDTO = new EateryfumigatorDTO(eaterynumber,eateryName,eateryAddr,eateryTime,eateryTel);
				arraylist.add(eateryfumigatorDTO);
			}					
		} catch (SQLException e) {
		e.printStackTrace();
		} 
			
		close();
		return arraylist;
	}
		
	//총 개수 구하기
	public int eaterygetCount(){
		int count = 0;
		
		String sql = "SELECT * FROM fumigator ";
		
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
				
			while(resultSet.next()){
				count ++;
				}					
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			
			close();
			return count;
	}
	
	//수정
	public boolean eateryUpDate(int eaterynumber, String eateryName, String eateryAddr , String eateryTel, String eateryTime,String untact, String packing, String deliver,String eateryDate,String eaterycategory) {		
		boolean check;
		
		String sql = "UPDATE fumigator SET eateryname = '";
		sql += eateryName + "', eateryaddr = '"; 
		sql += eateryAddr + "', eaterytime = '";
		sql += eateryTime + "', eaterytel = '";
		sql += eateryTel + "' , untact = '";
		sql += untact + "', packing = '";
		sql += packing + "', deliver = '";
		sql += deliver + "', eateryDate = '";
		sql += eateryDate +"', eaterycategory= '";
		sql += eaterycategory +"' WHERE eaterynumber = '"+eaterynumber+"'";
		
			try{
				connection = getConnection();
				statement = connection.createStatement();			
						
				statement.executeUpdate(sql);
				
				check = true;
				}catch(SQLException e){
				e.printStackTrace();
				System.out.println("수정에 실패했습니다.!");
				
				check = false;
			}finally{
				close();
			}
			
			return check;
		}
	//파일 전체 삭제
	public void eateryDelete(int eaterynumber) {		
		
		String sql = "DELETE FROM fumigator WHERE eaterynumber="+eaterynumber;
						
			try{
				connection = getConnection();
				statement = connection.createStatement();				
						
				statement.executeUpdate(sql);
				}catch(SQLException e){
				e.printStackTrace();	
				System.out.println("추가에 실패했습니다.!");
			}finally{
				close();
			}
		}
	//해당 페이지 게시물 보여주고 페이징 처리 
	public ArrayList<EateryfumigatorDTO> pageQueryPage(int pageStart, int pageEnd, String untact, String packing, String deliver, String datestart, String dateclose, String eaterycategory,String categoryname,String categorymemo){
		
		
		String sql = "SELECT a.* FROM (SELECT ROWNUM rnum, s.* FROM (SELECT * FROM fumigator WHERE 1=1";
					 if(datestart != null && !"".equals(datestart))
						{
							sql += "AND eaterydate >= TO_DATE('"+datestart+"','YYYY-MM-DD')";
						}
						if(dateclose != null && !"".equals(dateclose))
						{
							sql += "AND eaterydate <= TO_DATE('"+dateclose+"','YYYY-MM-DD')";
						}
						if(untact != null && !"".equals(untact))
						{
							sql += "AND untact = '"+untact+"'";
						}
						if(packing != null && !"".equals(packing))
						{
							sql += "AND packing = '"+packing+"'";
						}
						if(deliver != null && !"".equals(deliver))
						{
							sql += "AND deliver = '"+deliver+"'";
						}
						if(eaterycategory != null && !"".equals(eaterycategory))
						{
							sql += "AND eaterycategory = '"+eaterycategory+"'";
						}
						if(categoryname != null && "name".equals(categoryname))
						{
							sql += "AND eateryName LIKE '%"+categorymemo+"%'";
						}
						
						if(categoryname != null && "address".equals(categoryname))
						{
							sql += "AND eateryAddr LIKE '%"+categorymemo+"%'";
						}
			sql += " ORDER BY eaterynumber DESC)s )a WHERE rnum BETWEEN "+pageStart+ "AND "+pageEnd+"";

			   
			  
		ArrayList<EateryfumigatorDTO> arraylist = new ArrayList<EateryfumigatorDTO>();
			
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
				
			int eaterynumber=0;
			String eateryName = null;
			String eateryAddr = null;
			String eateryTime = null;
			String eateryTel = null;
			String eateryDate = null;
		
			while(resultSet.next()){
				eaterynumber = resultSet.getInt("eaterynumber");
				eateryName = resultSet.getString("eateryName");
				eateryAddr = resultSet.getString("eateryAddr");
				eateryTime = resultSet.getString("eateryTime");
				eateryTel = resultSet.getString("eateryTel");
				untact = resultSet.getString("untact");
				packing = resultSet.getString("packing");
				deliver = resultSet.getString("deliver");
				eateryDate = resultSet.getString("eateryDate");
				eaterycategory = resultSet.getString("eaterycategory");
					
						
				EateryfumigatorDTO eateryfumigatorDTO = new EateryfumigatorDTO(eaterynumber,eateryName,eateryAddr,eateryTime,eateryTel,untact,packing,deliver,eateryDate,eaterycategory);
				arraylist.add(eateryfumigatorDTO);	
				}					
		} catch (SQLException e) {
		e.printStackTrace();
		} 
				
		close();
		return arraylist;
	}
	
	//페이지 검색 후 개수 managementgetCount
	public int managementgetCount(String untact, String packing, String deliver, String datestart, String dateclose, String eaterycategory,String categoryname, String categorymemo){
		int count = 0;
		
			String sql = "SELECT * FROM fumigator WHERE 1=1 ";
			if(datestart != null && !"".equals(datestart))
			{
				sql += "AND eaterydate >= TO_DATE('"+datestart+"','YYYY-MM-DD')";
			}
			if(dateclose != null && !"".equals(dateclose))
			{
				sql += "AND eaterydate <= TO_DATE('"+dateclose+"','YYYY-MM-DD')";
			}
			if(untact != null && !"".equals(untact))
			{
				sql += "AND untact = '"+untact+"'";
			}
			if(packing != null && !"".equals(packing))
			{
				sql += "AND packing = '"+packing+"'";
			}
			if(deliver != null && !"".equals(deliver))
			{
				sql += "AND deliver = '"+deliver+"'";
			}
			if(eaterycategory != null && !"".equals(eaterycategory))
			{
				sql += "AND eaterycategory = '"+eaterycategory+"'";
			}
			if(categoryname != null && "name".equals(categoryname))
			{
				sql += "AND eateryName LIKE '%"+categorymemo+"%'";
			}
			
			if(categoryname != null && "address".equals(categoryname))
			{
				sql += "AND eateryAddr LIKE '%"+categorymemo+"%'";
			}
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
					
			while(resultSet.next()){
				count ++;
				}					
			} catch (SQLException e) {
				e.printStackTrace();
			} 
				
			close();
			return count;
		}
	//조건 맞는 검색
	public ArrayList<EateryfumigatorDTO> mainQuery(String untact, String packing, String deliver, String datestart, String dateclose, String eaterycategory,String categoryname, String categorymemo){
	
		String sql = "SELECT * FROM fumigator WHERE 1=1 ";
		if(datestart != null && !"".equals(datestart))
		{
			sql += "AND eaterydate >= TO_DATE('"+datestart+"','YYYY-MM-DD')";
		}
		if(dateclose != null && !"".equals(dateclose))
		{
			sql += "AND eaterydate <= TO_DATE('"+dateclose+"','YYYY-MM-DD')";
		}
		if(untact != null && !"".equals(untact))
		{
			sql += "AND untact = '"+untact+"'";
		}
		if(packing != null && !"".equals(packing))
		{
			sql += "AND packing = '"+packing+"'";
		}
		if(deliver != null && !"".equals(deliver))
		{
			sql += "AND deliver = '"+deliver+"'";
		}
		if(eaterycategory != null && !"".equals(eaterycategory))
		{
			sql += "AND eaterycategory = '"+eaterycategory+"'";
		}
		
		if(categoryname != null && "name".equals(categoryname))
		{
			sql += "AND eateryName LIKE '%"+categorymemo+"%'";
		}
		
		if(categoryname != null && "address".equals(categoryname))
		{
			sql += "AND eateryAddr LIKE '%"+categorymemo+"%'";
		}
			  
		ArrayList<EateryfumigatorDTO> arraylist = new ArrayList<EateryfumigatorDTO>();
			
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
			
			int eaterynumber=0;
			String eateryName = null;
			String eateryAddr = null;
			String eateryTime = null;
			String eateryTel = null;
			String eateryDate = null;
				
			while(resultSet.next()){
				eaterynumber = resultSet.getInt("eaterynumber");
				eateryName = resultSet.getString("eateryName");
				eateryAddr = resultSet.getString("eateryAddr");
				eateryTime = resultSet.getString("eateryTime");
				eateryTel = resultSet.getString("eateryTel");
				untact = resultSet.getString("untact");
				packing = resultSet.getString("packing");
				deliver = resultSet.getString("deliver");
				eateryDate = resultSet.getString("eateryDate");
				eaterycategory = resultSet.getString("eaterycategory");
					
				EateryfumigatorDTO eateryfumigatorDTO = new EateryfumigatorDTO(eaterynumber,eateryName,eateryAddr,eateryTime,eateryTel,untact,packing,deliver,eateryDate,eaterycategory);
				arraylist.add(eateryfumigatorDTO);
			}					
				} catch (SQLException e) {
					e.printStackTrace();
			} 
			
			close();
			return arraylist;
		}
	
	
	//메인 조건 검색후  맞는 검색
	public ArrayList<EateryfumigatorDTO> onesQuery(int data){
		
		String sql = "SELECT * FROM fumigator WHERE eaterynumber ="+data; 
		ArrayList<EateryfumigatorDTO> arraylist = new ArrayList<EateryfumigatorDTO>();
			
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
				
			int eaterynumber=0;
			String eateryName = null;
			String eateryAddr = null;
			String eateryTime = null;
			String eateryTel = null;
			String untact = null;
			String packing = null;
			String deliver = null;
			String eateryDate = null;
			String eaterycategory = null;
				
			while(resultSet.next()){
				eaterynumber = resultSet.getInt("eaterynumber");
				eateryName = resultSet.getString("eateryName");
				eateryAddr = resultSet.getString("eateryAddr");
				eateryTime = resultSet.getString("eateryTime");
				eateryTel = resultSet.getString("eateryTel");
				untact = resultSet.getString("untact");
				packing = resultSet.getString("packing");
				deliver = resultSet.getString("deliver");	
				eateryDate = resultSet.getString("eateryDate");
				eaterycategory = resultSet.getString("eaterycategory");
						
				EateryfumigatorDTO eateryfumigatorDTO = new EateryfumigatorDTO(eaterynumber,eateryName,eateryAddr,eateryTime,eateryTel,untact,packing,deliver,eateryDate,eaterycategory);
				arraylist.add(eateryfumigatorDTO);
			}					
				} catch (SQLException e) {
					e.printStackTrace();
			} 
			
			close();
			return arraylist;
		}
	
	
	//seq의 값을 구하기 위한 조회
	public int sequenceQuery(String eateryName, String eateryAddr, String eateryTel){
		
		String sql = "SELECT * FROM fumigator WHERE eateryname ='"+eateryName+"' AND eateryaddr= '"+eateryAddr+"'";
			
		int eaterynumber=0;
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
			
			String eateryTime = null;
			String untact = null;
			String packing = null;
			String deliver = null;
			String eateryPicture = null;
				
			while(resultSet.next()){
				eaterynumber = resultSet.getInt("eaterynumber");
				eateryName = resultSet.getString("eateryName");
				eateryAddr = resultSet.getString("eateryAddr");
				eateryTime = resultSet.getString("eateryTime");
				eateryTel = resultSet.getString("eateryTel");
				untact = resultSet.getString("untact");
				packing = resultSet.getString("packing");
				deliver = resultSet.getString("deliver");
				
			}					
				} catch (SQLException e) {
					e.printStackTrace();
			} 
			
			close();
			return eaterynumber;
		}
	//파일 추가
	public void fileAdd(int number,FileDTO fileDTO) {		
		String sql = "INSERT INTO filetable VALUES(NO_SEQ2.NEXTVAL,";		
		sql += number + ",'";
		sql += fileDTO.getFile_path() + "','";
		sql += fileDTO.getFile_name() + "','";
		sql += fileDTO.getFile_type() + "','";
		sql += fileDTO.getFile_size() + "')";
					
		int n = 0;
			try{
				connection = getConnection();
				statement = connection.createStatement();
						
				n = statement.executeUpdate(sql);
				}catch(SQLException e){
				e.printStackTrace();
				System.out.println("추가에 실패했습니다.!");
			}finally{
				close();
			}
	}
		
	//파일 하나 검색
	public ArrayList<FileDTO> fileQuery(int eaterynumber,int file_idx) {		
		String sql = "SELECT * FROM filetable WHERE eaterynumber="+eaterynumber+" AND file_idx="+file_idx;
							
		ArrayList<FileDTO> arraylist = new ArrayList<FileDTO>();
		
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			// 디버깅용
			System.out.println("sql : " + sql);
			resultSet = statement.executeQuery(sql);

			file_idx = 0;
			eaterynumber = 0;
			String file_path = null;
			String file_name = null;
			String file_type = null;
			long file_size = 0;
				
			while(resultSet.next()){
				file_idx = resultSet.getInt("file_idx");
				eaterynumber = resultSet.getInt("eaterynumber");
				file_path = resultSet.getString("file_path");
				file_name = resultSet.getString("file_name");
				file_type = resultSet.getString("file_type");
				file_size = resultSet.getLong("file_size");
						
				FileDTO fileDTO = new FileDTO(file_idx,eaterynumber,file_path,file_name,file_type,file_size);
				arraylist.add(fileDTO);
				}					
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				
				close();
			return arraylist;
		}
	
	//파일 삭제
	public void fileDelete(int eaterynumber,int file_idx) {		
		String sql = "DELETE FROM filetable WHERE eaterynumber="+eaterynumber+" AND file_idx="+file_idx;
						
			try{
				connection = getConnection();
				statement = connection.createStatement();			
						
				statement.executeUpdate(sql);
				}catch(SQLException e){
				e.printStackTrace();
				System.out.println("추가에 실패했습니다.!");
			}finally{
				close();
			}
		}
	
	//파일 전체 삭제
	public void fileAllDelete(int eaterynumber) {		
		String sql = "DELETE FROM filetable WHERE eaterynumber="+eaterynumber;
						
			try{
				connection = getConnection();
				statement = connection.createStatement();			
						
				statement.executeUpdate(sql);
				}catch(SQLException e){
				e.printStackTrace();
				System.out.println("추가에 실패했습니다.!");
			}finally{
				close();
			}
		}
	
	//조건 맞는 검색
	public ArrayList<FileDTO> fileQuery(int data){
			
		String sql = "SELECT * FROM filetable WHERE eaterynumber ="+data; 
		ArrayList<FileDTO> arraylist = new ArrayList<FileDTO>();
				
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);

			int file_idx = 0;
			int eaterynumber = 0;
			String file_path = null;
			String file_name = null;
			String file_type = null;
			long file_size = 0;
				
			while(resultSet.next()){
				file_idx = resultSet.getInt("file_idx");
				eaterynumber = resultSet.getInt("eaterynumber");
				file_path = resultSet.getString("file_path");
				file_name = resultSet.getString("file_name");
				file_type = resultSet.getString("file_type");
				file_size = resultSet.getLong("file_size");
						
				FileDTO fileDTO = new FileDTO(file_idx,eaterynumber,file_path,file_name,file_type,file_size);
				arraylist.add(fileDTO);
				}					
				} catch (SQLException e) {
					e.printStackTrace();
				} 
				
				close();
				return arraylist;
		}
	
	//대표 파일 하나만 검색
	public String fileOneQuery(int data){
			
		String filename = null;

		String sql  = "SELECT * FROM(";
			   sql += "SELECT *FROM filetable WHERE eaterynumber ="+data+"ORDER BY file_idx DESC)";
			   sql += "WHERE ROWNUM = 1";					
		try {
			connection = getConnection();
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(sql);
			int file_idx = 0;
			int eaterynumber = 0;
			String file_path = null;
			String file_name = null;
			String file_type = null;
			long file_size = 0;
					
			if(resultSet.next()){
				file_idx = resultSet.getInt("file_idx");
				eaterynumber = resultSet.getInt("eaterynumber");
				file_path = resultSet.getString("file_path");
				file_name = resultSet.getString("file_name");
				file_type = resultSet.getString("file_type");
				file_size = resultSet.getLong("file_size");
				
				filename = file_name;
			}					
			} catch (SQLException e) {
					e.printStackTrace();
				} 
			close();
			if(filename == null) {
				filename = "unnamed.jpg";
			}
			return filename;
	}

	//데이터베이스 종료
	public void close(){
		try{
			if(resultSet != null) resultSet.close();
			if(statement != null) statement.close();
			if(connection != null) connection.close();
		}catch(SQLException e){	}
		System.gc();
	}
	
	
}
