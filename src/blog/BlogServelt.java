package blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;


@WebServlet("/BlogServelt")
public class BlogServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BlogServelt() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null) { //파라미터 인코딩
			   request.setCharacterEncoding("utf-8");
			  }
		String cmd = request.getParameter("cmd");
		String view = null;
				
		if(cmd == null) {
			view = "index.jsp";
			cmd = "index";
			request.setAttribute(cmd, "Hello!");
//		}else if(cmd.equals("logout")) {
//			view = "logout.jsp";
//			cmd = "logout";
//			request.setAttribute(cmd, "로그아웃");
//		}else if(cmd.equals("reg")) {       //null.equals("str") : 예외발생
//				view = "member_reg.jsp";
//				cmd = "member_reg";
//				request.setAttribute(cmd, "회원가입 페이지입니다.");
//		}else if(cmd.equals("mod")) {
//				view = "member_info.jsp";
//				cmd = "member_mod";
//				request.setAttribute(cmd, "회원 정보변경 페이지입니다.");
//		}else if(cmd.equals("login")) {
//				view = "member_login.jsp";
//				cmd = "login"; 
//				request.setAttribute(cmd, "로그인되었습니다.");
		}
//		request.setAttribute(cmd,cmd);
		RequestDispatcher dis = request.getRequestDispatcher(view);
		dis.forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
