<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DetalleVentaDAO" %>
<%@page import="Modelo.DetalleVenta" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <%
            DetalleVentaDAO dtdao = new DetalleVentaDAO();
            List <DetalleVenta> detalles = new ArrayList<>();
            
            if(request.getParameter("crear_detalle") != null) {
                DetalleVenta dt = new DetalleVenta();
                dt.setIdVenta(Integer.parseInt(request.getParameter("id")));
                dt.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                dt.setSubtotal(Double.parseDouble(request.getParameter("total")));
                dt.setPrecioUnitario(Double.parseDouble(request.getParameter("prec")));
                dt.setIdProducto(Integer.parseInt(request.getParameter("prod")));
                
                if(dtdao.insertar(dt)){
                    out.print("<script>alert('Detalle de venta registrado');</script>");
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
                    out.print("<th>ID venta</th>");
                    out.print("<th>ID producto</th>");
                    
                    
                    out.print("</tr>");

                    for(DetalleVenta dt: detalles) {

                        out.print("<tr>");

                        out.print("<td>"+dt.getIdDetalleVenta()+"</td>");
                        out.print("<td>"+dt.getCantidad()+"</td>");
                        out.print("<td>"+dt.getPrecioUnitario()+"</td>");
                        out.print("<td>"+dt.getSubtotal()+"</td>");
                        out.print("<td>"+dt.getIdVenta()+"</td>");
                        out.print("<td>"+dt.getIdProducto()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay ventas realizadas');</script>");

                }
            }
        %>
    </body>
</html>
