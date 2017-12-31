package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeThiDAO;
import dao.MonhocDAO;
import dao.NoiDungThiDAO;
import dao.RoleDAO;
import dao.UsersDAO;
import model.DeThi;
import model.MonHoc;
import model.NoiDung;
import model.Role;
import model.Users;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoleDAO roleDAO = new RoleDAO();
	UsersDAO usersDAO = new UsersDAO();
	MonhocDAO monhocDAO=new MonhocDAO();
	NoiDungThiDAO noiDungThiDAO=new NoiDungThiDAO();
	DeThiDAO deThiDAO=new DeThiDAO();
	public Update() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");

		String roleid = request.getParameter("roleid");
		String rolename = request.getParameter("rolename");
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		String Fullname = request.getParameter("fullname");
		String numberphone = request.getParameter("numberphone");
		String email = request.getParameter("email");
		String mamh=request.getParameter("mamh");
		String tenmh=request.getParameter("tenmh");
		String mand=request.getParameter("mand");
		String tennd=request.getParameter("tennd");
		String made=request.getParameter("made");
		String tende=request.getParameter("tende");
		String thoigian=request.getParameter("thoigian");
		Role r = new Role();
		Users users = new Users();

		switch (command) {
		case "updateRole":
			r.setRoleID(roleid);
			r.setRoleName(rolename);
			roleDAO.update(r);
			response.sendRedirect("/ExamOnline/DSRole.jsp");
			break;
		case "updateTK":
			users.setUserName(Username);
			users.setPassword(Password);
			users.setFullname(Fullname);
			users.setNumberPhone(numberphone);
			users.setEmail(email);
			try {
				usersDAO.updateUsers1(users);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("/ExamOnline/DSTaiKhoan.jsp");
			break;
		case "updateMH":
			monhocDAO.update(new MonHoc(mamh,tenmh));
			response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
			break;
		case "updateND":
			noiDungThiDAO.update(new NoiDung(mand,tennd,mamh));
			response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
			break;
		case "updateDE":
			deThiDAO.update(new DeThi(made,tende,thoigian));
			response.sendRedirect("/ExamOnline/NguoiRaDe-QLD.jsp");
			break;
		}
	}

}
