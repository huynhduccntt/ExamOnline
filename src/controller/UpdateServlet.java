package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CauHoiDAO;
import model.CauHoi;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   CauHoiDAO cauHoiDAO=new CauHoiDAO();
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String mach=request.getParameter("mach");
		String nd=request.getParameter("nd");
		String mand=request.getParameter("mand");
		String mamh=request.getParameter("mamh");
		String daa=request.getParameter("paa");
		String dab=request.getParameter("pab");
		String dac=request.getParameter("pac");
		String dad=request.getParameter("pad");
		String da=request.getParameter("da");

		try {
			if(cauHoiDAO.update(new CauHoi(mach,nd,daa,dab,dac,dad,da,mamh,mand)))
				response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
			else
				response.sendRedirect("/ExamOnline/NguoiQTNHCH.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
