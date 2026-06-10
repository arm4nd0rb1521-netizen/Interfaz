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
    <link rel="stylesheet" href="../CSS/formularios _Actualizar.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
        <title>Productos</title>
    <crear-header></crear-header>
    </head>
    <body>
        <h1>Ventas</h1>
        <%
          VentaDAO vdao = new VentaDAO();
            
            List <Venta> ventas = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Venta v = new Venta();
                v.setFecha(request.getParameter("venta"));
                v.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
                
                if(vdao.insertar(v)){
                    out.print("<script>alert('Venta registrada');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
                                out.print("<h2>Detalle de venta</h2>");
                out.print("<hr>");
                out.print("<form action='RegistrarDetalleVenta.jsp' method='post' name='reg_dtcompra'>");
                
                out.print("ID de la compra: <input type='text' name='id' ><br><br>'");
                out.print("Fecha: <input type='text' name='fecha' value='"+v.getFecha()+"' readonly><br><br>");
                out.print("ID del producto:<input type='text' name='prod' value='"+v.getIdUsuario()+"' readonly><br><br>");
                out.print("Subtotal: <input type='text' name='total'><br><br>");
                out.print("Cantidad: <input type='text' name='cantidad'><br><br>");
                out.print("Precio unitario: <input type='text' name='prec'><br><br>");
                
                out.print("<input type='submit' name='crear_detalle' value='Detalle de la compra'>");
                
                out.print("</form>");
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(vdao.eliminar(id)) {
                    out.print("<script>alert('Rol eliminado');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                Venta v= vdao.buscarUno(id);
                
                if(v != null) {
                    out.print("<script>alert('Consulta realizada')</script>");
                    
                    out.print("<table>");
                    
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Fecha </th>");
                    out.print("<th>ID usuario</th>");
                    
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+v.getIdVenta()+"</td>");
                    out.print("<td>"+v.getFecha()+"</td>");
                    out.print("<td>"+v.getIdUsuario()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                } else {
                    out.print("<script>alert('Producto no encontrado')</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                ventas = vdao.buscarTodo();
                
                if(!ventas.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Fecha </th>");
                    out.print("<th>ID usuario</th>");
                    
                    
                    out.print("</tr>");

                    for(Venta v: ventas) {

                        out.print("<tr>");

                  out.print("<td>"+v.getIdVenta()+"</td>");
                    out.print("<td>"+v.getFecha()+"</td>");
                    out.print("<td>"+v.getIdUsuario()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay roles registrados');</script>");

                }
            }

            if(request.getParameter("valida") != null) {

                Venta v = new Venta();

                v.setIdVenta(
                
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                v.setFecha(
                    request.getParameter("nombrecin")
                     );
                
                v.setIdUsuario(
                        Integer.parseInt(request.getParameter("usuario")));

                if(vdao.actualizar(v)) {

                    out.print(
                        "<script>alert('Rol actualizado');</script>"
                    );

                } else {

                    out.print(
                        "<script>alert('Error al actualizar');</script>"
                    );
                }
            }
        %>
        
 <div class="volver">

     <a href="../HTMLs/IVentas.html">
        Regresar
    </a>        
    </body>
    <crear-footer></crear-footer>
</html>

