<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Categoria" %>
<%@page import="DAO.CategoriaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
    </head>
    <body>
        <%
            CategoriaDAO cdao = new CategoriaDAO();
            
            List <Categoria> categorias = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Categoria c = new Categoria();
                c.setNombre(request.getParameter("nombre"));
                c.setDescripcion(request.getParameter("desc"));
                
                if(cdao.insertar(c)){
                    out.print("<script>alert('Categoria registrada');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(cdao.eliminar(id)) {
                    out.print("<script>alert('Categoria eliminada');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                Categoria c = cdao.buscarUno(id);
                
                if(c != null) {
                    out.print("<script>alert('Consulta realizada')</script>");
                    
                    out.print("<table>");
                    
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Descripcion</th>");
                    
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+c.getIdCategoria()+"</td>");
                    out.print("<td>"+c.getNombre()+"</td>");
                    out.print("<td>"+c.getDescripcion()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                } else {
                    out.print("<script>alert('Categoria no encontrada')</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                categorias = cdao.buscarTodo();
                
                if(!categorias.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Descripcion</th>");
                    
                    out.print("</tr>");

                    for(Categoria c : categorias) {

                        out.print("<tr>");
                    
                        out.print("<td>"+c.getIdCategoria()+"</td>");
                        out.print("<td>"+c.getNombre()+"</td>");
                        out.print("<td>"+c.getDescripcion()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay categorias registradas');</script>");

                }
            }

            if(request.getParameter("valida") != null) {

                Categoria c = new Categoria();

                c.setIdCategoria(
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                c.setNombre(
                    request.getParameter("nombrecin")
                );

                c.setDescripcion(
                    request.getParameter("desc")
                );

                if(cdao.actualizar(c)) {

                    out.print(
                        "<script>alert('Categoria actualizada');</script>"
                    );

                } else {

                    out.print(
                        "<script>alert('Error al actualizar');</script>"
                    );
                }
            }
        %>
        
        <a href="../HTMLs/Categorias.html">Regresar</a>
        
    </body>
</html>
