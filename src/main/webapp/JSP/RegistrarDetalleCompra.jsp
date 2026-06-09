<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DetalleCompraDAO" %>
<%@page import="Modelo.DetalleCompra" %>
<%@page import="Modelo.Compra" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de cmpras</title>
    </head>
    <body>
        <%
            DetalleCompraDAO dtdao = new DetalleCompraDAO();
            List <DetalleCompra> detalles = new ArrayList<>();
            
            if(request.getParameter("crear_detalle") != null) {
                DetalleCompra dt = new DetalleCompra();
               try {
                         dt.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                dt.setPrecioUnitario(Double.parseDouble(request.getParameter("prec")));
                dt.setSubtotal(Double.parseDouble(request.getParameter("total")));
                dt.setIdCompra(Integer.parseInt(request.getParameter("id")));
                dt.setIdProducto(Integer.parseInt(request.getParameter("prod")));
                   } catch (Exception e) {
                       out.print("<script>alert('Error: " + e.getMessage() + "')</script>");
                   }
               
 
              
                
                if(dtdao.insertar(dt)){
                    out.print("<script>alert('Detalle de compra registrado');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                detalles = dtdao.buscarTodo();
                
                if(!detalles.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Cantidad</th>");
                    out.print("<th>Precio unitario</th>");
                    out.print("<th>Subtotal</th>");
                    out.print("<th>Proveedor</th>");
                    out.print("<th>Usuario</th>");
                    
                    
                    out.print("</tr>");

                    for(DetalleCompra dt: detalles) {

                    out.print("<tr>");

                    out.print("<td>"+dt.getIdDetalleCompra()+"</td>");
                    out.print("<td>"+dt.getCantidad()+"</td>");
                    out.print("<td>"+dt.getPrecioUnitario()+"</td>");
                    out.print("<td>"+dt.getSubtotal()+"</td>");
                    out.print("<td>"+dt.getIdCompra()+"</td>");
                    out.print("<td>"+dt.getIdProducto()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay compras realizadas');</script>");

                }
            }
        %>
    </body>
</html>