<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UsuarioDAO" %>
<%@page import="Modelo.Usuario" %>
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
        <title>Usuarios JSP</title>
    </head>
                            <crear-header></crear-header>

    <body>
        <%
            UsuarioDAO udao = new UsuarioDAO();
            List <Usuario> usuarios = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Usuario u = new Usuario();
                u.setNombre(request.getParameter("user"));
                u.setApellido(request.getParameter("ape"));
                u.setContraseña(request.getParameter("password_crear"));
                String rolecin = request.getParameter("tipo_usuario");
                int rol = 0;
                if(rolecin.equals("Vendedor"))
                    rol = 1;
                if(rolecin.equals("Encargado_almacen"))
                    rol = 2;
                if(rolecin.equals("Gerente"))
                    rol = 3;
                if(rolecin.equals("Administrador"))
                    rol = 4;
                if(rol == 0) {
                    out.print("<script>alert('Ingrese un rol');</script>");
                    return;
                }

                u.setIdRol(rol);
                
                if(udao.insertar(u)){
                    out.print("<script>alert('Usuario registrado');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(udao.eliminar(id)) {
                    out.print("<script>alert('Usuario eliminado');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                Usuario u = udao.buscarUno(id);
                
                if(u != null) {
                    out.print("<script>alert('Consulta realizada')</script>");
                    
                    out.print("<table>");
                    
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Apellido</th>");
                    out.print("<th>Contraseña</th>");
                    out.print("<th>Rol</th>");
                    
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+u.getIdUsuario()+"</td>");
                    out.print("<td>"+u.getNombre()+"</td>");
                    out.print("<td>"+u.getApellido()+"</td>");
                    out.print("<td>"+u.getContraseña()+"</td>");
                    out.print("<td>"+u.getNombreRol()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                } else {
                    out.print("<script>alert('Usuario no encontrado')</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                usuarios = udao.buscarTodo();
                
                if(!usuarios.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Apellido</th>");
                    out.print("<th>Rol</th>");
                    out.print("</tr>");

                    for(Usuario u : usuarios) {

                        out.print("<tr>");

                        out.print("<td>"+u.getIdUsuario()+"</td>");
                        out.print("<td>"+u.getNombre()+"</td>");
                        out.print("<td>"+u.getApellido()+"</td>");
                        out.print("<td>"+u.getNombreRol()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay usuarios registrados');</script>");

                }
            }

            if(request.getParameter("valida") != null) {

                Usuario u = new Usuario();

                u.setIdUsuario(
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                u.setNombre(
                    request.getParameter("nombrecin")
                );

                u.setApellido(
                    request.getParameter("apellidocin")
                );

                u.setContraseña(
                    request.getParameter("contrasenia")
                );

                String rolecin =
                    request.getParameter("rolecin");

                int rol = 0;

                if(rolecin.equals("Vendedor"))
                    rol = 1;
                else if(rolecin.equals("Encargado_almacen"))
                    rol = 2;
                else if(rolecin.equals("Gerente"))
                    rol = 3;
                else if(rolecin.equals("Administrador"))
                    rol = 4;

                u.setIdRol(rol);

                if(udao.actualizar(u)) {

                    out.print(
                        "<script>alert('Usuario actualizado');</script>"
                    );

                } else {

                    out.print(
                        "<script>alert('Error al actualizar');</script>"
                    );
                }
            }
        %>
        <a href="../HTMLs/Usuarios.html">Regresar</a>

    </body>
                <crear-footer></crear-footer>   

</html>
