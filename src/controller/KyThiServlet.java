package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KyThiDAO;
import model.KyThi;

/**
 * Servlet implementation class KyThiServlet
 */
@WebServlet("/KyThiServlet")
public class KyThiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	KyThiDAO kyThiDAO = new KyThiDAO();

	public KyThiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String maDe=request.getParameter("made");
		try {
			kyThiDAO.delete(maDe);
			response.sendRedirect("/ExamOnline/NguoiQLKT.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/ExamOnline/index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		String maDe = request.getParameter("made");
		String lop = request.getParameter("lop");
		String ngaythi = request.getParameter("ngaythi");
		String thoigian = request.getParameter("giothi");
		String phong = request.getParameter("phongthi");
		KyThi kt = new KyThi();
		switch (command) {
		case "insert":
			try {
				kt.setMaDe(maDe);
				kt.setLopThi(lop);
				kt.setThoiGian(Time.valueOf(thoigian));
				kt.setNgayThi(Date.valueOf(ngaythi));
				kt.setPhongThi(phong);
				kyThiDAO.insert(kt);
				response.sendRedirect("/ExamOnline/NguoiQLKT.jsp");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("/ExamOnline/index.jsp");
			}
			break;
		case "update":
			try {
				kt.setMaDe(maDe);
				kt.setLopThi(lop);
				kt.setThoiGian(Time.valueOf(thoigian));
				kt.setNgayThi(java.sql.Date.valueOf(ngaythi));
				kt.setPhongThi(phong);
				kyThiDAO.update(kt);
				response.sendRedirect("/ExamOnline/NguoiQLKT.jsp");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("/ExamOnline/index.jsp");
			}
			break;
		}

	}

}
