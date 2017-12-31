package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CTThiDAO;
import model.CTThi;

/**
 * Servlet implementation class KetThucBaiThi
 */
@WebServlet("/KetThucBaiThi")
public class KetThucBaiThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CTThiDAO ctThiDAO=new CTThiDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KetThucBaiThi() {
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
		String made=request.getParameter("made");
		String username=request.getParameter("username");
		String diem=request.getParameter("diem");
		
		CTThi ctt=new CTThi();
		ctt.setMaDe(made);
		ctt.setUsername(username);
		ctt.setDiem(Double.parseDouble(diem));
		ctThiDAO.insert(ctt);
		response.sendRedirect("/ExamOnline/index.jsp");
	}

}
