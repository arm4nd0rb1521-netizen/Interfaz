<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Proveedor" %>
<%@page import="DAO.ProveedorDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendedores</title>
    </head>
    <body>
        <%
            ProveedorDAO pdao = new ProveedorDAO();
            
            List <Proveedor> proveedores = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Proveedor p = new Proveedor();
                p.setNombre(request.getParameter("nombre"));
                p.setTelefono(request.getParameter("telefono"));
                p.setGrupo(request.getParameter("grupo"));
                
                if(pdao.insertar(p)){
                    out.print("<script>alert('Proveedor registrado');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(pdao.eliminar(id)) {
                    out.print("<script>alert('Proveedor eliminado');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                Proveedor p = pdao.buscarUno(id);
                
                if(p != null) {
                    out.print("<script>alert('Consulta realizada')</script>");
                    
                    out.print("<table>");
                    
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Telefono</th>");
                    out.print("<th>Grupo</th>");
                    
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+p.getIdProveedor()+"</td>");
                    out.print("<td>"+p.getNombre()+"</td>");
                    out.print("<td>"+p.getTelefono()+"</td>");
                    out.print("<td>"+p.getGrupo()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                } else {
                    out.print("<script>alert('Proveedor no encontrado')</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                proveedores = pdao.buscarTodo();
                
                if(!proveedores.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Telefono</th>");
                    out.print("<th>Grupo</th>");
                    
                    out.print("</tr>");

                    for(Proveedor p : proveedores) {

                        out.print("<tr>");

                        out.print("<td>"+p.getIdProveedor()+"</td>");
                        out.print("<td>"+p.getNombre()+"</td>");
                        out.print("<td>"+p.getTelefono()+"</td>");
                        out.print("<td>"+p.getGrupo()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay proveedores registrados');</script>");

                }
            }

            if(request.getParameter("valida") != null) {

                Proveedor p = new Proveedor();

                p.setIdProveedor(
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                p.setNombre(
                    request.getParameter("nombrecin")
                );

                p.setTelefono(
                    request.getParameter("telefonito")
                );

                p.setGrupo(
                    request.getParameter("grupito")
                );

                if(pdao.actualizar(p)) {

                    out.print(
                        "<script>alert('Proveedor actualizado');</script>"
                    );

                } else {

                    out.print(
                        "<script>alert('Error al actualizar');</script>"
                    );
                }
            }
        %>
        
        <a href="../HTMLs/Proveedores.html">Regresar</a>
        
    </body>
</html>
