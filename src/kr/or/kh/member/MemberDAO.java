package kr.or.kh.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class MemberDAO {
	private MemberDTO memberDTO;
	private ArrayList<MemberDTO> memberList;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	private int cnt;
	private ResultSet rs;

	public MemberDAO() {
		memberDTO = new MemberDTO();
		memberList = new ArrayList<MemberDTO>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/khgthree", "khgthree", "wjdqhrydbrdnjs3");
//		conn = DriverManager.getConnection("jdbc:mysql://khgthree.cafe24.com:3306/khgthree", "khgthree","wjdqhrydbrdnjs3");//로컬용

		return conn;
	}
	public int memberRegister(MemberDTO memberDTO) throws SQLException {
		conn = getConnection();
		sql = "insert into SMEMBER(NAME,ADDR,TEL,ID,PW,STYPE) values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getName());
		pstmt.setString(2, memberDTO.getAddr());
		pstmt.setString(3, memberDTO.getTel());		
		pstmt.setString(4, memberDTO.getId());
		pstmt.setString(5, memberDTO.getPw());
		pstmt.setString(6, memberDTO.getStype());
		cnt=pstmt.executeUpdate();
		return cnt;		
	}
	public ArrayList<MemberDTO> memberList() throws SQLException {
		conn = getConnection();
		sql = "SELECT MBNO,NAME,ADDR,TEL,ID,PW,STYPE FROM SMEMBER";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		memberList = new ArrayList<MemberDTO>();
		while(rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setMbno(rs.getInt("MBNO"));
			memberDTO.setName(rs.getString("NAME"));
			memberDTO.setAddr(rs.getString("ADDR"));
			memberDTO.setTel(rs.getString("TEL"));
			memberDTO.setId(rs.getString("ID"));
			memberDTO.setPw(rs.getString("PW"));
			memberDTO.setStype(rs.getString("STYPE"));
			memberList.add(memberDTO);			
		}
		return memberList;
	}
	public int memberDelete(String idDelete, String pwDelete)throws SQLException {
		conn = getConnection();
		sql = "delete from SMEMBER where ID=? and PW=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idDelete);
		pstmt.setString(2, pwDelete);
		cnt = pstmt.executeUpdate();
		return cnt;
	}
	public ArrayList<MemberDTO> memberSearchBystype(String nameSearch,int stype) throws SQLException{
		conn = getConnection();
		sql = "SELECT MBNO,NAME,ADDR,TEL,ID,PW,STYPE FROM SMEMBER where NAME like ? AND STYPE=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+nameSearch+"%");
		pstmt.setInt(2, stype);
		rs = pstmt.executeQuery();
		memberList = new ArrayList<MemberDTO>();
		while(rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setMbno(rs.getInt("MBNO"));
			memberDTO.setId(rs.getString("ID"));
			memberDTO.setPw(rs.getString("PW"));
			memberDTO.setName(rs.getString("NAME"));
			memberDTO.setAddr(rs.getString("ADDR"));
			memberDTO.setTel(rs.getString("TEL"));
			memberDTO.setStype(rs.getString("STYPE"));
			memberList.add(memberDTO);
		}
		return memberList;				
	}
	
	public ArrayList<MemberDTO> memberSearchAll(String nameSearch) throws SQLException{
		conn = getConnection();
		sql = "SELECT MBNO,NAME,ADDR,TEL,ID,PW,STYPE FROM SMEMBER where NAME like ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+nameSearch+"%");
		rs = pstmt.executeQuery();
		memberList = new ArrayList<MemberDTO>();
		while(rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setMbno(rs.getInt("MBNO"));
			memberDTO.setId(rs.getString("ID"));
			memberDTO.setPw(rs.getString("PW"));
			memberDTO.setName(rs.getString("NAME"));
			memberDTO.setAddr(rs.getString("ADDR"));
			memberDTO.setTel(rs.getString("TEL"));
			memberDTO.setStype(rs.getString("STYPE"));
			memberList.add(memberDTO);
		}
		return memberList;				
	}
	
	public MemberDTO memberLogin(String id, String pw)throws SQLException {
	conn=getConnection();
	sql = "SELECT ID,PW,NAME from SMEMBER WHERE ID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	while(rs.next()){
		memberDTO.setId(rs.getString("ID"));
		memberDTO.setPw(rs.getString("PW"));
		memberDTO.setName(rs.getString("NAME"));
	}
	return memberDTO;
}
	public String memberIdcheck(String telSearch) throws SQLException {
		conn = getConnection();
		sql = "select id from SMEMBER where tel=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, telSearch);
		rs = pstmt.executeQuery();
		String id = null;
		while(rs.next()){
			id = rs.getString("id");
		}
		return id;
	}
	public String memberPwcheck(String idSearch) throws SQLException {
		conn = getConnection();
		sql = "select pw from SMEMBER where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idSearch);
		rs=pstmt.executeQuery();
		String pw = null;
		while(rs.next()) {
			pw = rs.getString("pw");
		}
		return pw;
	}
	public MemberDTO memberUpdateConfirm(String idSearch) throws SQLException {
		conn = getConnection();
		sql = "SELECT NAME,ADDR,TEL,ID,PW FROM SMEMBER WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idSearch);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			memberDTO.setName(rs.getString("NAME"));
			memberDTO.setAddr(rs.getString("ADDR"));
			memberDTO.setTel(rs.getString("TEL"));			
			memberDTO.setId(rs.getString("ID"));
			memberDTO.setPw(rs.getString("PW"));
		}
		return memberDTO;
	}
	public MemberDTO memberUpdateConfirm(int mbno) throws SQLException {
		conn = getConnection();
		sql = "SELECT NAME,ADDR,TEL,ID,PW,STYPE FROM SMEMBER WHERE MBNO=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mbno);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			memberDTO.setName(rs.getString("NAME"));
			memberDTO.setAddr(rs.getString("ADDR"));
			memberDTO.setTel(rs.getString("TEL"));			
			memberDTO.setId(rs.getString("ID"));
			memberDTO.setPw(rs.getString("PW"));
			memberDTO.setStype(rs.getString("STYPE"));
		}
		return memberDTO;
	}
	public int memberUpdateFinal(MemberDTO memberDTO, String idSearch) throws SQLException {
		conn = getConnection();
		sql = "update SMEMBER set id=?,pw=?,name=?,addr=?,tel=?,stype=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberDTO.getId());
		pstmt.setString(2, memberDTO.getPw());	
		pstmt.setString(3, memberDTO.getName());
		pstmt.setString(4, memberDTO.getAddr());
		pstmt.setString(5, memberDTO.getTel());	
		pstmt.setString(6, memberDTO.getStype());
		pstmt.setString(7, idSearch);
		cnt = pstmt.executeUpdate();
		return cnt;		
	}
	public ResultSet memberIdCheckall(String id) throws SQLException {
		conn = getConnection();
		String sql = "select id from SMEMBER where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		return rs;
	}
	
	public MemberDTO userinfo(String userID)
	   {
	      String SQL = "SELECT * FROM SMEMBER WHERE ID = ?"; 
	      MemberDTO userdto =new MemberDTO();
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userID);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            userdto.setMbno(rs.getInt(1));
	            userdto.setName(rs.getString(2));
	            userdto.setAddr(rs.getString(3));
	            userdto.setTel(rs.getString(4));
	            userdto.setId(rs.getString(5));
	            userdto.setPw(rs.getString(6));
	            userdto.setStype(rs.getString(7));
	            return userdto;
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }

}
