package controller;

import dao.RoleDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import tools.MD5;
/**
 *
 * @author Kelvin
 */
import tools.SendMail;
public class UserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	UsersDAO usersDAO = new UsersDAO();
	RoleDAO roleDAO = new RoleDAO();
//	SendMail sendMail=new SendMail();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		Users users = new Users();
		PrintWriter out = response.getWriter();
		String pass=request.getParameter("password");
		String username=request.getParameter("username");
		switch (command) {
		case "insert":
			
			users.setUserName(username);
			users.setPassword(MD5.encryption(pass));
			users.setFullname(request.getParameter("fullname"));
			users.setEmail(request.getParameter("email"));
			users.setNumberPhone(request.getParameter("numberphone"));
			users.setRoleId(request.getParameter("Role"));
			users.setMaLop(request.getParameter("lop"));
			usersDAO.insertUsers(users);
//			SendMail.sendMail(request.getParameter("email"), "Tài khoản thi trắc nghiệm online"
//					, "<p>Chào bạn</p><br><p>Bạn đã được tạo một tài khoản trên trang trắc nghiệm online với tài khoản là MSSV và mật khẩu là"
//							+ ""+pass+"</p>");
			HttpSession session = request.getSession();
			if (users != null) {
				session.setAttribute("insertUsers", users);
				response.sendRedirect("/ExamOnline/DSTaiKhoan.jsp");
			}
			break;
		case "login":
			users = usersDAO.login(username, pass,
					request.getParameter("Role"));
			String roles = request.getParameter("Role");

			if (users != null) {
				if (roles.equals("Admin")) {
					HttpSession session1 = request.getSession();
					session1.setAttribute("userAdmin", users);
					response.sendRedirect("/ExamOnline/Admin.jsp");
				}
				if (roles.equals("QLNHCH")) {
					HttpSession session1 = request.getSession();
					session1.setAttribute("userNHCH", users);
					response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
				}
				if (roles.equals("QLD")) {
					HttpSession session1 = request.getSession();
					session1.setAttribute("userQLDE", users);
					response.sendRedirect("/ExamOnline/NguoiRaDe-QLD.jsp");
				}
				if (roles.equals("QLKT")) {
					HttpSession session1 = request.getSession();
					session1.setAttribute("userQLKT", users);
					response.sendRedirect("/ExamOnline/NguoiQLKT.jsp");
				}
				if (roles.equals("SV")) {
					HttpSession session1 = request.getSession();
					session1.setAttribute("userSV", users);
					response.sendRedirect("/ExamOnline/SinhVien.jsp");
				}
			} else {
				
                out.println("<html>");
				out.println("<script type=\"text/javascript\">");
                out.println("alert('Sai tên tài khoản hoặc mật khẩu');");
                out.println("location='Login.jsp';");
                out.println("</script>");
			}
			break;
		case "updateProfile":
			String date=request.getParameter("birthday");
			users.setUserName(request.getParameter("UserName"));
			users.setFullname(request.getParameter("fullname"));
			users.setGender(request.getParameter("sex"));
			users.setBirthday(Date.valueOf(date));
			users.setNumberPhone(request.getParameter("numberphone"));
			users.setAddress(request.getParameter("address"));
			try {
				usersDAO.updateUsers2(users);
			} catch (SQLException ex) {
				Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
			}

			String user_name = request.getParameter("UserName");
			HttpSession session2 = request.getSession();
			if (users != null) {
				session2.setAttribute("updateProfile", users);
				response.sendRedirect("/ExamOnline/Profile.jsp?UserName=" + user_name);
			}
			break;
		}
	}
}
