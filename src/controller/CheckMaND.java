package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MonhocDAO;
import dao.NoiDungThiDAO;

/**
 * Servlet implementation class CheckMaND
 */
@WebServlet("/CheckMaND")
public class CheckMaND extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckMaND() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String mand=request.getParameter("mand");
      if (NoiDungThiDAO.check(mand)) {
    
          response.getWriter().write("<img src=\"assets/Images/not-available.png\" /><span style=\"color:red;margin-left: 10px\">Mã nội dung đã tồn tại</span>");
      } else 
          if(mand.equals("")) 
              return;
          else
            response.getWriter().write("<img src=\"assets/Images/available.png\" /><span style=\"color:green;margin-left: 10px\"></span>");
      }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
