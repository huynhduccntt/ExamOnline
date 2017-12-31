package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CauHoiDAO;
import dao.MonhocDAO;
import dao.NoiDungThiDAO;
import dao.RoleDAO;
import dao.UsersDAO;
import model.NoiDung;
import model.Users;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsersDAO usersDAO=new UsersDAO();
	RoleDAO roleDAO=new RoleDAO();
	CauHoiDAO cauHoiDAO=new CauHoiDAO();
	NoiDungThiDAO noiDungThiDAO=new NoiDungThiDAO();
	MonhocDAO monhocDAO=new MonhocDAO();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String command=request.getParameter("command");
		String userName=request.getParameter("UserName");
		String roleID=request.getParameter("RoleID");
		String mach=request.getParameter("MaCH");
		String mand=request.getParameter("MaND");
		String mamh=request.getParameter("MaMH");
		switch(command){
		case "deleteUser":
			boolean boo=usersDAO.delete(userName);
			if(boo){
				response.sendRedirect("/ExamOnline/DSTaiKhoan.jsp");
			}
			else{
				response.sendRedirect("/ExamOnline/Admin.jsp");
			}
			break;
		case "deleteRole":
			roleDAO.delete(roleID);
			response.sendRedirect("/ExamOnline/DSRole.jsp");
			break;
		case "deleteCH":
			cauHoiDAO.delete(mach);
			response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
			break;
		case "deleteND":
			noiDungThiDAO.delete(mand);
			response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
			break;
		case "deleteMH":
			monhocDAO.delete(mamh);
			response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
			break;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
