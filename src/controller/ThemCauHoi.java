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
import model.CauHoi;

/**
 * Servlet implementation class ThemCauHoi
 */
@WebServlet("/ThemCauHoi")
public class ThemCauHoi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	CauHoiDAO cauhoiDAO = new CauHoiDAO();

	public ThemCauHoi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		CauHoi cauhoi = new CauHoi();
		cauhoi.setMaCH(request.getParameter("mach"));
		cauhoi.setNoiDung(request.getParameter("ndcauhoi"));
		cauhoi.setDapAnA(request.getParameter("PAA"));
		cauhoi.setDapAnB(request.getParameter("PAB"));
		cauhoi.setDapAnC(request.getParameter("PAC"));
		cauhoi.setDapAnD(request.getParameter("PAD"));
		cauhoi.setDapAn(request.getParameter("DA"));
		cauhoi.setMaMH(request.getParameter("maMH"));
		cauhoi.setMaND(request.getParameter("maND"));
		cauhoiDAO.insertCauHoi(cauhoi);
		response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
	}
}
