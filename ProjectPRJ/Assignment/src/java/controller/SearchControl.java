/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.PagingProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

import model.Product;

/**
 *
 * @author dinhd513
 */
public class SearchControl extends HttpServlet {
   
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        
                DAO dao = new DAO();
        PagingProductDAO paginDao = new PagingProductDAO();
        
        String txt = request.getParameter("searchtxt");
        List<Product> listP = dao.getAllProductByName(txt);
        if(listP.size() == 0){
            request.setAttribute("mess", "Don't have product have this name");
            request.setAttribute("messDisplay", "block ;text-align: center; margin: 200px");
            
        }else{
            request.setAttribute("messDisplay", "none");
        }
        request.setAttribute("none1", "none");
        request.setAttribute("none2", "none");
        request.setAttribute("none3", "none");
       
        
        request.setAttribute("listProduct", listP);
        request.getRequestDispatcher("shopAll.jsp").forward(request, response);
   
       
        
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO dao = new DAO();
        PagingProductDAO paginDao = new PagingProductDAO();
        
        String txt = request.getParameter("searchtxt");
        List<Product> listP = dao.getAllProductByName(txt);
        
        if(listP.size() == 0){
            request.setAttribute("mess", "Don't have product have this name");
            request.setAttribute("messDisplay", "block ;text-align: center; margin: 200px");
            
        }else{
            request.setAttribute("messDisplay", "none");
        }
        request.setAttribute("none1", "none");
        request.setAttribute("none2", "none");
        request.setAttribute("none3", "block");
       
        
        request.setAttribute("listProduct", listP);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
     
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
