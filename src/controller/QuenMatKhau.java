package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;
import model.Users;
import tools.RandomPass;
import tools.SendMail;

/**
 * Servlet implementation class QuenMatKhau
 */
@WebServlet("/QuenMatKhau")
public class QuenMatKhau extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	RandomPass ran=new RandomPass();
	SendMail send=new SendMail();
	UsersDAO usersDAO=new UsersDAO();
    public QuenMatKhau() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");
		String pass=ran.generateRandomPassword();
		String user=request.getParameter("username");
		Users u=new Users();
		u.setPassword(pass);
		u.setUserName(user);
		usersDAO.updatePass(u);
		SendMail.sendMail(email, "Mật khẩu trang trắc nghiệm online","<p>Chào bạn</p><br><p>Hệ thống đã reset mật khẩu của bạn thành công, bạn có thể dùng"
				+ "mật khẩu: "+pass+" để đăng nhập vào trang trắc nghiệm online, sau đó hãy thực hiện bước thay đổi mật khẩu lại</p>");
		response.sendRedirect("ExamOnline/Login.jsp");
	}

}
