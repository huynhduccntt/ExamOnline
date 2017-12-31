package controller;

import dao.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kelvin
 */
public class CheckRole extends HttpServlet {

    RoleDAO roleDAO=new RoleDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String roleid=request.getParameter("roleid");
      if (roleDAO.check(roleid)) {
    
          response.getWriter().write("<img src=\"assets/Images/not-available.png\" /><span style=\"color:red;margin-left: 10px\">vai trò đã tồn tại</span>");
      } else 
          if(roleid.equals("")) 
              return;
          else
            response.getWriter().write("<img src=\"assets/Images/available.png\" />");
      }
    }
