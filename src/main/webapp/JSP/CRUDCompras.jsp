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
            <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
        <title>Productos</title>
    </head>
     <crear-header></crear-header>
    <body>
        <h1>Compras</h1>
               
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
                                out.print("<h2>Detalle de compra</h2>");
                out.print("<hr>");
                out.print("<form action='RegistrarDetalleCompra.jsp' method='post' name='reg_dtcompra'>");
                
                out.print("ID de la compra: <input type='text' name='id'><br><br>");
                out.print("Fecha: <input type='text' name='fecha' value='"+c.getFecha()+"' readonly><br><br>");
                out.print("Subtotal: <input type='text' name='total' value='"+c.getTotal()+"' readonly><br><br>");
                out.print("ID del producto:<input type='text' name='prod' value='"+c.getIdUsuario()+"' readonly><br><br>");
                out.print("Cantidad: <input type='text' name='cantidad'><br><br>");
                out.print("Precio unitario: <input type='text' name='prec'><br><br>");
                
                out.print("<input type='submit' name='crear_detalle' value='Detalle de la compra'>");
                
                out.print("</form>");
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
                if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(cdao.eliminar(id)) {
                    out.print("<script>alert('Compra eliminada');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            }
        %>
                <crear-footer></crear-footer>
        <a href="../HTMLs/Compras.html">Regresar</a>
        
    </body>
</html>

