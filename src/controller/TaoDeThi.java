package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CTDeThiDAO;
import dao.CauHoiDAO;
import dao.DeThiDAO;
import model.CTDeThi;
import model.CauHoi;
import model.DeThi;

/**
 * Servlet implementation class TaoDeThi
 */
@WebServlet("/TaoDeThi")
public class TaoDeThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	CauHoiDAO cauHoiDAO=new CauHoiDAO();
	DeThiDAO deThiDAO=new DeThiDAO();
	CTDeThiDAO ctDeThiDAO=new CTDeThiDAO();
    public TaoDeThi() {
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
		String maDe=request.getParameter("made");
		String tenDe=request.getParameter("tende");
		String maMH=request.getParameter("mamh");
		String maND=request.getParameter("mand");
		String SL=request.getParameter("socauhoi");
		String thoigian=request.getParameter("thoigian");
		CTDeThi ctDeThi =new CTDeThi();
		DeThi dt=new DeThi();
		try {
			dt.setMaDe(maDe);
			dt.setTenDe(tenDe);
			dt.setThoiGian(thoigian);
			deThiDAO.insert(dt);
			
			for(CauHoi c:cauHoiDAO.randomCH(maMH, maND, SL)){
				ctDeThi.setMaDe(maDe);
				ctDeThi.setMaCH(c.getMaCH());
				ctDeThiDAO.insert(ctDeThi);
			}
			response.sendRedirect("/ExamOnline/NguoiRaDe-QLD.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}