package kr.or.kh.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.mb")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDTO memberDTO;
	private MemberDAO memberDAO;
	private int cnt;
	private ArrayList<MemberDTO> memberList;
		
	public MemberServlet() {
		memberDTO = new MemberDTO();
		memberDAO = new MemberDAO();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		HttpSession session=request.getSession();
		
		if(command.equals("/memberRegister.mb")) {
			memberDTO.setName(request.getParameter("NAME"));
			memberDTO.setAddr(request.getParameter("ADDR"));
			memberDTO.setTel(request.getParameter("TEL"));	
			memberDTO.setId(request.getParameter("ID"));
			memberDTO.setPw(request.getParameter("PW"));
			memberDTO.setStype(request.getParameter("STYPE"));
			try {
				cnt=memberDAO.memberRegister(memberDTO);
				request.setAttribute("ID", memberDTO.getId());
				request.setAttribute("NAME", memberDTO.getName());
				response.sendRedirect("index.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberList.mb")) {
			try {
				memberList = memberDAO.memberList();
				RequestDispatcher dis = request.getRequestDispatcher("memberList.jsp");
				request.setAttribute("memberList", memberList);
				dis.forward(request, response);	

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberLogin.mb")) {//로그인
			String id=request.getParameter("ID");
			String pw=request.getParameter("PW");
			
			try {
				memberDTO = memberDAO.memberLogin(id,pw);
				if(id.equals(memberDTO.getId())) {
					if(pw.equals(memberDTO.getPw())) {
						session = request.getSession();
						session.setAttribute("ID",id);
						session.setAttribute("NAME", memberDTO.getName());
						response.sendRedirect("index.jsp");
					} else {
						out.print("<script>alert('비밀번호가 다릅니다.');</script>");
						out.print("<script>history.back();</script>");
					}
				} else {
					out.print("<script>alert('아이디가 존재하지 않습니다.');</script>");
					out.print("<script>history.back();</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//로그인
		
		else if(command.equals("/memberSearch.mb")) {
			String nameSearch = request.getParameter("nameSearch");
			String stype = request.getParameter("STYPE");
			try {
				if(stype.equals("all")) {
					memberList = memberDAO.memberSearchAll(nameSearch);
				} else {
				memberList = memberDAO.memberSearchBystype(nameSearch,Integer.parseInt(stype));
				}
				RequestDispatcher dis = request.getRequestDispatcher("memberList.jsp");
				request.setAttribute("memberList", memberList);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/memberUpdateConfirm.mb")) {
			String id = (String)session.getAttribute("ID");
			try {
				memberDTO = memberDAO.memberUpdateConfirm(id);
				RequestDispatcher dis = request.getRequestDispatcher("memberUpdateConfirm.jsp");
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/memberUpdateFinal.mb")) {//최종수정
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setName(request.getParameter("name"));
			memberDTO.setAddr(request.getParameter("addr"));
			memberDTO.setTel(request.getParameter("tel"));	
			memberDTO.setStype(request.getParameter("stype"));
			String idSearch = request.getParameter("idSearch");
			try {
				cnt=memberDAO.memberUpdateFinal(memberDTO, idSearch);
				session.setAttribute("id", memberDTO.getId());
				if(memberDTO.getStype()=="0") {
					response.sendRedirect("memberList.mb");	
				}
				else {
					response.sendRedirect("index.jsp");	
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}//최종수정
		
		else if(command.equals("/memberLogout.mb")) {//로그아웃
			session.invalidate();
			response.sendRedirect("index.jsp");
		}//로그아웃
/**********************************************************진행중*******************************************************/
		else if(command.equals("/idcheckConfirm.mb")) {//아이디검색
			String telSearch = request.getParameter("tel");
			String id=null;
			try {
				id=memberDAO.memberIdcheck(telSearch);
				out.print("찾는 아이디입니다 : [ "+id+" ]<p>");
				out.print("<a href=LoginForm.jsp><input type='button' value='로그인'></a>");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//아이디검색
		
		else if(command.equals("/memberDelete.mb")) {//회원탈퇴	
			String pw = request.getParameter("pw");//사용자가 입력한 삭제하기위한 패스워드
			if(pw.equals(session.getAttribute("PW"))) {
				String idDelete = (String)session.getAttribute("ID");
				String pwDelete = (String)session.getAttribute("PW");
				try {
					cnt = memberDAO.memberDelete(idDelete,pwDelete);
					out.print("<script>alert('탈퇴되었습니다.'); location.href='memberLogout.mb'</script>");
					//response.sendRedirect("memberLogout.mb");					
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}else {
				out.print("<script>alert('패스워드가 틀렸습니다.');</script>");
			}
			
		}//회원탈퇴
		else if(command.equals("/passcheckConfirm.mb")) {//패스워드검색
			String id = request.getParameter("id");
			try {
				String pw = memberDAO.memberPwcheck(id);
				out.print("찾는 비밀번호입니다 : [ "+pw+" ]<p>");
				out.print("<a href=LoginForm.jsp><input type='button' value='로그인'></a>");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//패스워드검색
	
		else if(command.equals("/idcheck.mb")) {
			String idSearch = request.getParameter("id");
			try {
				ResultSet rs = memberDAO.memberIdCheckall(idSearch);
				while(rs.next()) {
					memberDTO.setId(rs.getString("id"));
				}
				if(idSearch.equals(memberDTO.getId())) {
					out.print("이미 있는 아이디입니다.<br>");
					out.print("<input type='button' value='종료' onClick='self.close()'>");
					
				}else {
					out.print("사용가능한 아이디입니다.<br>");
					out.print("<input type='button' value='종료' onClick='self.close()'>");

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		else if(command.equals("/checkInfo.mb")) {
			String id = (String) session.getAttribute("ID");
			try {
				
				memberDTO = memberDAO.memberUpdateConfirm(id);
				RequestDispatcher dis = request.getRequestDispatcher("updateInfo.jsp");
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}
