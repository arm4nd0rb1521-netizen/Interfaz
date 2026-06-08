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
          VentaDAO vdao = new VentaDAO();
            
            List <Venta> ventas = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Venta v = new Venta();
                v.setFecha(request.getParameter("venta"));
                v.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
                
                if(vdao.insertar(v)){
                    out.print("<script>alert('Rol registrado');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
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
        
        <a href="../HTMLs/IVentas.html">Regresar</a>
        
    </body>
</html>

