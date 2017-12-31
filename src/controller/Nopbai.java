package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CTThiDAO;
import dao.CauHoiDAO;
import dao.ThiDAO;
import model.CTThi;
import model.CauHoi;
import model.Thi;

/**
 * Servlet implementation class Nopbai
 */
@WebServlet("/Nopbai")
public class Nopbai extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ThiDAO thiDAO = new ThiDAO();
	CauHoiDAO cauHoiDAO = new CauHoiDAO();
	CTThiDAO ctThiDAO=new CTThiDAO();
	public Nopbai() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String made = request.getParameter("made");
		String username = request.getParameter("username");
		float count = 0;
		float diem = 0;
		int dung = 0;
		HttpSession session = request.getSession();
		try {
			count = cauHoiDAO.countCHByMaDe(made);
			dung = thiDAO.countRight(username, made);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		diem = (10 / count) * dung;
		CTThi ctThi=new CTThi();
		ctThi.setUsername(username);
		ctThi.setMaDe(made);
		ctThi.setDiem(diem);
		session.setAttribute("ctthi", ctThi);
		ctThiDAO.insert(new CTThi(made,username,diem));
		response.sendRedirect("/ExamOnline/NopBai.jsp");
	}
}
