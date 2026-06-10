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
         <link rel="stylesheet" href="../CSS/tablas.css"/>
                     <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
        <title>Detalle de cmpras</title>
             <crear-header></crear-header>
    </head>
    <body>
        <h1>Compras</h1>
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
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(dtdao.eliminar(id)) {
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                detalles = dtdao.buscarTodo();
                
                if(!detalles.isEmpty()) {
                    
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
            
if(request.getParameter("valida") != null) {

                DetalleCompra dt = new DetalleCompra();

                dt.setIdDetalleCompra(
                
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                dt.setCantidad(
                    Integer.parseInt(request.getParameter("cantidad"))
                     );
                
                dt.setPrecioUnitario(
                        Double.parseDouble(request.getParameter("precioU"))
                );
                
                dt.setSubtotal(
                        Double.parseDouble(request.getParameter("subtotal"))
                );
                
                dt.setIdCompra(
                        Integer.parseInt(request.getParameter("idCompra"))
                );
                
                dt.setIdProducto(
                        Integer.parseInt(request.getParameter("idProd"))
                );

                if(dtdao.actualizar(dt)) {


                } else {

                    out.print(
                        "<script>alert('Error al actualizar');</script>"
                    );
                }
            }
        %>
           <div class="volver">

               <a href="../HTMLs/DetalleCompra.html">
        Regresar
    </a>    
 </div>
             <crear-footer></crear-footer>
    </body>
</html>