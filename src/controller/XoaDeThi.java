package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeThiDAO;
import dao.UsersDAO;

/**
 * Servlet implementation class XoaDeThi
 */
@WebServlet("/XoaDeThi")
public class XoaDeThi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	DeThiDAO deThiDAO = new DeThiDAO();

	public XoaDeThi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maDe = request.getParameter("maDe");
		try {
			boolean a=deThiDAO.delete(maDe);
			if(a){
			response.sendRedirect("/ExamOnline/NguoiRaDe-QLD.jsp");
			}
			else{
				response.sendRedirect("/ExamOnline/NguoiRaDe-QLD.jsp");
			}
		} catch (SQLException e) {
			Logger.getLogger(DeThiDAO.class.getName()).log(Level.SEVERE, null, e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
