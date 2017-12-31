package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class KiemTraDapAn
 */
@WebServlet("/KiemTraDapAn")
public class KiemTraDapAn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CauHoiDAO cauHoiDAO = new CauHoiDAO();
	ThiDAO thiDAO = new ThiDAO();
	CTThiDAO ctThiDAO=new CTThiDAO();
	public KiemTraDapAn() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		String tl = request.getParameter("answer");
		if (tl == null)
			tl = "E";
		String mach = request.getParameter("mach");
		String made = request.getParameter("made");
		String username = request.getParameter("username");
		String pages = request.getParameter("pages");
		String sthi = request.getParameter("sthi");
		String mthi = request.getParameter("mthi");
		int page = Integer.parseInt(pages);
		CauHoi cauHoi = new CauHoi();
		try {
			cauHoi = cauHoiDAO.getCHwithMaCH(mach);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String da = cauHoi.getDapAn();
		Thi thi = new Thi();
		try {
			thi = thiDAO.getWithMaCH(mach, username);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		switch (command) {
		case "Next":
			if (thi != null) {
				thi.setUserName(username);
				thi.setMaCH(mach);
				thi.setMaDe(made);
				if (tl.equals("E")) {
					thi.setDAuser(null);
					thi.setDiem(0);
					try {
						thiDAO.update(thi);
						response.sendRedirect(
								"/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages=" + (page + 1)
										+ "&sthi=" + Integer.parseInt(sthi) + "&mthi=" + Integer.parseInt(mthi) + "");

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else if (tl.equals(da)) {
					thi.setDAuser(tl);
					thi.setDiem(1);
					try {
						thiDAO.update(thi);

						response.sendRedirect(
								"/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages=" + (page + 1)
										+ "&sthi=" + Integer.parseInt(sthi) + "&mthi=" + Integer.parseInt(mthi) + "");

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {
					thi.setDAuser(tl);
					thi.setDiem(0);
					try {
						thiDAO.update(thi);

						response.sendRedirect("/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages="
								+ (page + 1) + "&sthi=" + sthi + "&mthi=" + Integer.parseInt(mthi) + "");

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} else {
				Thi thi1 = new Thi();
				thi1.setUserName(username);
				thi1.setMaCH(mach);
				thi1.setMaDe(made);
				if (tl.equals("E")) {
					thi1.setDAuser(null);
					thi1.setDiem(0);
					try {
						thiDAO.insert(thi1);

						response.sendRedirect("/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages="
								+ (page + 1) + "&sthi=" + sthi + "&mthi=" + Integer.parseInt(mthi) + "");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if (tl.equals(da)) {
					thi1.setDAuser(tl);
					thi1.setDiem(1);
					try {
						thiDAO.insert(thi1);

						response.sendRedirect("/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages="
								+ (page + 1) + "&sthi=" + sthi + "&mthi=" + Integer.parseInt(mthi) + "");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else {
					thi1.setDAuser(tl);
					thi1.setDiem(0);
					try {
						thiDAO.insert(thi1);
						response.sendRedirect("/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages="
								+ (page + 1) + "&sthi=" + sthi + "&mthi=" + Integer.parseInt(mthi) + "");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			}
			break;
		case "Previous":
			response.sendRedirect("/ExamOnline/Thi.jsp?UserName=" + username + "&maDe=" + made + "&pages=" + (page - 1)
					+ "&sthi=" + Integer.parseInt(sthi) + "&mthi=" + Integer.parseInt(mthi) + "");

			break;
		case "Submit":
			double count = 0;
			double diem = 0;
			int dung = 0;
			int a=0;
			HttpSession session = request.getSession();
			try {
				count = cauHoiDAO.countCHByMaDe(made);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			if (thi != null) {
				thi.setUserName(username);
				thi.setMaCH(mach);
				thi.setMaDe(made);
				if (tl.equals("E")) {
					thi.setDAuser(null);
					thi.setDiem(0);
					try {
						thiDAO.update(thi);
						dung = thiDAO.countRight(username, made);
						a=(int)(((10.00 / count) * dung)*10);
						diem =(double)a/10;
						CTThi ctThi=new CTThi();
						ctThi.setUsername(username);
						ctThi.setMaDe(made);
						ctThi.setDiem(diem);
						session.setAttribute("ctthi", ctThi);
						ctThiDAO.insert(new CTThi(made,username,diem));
						response.sendRedirect(
								"/ExamOnline/NopBai.jsp");

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else if (tl.equals(da)) {
					thi.setDAuser(tl);
					thi.setDiem(1);
					try {
						thiDAO.update(thi);
						dung = thiDAO.countRight(username, made);
						a=(int)(((10.00 / count) * dung)*10);
						diem =(double)a/10;
						CTThi ctThi=new CTThi();
						ctThi.setUsername(username);
						ctThi.setMaDe(made);
						ctThi.setDiem(diem);
						session.setAttribute("ctthi", ctThi);
						ctThiDAO.insert(new CTThi(made,username,diem));
						response.sendRedirect(
								"/ExamOnline/NopBai.jsp");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {
					thi.setDAuser(tl);
					thi.setDiem(0);
					try {
						thiDAO.update(thi);
						dung = thiDAO.countRight(username, made);
						a=(int)(((10.00 / count) * dung)*10);
						diem =(double)a/10;
						CTThi ctThi=new CTThi();
						ctThi.setUsername(username);
						ctThi.setMaDe(made);
						ctThi.setDiem(diem);
						session.setAttribute("ctthi", ctThi);
						ctThiDAO.insert(new CTThi(made,username,diem));
						response.sendRedirect(
								"/ExamOnline/NopBai.jsp");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} else {
				Thi thi1 = new Thi();
				thi1.setUserName(username);
				thi1.setMaCH(mach);
				thi1.setMaDe(made);
				if (tl.equals("E")) {
					thi1.setDAuser(null);
					thi1.setDiem(0);
					try {
						thiDAO.insert(thi1);
						dung = thiDAO.countRight(username, made);
						a=(int)(((10.00 / count) * dung)*10);
						diem =(double)a/10;
						CTThi ctThi=new CTThi();
						ctThi.setUsername(username);
						ctThi.setMaDe(made);
						ctThi.setDiem(diem);
						session.setAttribute("ctthi", ctThi);
						ctThiDAO.insert(new CTThi(made,username,diem));
						response.sendRedirect(
								"/ExamOnline/NopBai.jsp");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else if (tl.equals(da)) {
					thi1.setDAuser(tl);
					thi1.setDiem(1);
					try {
						thiDAO.insert(thi1);
						dung = thiDAO.countRight(username, made);
						a=(int)(((10.00 / count) * dung)*10);
						diem =(double)a/10;
						CTThi ctThi=new CTThi();
						ctThi.setUsername(username);
						ctThi.setMaDe(made);
						ctThi.setDiem(diem);
						session.setAttribute("ctthi", ctThi);
						ctThiDAO.insert(new CTThi(made,username,diem));
						response.sendRedirect(
								"/ExamOnline/NopBai.jsp");					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else {
					thi1.setDAuser(tl);
					thi1.setDiem(0);
					try {
						thiDAO.insert(thi1);
						dung = thiDAO.countRight(username, made);
						a=(int)(((10.00 / count) * dung)*10);
						diem =(double)a/10;
						CTThi ctThi=new CTThi();
						ctThi.setUsername(username);
						ctThi.setMaDe(made);
						ctThi.setDiem(diem);
						session.setAttribute("ctthi", ctThi);
						ctThiDAO.insert(new CTThi(made,username,diem));
						response.sendRedirect(
								"/ExamOnline/NopBai.jsp");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			break;
		}
	}
}
