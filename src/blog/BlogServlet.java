package blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BlogServlet")
public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BlogServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding() == null) { //파라미터 인코딩
			   request.setCharacterEncoding("utf-8");
			  }
		String cmd = request.getParameter("cmd");
		String view = null;
				
		if(cmd == null || cmd.equals("Home")) {
			view = "index.jsp";
		}else if(cmd.equals("회원가입")) {
			view = "user_register.jsp";
		}else if(cmd.equals("로그인")) {       //null.equals("str") : 예외발생
			view = "login_form.jsp";
		}else if(cmd.equals("로그아웃")) {
			view = "logout.jsp";
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
