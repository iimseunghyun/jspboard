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
			view = "login_form.jsp";
		}else if(cmd.equals("회원가입")) {
			view = "login_form.jsp";
		}else if(cmd.equals("로그인")) {
			view = "login_form.jsp";
		}else if(cmd.equals("로그아웃")) {
			view = "logout.jsp";
		}else if(cmd.equals("admin_login")) {
			view = "login_form.jsp";
		}else if(cmd.equals("post관리")) {
			view = "admin_postlist.jsp";
		}else if(cmd.equals("회원탈퇴")) {
			view = "user_delete.jsp";
		}else if(cmd.equals("수정")) {
			view = "user_update.jsp";
		}else if(cmd.equals("나의정보")) {
			view = "user_info.jsp";
		}else if(cmd.equals("변경하기")) {
			view = "updater.jsp";
		}
		RequestDispatcher dis = request.getRequestDispatcher(view);
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
