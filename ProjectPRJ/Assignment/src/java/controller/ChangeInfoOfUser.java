/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.OrderToManage;

/**
 *
 * @author dinhd513
 */
public class ChangeInfoOfUser extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeInfoOfUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInfoOfUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        request.setAttribute("none1", "block");
        HttpSession session = request.getSession();
        Object o = session.getAttribute("account");
        Account acc = (Account) o;
        if (acc == null) {
            response.sendRedirect("error404.jsp");

        } else {
            Account acc2 = dao.getAccount(acc.getAccId(), acc.getAccPassword());

            request.setAttribute("accName", acc2.getName());
            request.setAttribute("accAdrress", acc2.getAddress());
            request.setAttribute("accPhone", acc2.getPhone());
            request.setAttribute("none1", "block");
            request.setAttribute("none", "none");
            request.getRequestDispatcher("userInfo.jsp").forward(request, response);
        }

    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object o = session.getAttribute("account");
        Account acc = (Account) o;
        String accId = acc.getAccId();
        String accPass = acc.getAccPassword();
        String name = request.getParameter("accName");
        String address = request.getParameter("accAdrress");
        String phone = request.getParameter("accPhone");

        DAO dao = new DAO();

        dao.ChangeInfoInUserPage(name, phone, address, accId);
        request.setAttribute("mess", "Update success");
        Account accc = dao.getAccount(accId, accPass);
        session.setAttribute("account", accc);
        List<OrderToManage> list2 = dao.getListOrderOfUser(accId);
        request.setAttribute("listOrderOfUser", list2);
        request.getRequestDispatcher("userInfo.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
