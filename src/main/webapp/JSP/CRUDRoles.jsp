<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Rol" %>
<%@page import="DAO.RolDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
    </head>
    <body>
        <%
            RolDAO rdao = new RolDAO();
            
            List <Rol> roles = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Rol r = new Rol();
                r.setInombre(request.getParameter("rol"));
                
                if(rdao.insertar(r)){
                    out.print("<script>alert('Rol registrado');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(rdao.eliminar(id)) {
                    out.print("<script>alert('Rol eliminado');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                Rol r = rdao.buscarUno(id);
                
                if(r != null) {
                    out.print("<script>alert('Consulta realizada')</script>");
                    
                    out.print("<table>");
                    
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+r.getIdRol()+"</td>");
                    out.print("<td>"+r.getInombre()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                } else {
                    out.print("<script>alert('Producto no encontrado')</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                roles = rdao.buscarTodo();
                
                if(!roles.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    
                    out.print("</tr>");

                    for(Rol r : roles) {

                        out.print("<tr>");

                        out.print("<td>"+r.getIdRol()+"</td>");
                        out.print("<td>"+r.getInombre()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay roles registrados');</script>");

                }
            }

            if(request.getParameter("valida") != null) {

                Rol r = new Rol();

                r.setIdRol(
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                r.setInombre(
                    request.getParameter("nombrecin")
                );

                if(rdao.actualizar(r)) {

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
        
        <a href="../HTMLs/Productos.html">Regresar</a>
        
    </body>
</html>
