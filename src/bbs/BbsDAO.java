package bbs;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class BbsDAO {

	private Connection conn;	//db에 접근하는 객체
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL="jdbc:mysql://127.0.0.1:3306/khgthree?characterEncoding=utf8";
	        String dbID ="khgthree";
	        String dbPassword ="wjdqhrydbrdnjs3";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() {
		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //첫번째 게시물인 경우
	}
	
	public int getCount(int boardID) {
		String SQL = "SELECT COUNT(*) FROM bbs WHERE boardID =? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {	
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getCount(String search) {
		String SQL = "SELECT COUNT(*) FROM bbs WHERE bbsTitle like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			if (rs.next()) {	
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String bbsTitle, String userID, String bbsContent, int boardID, String file_id, String file_name, String author) {
		String SQL = "INSERT INTO bbs(bbsTitle,userID,bbsDate,bbsContent,bbsreadcount,boardID,file_id,file_name,author) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, userID);
			pstmt.setString(3, getDate());
			pstmt.setString(4, bbsContent);
			pstmt.setInt(5, 1);
			pstmt.setInt(6, boardID);
			pstmt.setString(7, file_id);
			pstmt.setString(8, file_name);
			pstmt.setString(9, author);

			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	//글리스트 가져오는것
	public ArrayList<Bbs> getList(int pageNumber, int boardID){
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND boardID = ?  ORDER BY bbsID DESC LIMIT 10"; 
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(2, boardID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsreadcount(rs.getInt(6));
				bbs.setBoardID(rs.getInt(7));
				bbs.setAuthor(rs.getString(10));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	
	public boolean nextPage (int pageNumber, int boardID) {
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND boardID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			pstmt.setInt(2, boardID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	
	public boolean searchNextPage (int boardID, int pageNumber, String search) {
		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND (bbsTitle like ? OR bbsContent like ?)ORDER BY bbsID DESC LIMIT 10"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM bbs WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsreadcount(rs.getInt(6));
				bbs.setFile_id(rs.getString(8));
				bbs.setFile_name(rs.getString(9));
				bbs.setAuthor(rs.getString(10));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE bbs SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int bbsID) {
		String SQL2 =  "SET foreign_key_checks = 0";
		String SQL = "delete from bbs where bbsid=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL2);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	 public void fileDelete(HttpServletRequest request, String file_id) throws SQLException {
			String sql = "delete from LIB where file_id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file_id);
			pstmt.executeUpdate();
			String filePath = request.getRealPath("upload");
			File file = new File(filePath + "/" + file_id);
			file.delete();
		}
	
	public void setting(int allCount) {
	       
        try {
            String sql = "set @cnt=0";//열카운팅할때 많이씀 @
            String sql2= "update bbs set bbsid=@cnt:=@cnt+1";
            String sql3 = "alter table bbs auto_increment="+allCount;//전체게시
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.executeQuery();
            pstmt = conn.prepareStatement(sql2);
            pstmt.executeUpdate();
            pstmt = conn.prepareStatement(sql3);
            pstmt.executeUpdate();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	  public int getAllCount() {
		  
	        int listCount = 0;
	       
	        try {
	            String sql = "select count(*) from bbs";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	                listCount = rs.getInt(1);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } return listCount;
	    }    
	  
	  public ArrayList<Bbs> SgetList(int pageNumber,String search,String col, int boardID)
		{
		  //전체 
		  if(col.equals("none")) {
			  
			String SQL ="select * from (SELECT  @ROWNUM := @ROWNUM + 1 AS rs,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 )TMP where bbsTitle like ? boardID = ? OR bbsContent like ? or userID like ?  ORDER BY bbsID DESC ) a where rs < ? order by rs desc LIMIT 10";
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,"%"+search+"%");
				pstmt.setInt(2, boardID);
				pstmt.setString(3,"%"+search+"%");
				pstmt.setString(4,"%"+search+"%");
				pstmt.setInt(4,  SgetNext(search,col) - (pageNumber - 1) * 10);
			
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Bbs bbs = new Bbs();
				
					bbs.setBbsID(rs.getInt(2));
					bbs.setBbsTitle(rs.getString(3));
					bbs.setUserID(rs.getString(4));
					bbs.setBbsDate(rs.getString(5));
					bbs.setBbsContent(rs.getString(6));
					bbs.setBbsreadcount(rs.getInt(7));
					bbs.setAuthor(rs.getString(10));
					
			
					list.add(bbs);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list; //데이터베이스 오류
		  }
		  // 제목
		  else if(col.equals("title"))
		  {
			  String SQL ="select * from (SELECT  @ROWNUM := @ROWNUM + 1 AS rs,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 )TMP where bbsTitle like ? AND boardID = ?  ORDER BY bbsID ) a where rs < ? order by rs desc LIMIT 10";
				ArrayList<Bbs> list = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
					pstmt.setInt(2, boardID);
					pstmt.setInt(3,  SgetNext(search,col) - (pageNumber - 1) * 10);
				
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
					
						bbs.setBbsID(rs.getInt(2));
						bbs.setBbsTitle(rs.getString(3));
						bbs.setUserID(rs.getString(4));
						bbs.setBbsDate(rs.getString(5));
						bbs.setBbsContent(rs.getString(6));
						bbs.setBbsreadcount(rs.getInt(7));
						bbs.setAuthor(rs.getString(11));
				
						list.add(bbs);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return list; //데이터베이스 오류
		  }else if(col.equals("content"))
		  {
			  String SQL ="select * from (SELECT  @ROWNUM := @ROWNUM + 1 AS rs,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 )TMP where bbsContent like ? AND boardID=? ORDER BY bbsID ) a where rs < ? order by rs desc LIMIT 10";
				ArrayList<Bbs> list = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
					pstmt.setInt(2, boardID);
					pstmt.setInt(3,  SgetNext(search,col) - (pageNumber - 1) * 10);
				
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
					
						bbs.setBbsID(rs.getInt(2));
						bbs.setBbsTitle(rs.getString(3));
						bbs.setUserID(rs.getString(4));
						bbs.setBbsDate(rs.getString(5));
						bbs.setBbsContent(rs.getString(6));
						bbs.setBbsreadcount(rs.getInt(7));
				
						list.add(bbs);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return list; //데이터베이스 오류
		  }
		  else if(col.equals("author"))
		  {
			  String SQL ="select * from (SELECT  @ROWNUM := @ROWNUM + 1 AS rs,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 )TMP where userID like ? AND boardID = ? ORDER BY bbsID ) a where rs < ? order by rs desc LIMIT 10";
				ArrayList<Bbs> list = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
					pstmt.setInt(2, boardID);
					pstmt.setInt(3,  SgetNext(search,col) - (pageNumber - 1) * 10);
				
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
					
						bbs.setBbsID(rs.getInt(2));
						bbs.setBbsTitle(rs.getString(3));
						bbs.setUserID(rs.getString(4));
						bbs.setBbsDate(rs.getString(5));
						bbs.setBbsContent(rs.getString(6));
						bbs.setBbsreadcount(rs.getInt(7));
				
						list.add(bbs);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return list; //데이터베이스 오류
		  }
		  else
		  {
			  return null;
		  }
		  
		  
		}

	  
	  public int SgetNext(String search,String col) {
		  	
		  	int k=0;
			String SQL;
			PreparedStatement pstmt = null;
			try {
				
				if(col.equals("none"))
				{	
					SQL ="SELECT  @ROWNUM := @ROWNUM + 1 AS ROWNUM,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 ) TMP where bbsTitle like ? OR bbsContent like ? or userID like ? ORDER BY bbsID DESC";
					pstmt=conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
					pstmt.setString(2,"%"+search+"%");
					pstmt.setString(3,"%"+search+"%");
					
				}
				else if(col.equals("title"))
				{
					SQL ="SELECT  @ROWNUM := @ROWNUM + 1 AS ROWNUM,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 ) TMP where bbsTitle like ? ORDER BY bbsID";
					pstmt=conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
				}
				else if(col.equals("content"))
				{
					SQL ="SELECT  @ROWNUM := @ROWNUM + 1 AS ROWNUM,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 ) TMP where bbsContent like ? ORDER BY bbsID";
					pstmt=conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
				}
				else if(col.equals("author"))
				{
					SQL ="SELECT  @ROWNUM := @ROWNUM + 1 AS ROWNUM,T.*FROM  bbs T ,(SELECT @ROWNUM := 0 ) TMP where userID like ? ORDER BY bbsID";
					pstmt=conn.prepareStatement(SQL);
					pstmt.setString(1,"%"+search+"%");
				}
			
				
				rs= pstmt.executeQuery();
				while(rs.next())
				{
					k=rs.getInt(1)+1 ;
					
				} 
				return k;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return -1;
		}
	  public int readcount(int bbsid) {
		  String SQL ="select bbsreadcount from bbs where bbsid=?";
			try {
				PreparedStatement pstmt=conn.prepareStatement(SQL);
				pstmt.setInt(1,bbsid);
				rs= pstmt.executeQuery();
				if(rs.next())
				{
					return rs.getInt(1);
				} 
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return -1;
		  
	  }
	  public int readcountUpdate(int bbsid) {
		  String SQL ="UPDATE bbs SET bbsreadcount=bbsreadcount+1 WHERE bbsid=?";
			try {
				PreparedStatement pstmt=conn.prepareStatement(SQL);
				pstmt.setInt(1,bbsid);
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return -1;
		  
	  }
	  
	  
	
}