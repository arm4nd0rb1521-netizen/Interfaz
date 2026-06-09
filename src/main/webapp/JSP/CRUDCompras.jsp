<%@page import="Modelo.Compra"%>
<%@page import="DAO.CompraDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Venta" %>
<%@page import="DAO.VentaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
    </head>
    <body>
        <%
          CompraDAO cdao = new CompraDAO();
            
            List <Compra> compras = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Compra c = new Compra();
                c.setFecha(request.getParameter("compra"));
                c.setTotal(Double.parseDouble(request.getParameter("total")));
                c.setIdProveedor(Integer.parseInt(request.getParameter("id_prov")));
                c.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
                
                if(cdao.insertar(c)){
                    out.print("<script>alert('Compra registrada');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                compras = cdao.buscarTodo();
                
                if(!compras.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Fecha </th>");
                    out.print("<th>Total </th>");
                    out.print("<th>Proveedor</th>");
                    out.print("<th>Usuario</th>");
                    
                    
                    out.print("</tr>");

                    for(Compra c: compras) {

                        out.print("<tr>");

                  out.print("<td>"+c.getIdCompra()+"</td>");
                    out.print("<td>"+c.getFecha()+"</td>");
                    out.print("<td>"+c.getTotal()+"</td>");
                    out.print("<td>"+c.getNombreProv()+"</td>");
                    out.print("<td>"+c.getNombreUsuario()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay compras realizadas');</script>");

                }
            }
        %>
        
        <a href="../HTMLs/Compras.html">Regresar</a>
        
    </body>
</html>

