<%@page import="java.sql.*" %>
<%@page import="DAO.UsuarioDAO" %>
<%@page import="Modelo.Usuario" %>
<%@page import="conexion.Conexion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/myownshop?autoReconnect=true&useSSL=false", "root", "ces160408");
                st = con.createStatement();
                
            } catch(SQLException e) {
                out.print(e.toString());
                out.print("Error" + e.getMessage());
            }
            
            if(request.getParameter("registrar") != null) {
                String nom = request.getParameter("user");
                String apellido = request.getParameter("ape");
                String pass = request.getParameter("password_crear");
                String rol = request.getParameter("tipo_usuario");
                int rolecito = 0;
                
                if(rol.equals("Vendedor")) {
                    rolecito = 1;
                }
                
                if(rol.equals("Encargado_almacen")) {
                    rolecito = 2;
                }
                
                if(rol.equals("Gerente")) {
                    rolecito = 3;
                }
                
                if(rol.equals("Administrador")) {
                    rolecito = 4;
                }
                
                if(rolecito == 0) {
                    out.print("<script>alert('Rol invalido');</script>");
                    return;
                }
            
                String sqlCode = "INSERT INTO usuario (nombre, apellido, contraseña, id_rol) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sqlCode);
                
                ps.setString(1, nom);
                ps.setString(2, apellido);
                ps.setString(3, pass);
                ps.setInt(4, rolecito);
                
                ps.executeUpdate();
                out.print("<script>alert('Registro completado')</script>");
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                String sqlCode = "DELETE FROM usuario WHERE id_usuario = ?";
                PreparedStatement ps = con.prepareStatement(sqlCode);
                
                ps.setInt(1, id);
                ps.executeUpdate();
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                
                String sqlCode =
                            "SELECT u.id_usuario, u.nombre, u.apellido, " +
                            "r.nombre AS rol " +
                            "FROM usuario u " +
                            "INNER JOIN rol r ON u.id_rol = r.id_rol " +
                            "WHERE u.id_usuario = ?";

                PreparedStatement ps = con.prepareStatement(sqlCode);
                
                ps.setInt(1, id);
                
                rs = ps.executeQuery();
                if(rs.next()) {
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Apellido</th>");
                    out.print("<th>Rol</th>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+rs.getInt("id_usuario")+"</td>");
                    out.print("<td>"+rs.getString("nombre")+"</td>");
                    out.print("<td>"+rs.getString("apellido")+"</td>");
                    out.print("<td>"+rs.getString("rol")+"</td>");
                    out.print("</tr>");
                    out.print("</table>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {

                rs = st.executeQuery("SELECT u.id_usuario, u.nombre, u.apellido, r.nombre AS rol "
                        + "FROM usuario u INNER JOIN rol r  " 
                        +"ON u.id_rol = r.id_rol");
                
                if(rs.next()) {
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Apellido</th>");
                    out.print("<th>Rol</th>");
                    out.print("</tr>");
                    
                    do {
                        out.print("<tr>");
                        out.print("<td>"+rs.getInt("id_usuario")+"</td>");
                        out.print("<td>"+rs.getString("nombre")+"</td>");
                        out.print("<td>"+rs.getString("apellido")+"</td>");
                        out.print("<td>"+rs.getString("rol")+"</td>");
                        out.print("</tr>");
                    } while(rs.next());
                    
                    out.print("</table>");
                }
            }
            
            if(request.getParameter("actualizar") != null)  {
                int id = Integer.parseInt(request.getParameter("id_actualizar"));
                
                String sqlCode = "SELECT u.id_usuario, u.nombre, u.apellido, u.contraseña, r.nombre AS rol "
                        + "FROM usuario u "
                        + "INNER JOIN rol r "
                        + "ON u.id_rol = r.id_rol "
                        + "WHERE id_usuario = ?";
                PreparedStatement ps = con.prepareStatement(sqlCode);
                
                ps.setInt(1, id);
                rs = ps.executeQuery();
                
                if(rs.next()) {
                    String nombre = rs.getString("nombre");
                    String ape = rs.getString("apellido");
                    String contra = rs.getString("contraseña");
                    String  rol = rs.getString("rol");
                    
                    out.print("<h2>Usuario</h2>");
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Apellido</th>");
                    out.print("<th>Contraseña</th>");
                    out.print("<th>Rol</th>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+id+"</td>");
                    out.print("<td>"+nombre+"</td>");
                    out.print("<td>"+ape+"</td>");
                    out.print("<td>"+contra+"</td>");
                    out.print("<td>"+rol+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                    out.print("<br><br><br><br>");
                    
                    out.print("<form action='CRUDUsuarios2.jsp' method='post' name='actualiza'>");
                    
                    out.print("ID: <input type='text' name='idecin' value='"+id+"' readonly><br><br>");
                    out.print("Nombre: <input type='text' name='nombrecin' value='"+nombre+"'><br><br>");
                    out.print("Apellido: <input type='text' name='apellidocin' value='"+ape+"'><br><br>");
                    out.print("Contraseña: <input type='text' name='contrasenia' value='"+contra+"'><br><br>");
                    
                    out.print("Rol:<br><br>");
                    if(rol.equals("Vendedor")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option selected value='Vendedor'>Vendedor</option>");
                        out.print("<option value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option value='Gerente'>Gerente</option>");
                        out.print("<option value='Administrador'>Administrador</option>");
                    }
                    
                    if(rol.equals("Encargado de almacen")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option value='Vendedor'>Vendedor</option>");
                        out.print("<option selected value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option value='Gerente'>Gerente</option>");
                        out.print("<option value='Administrador'>Administrador</option>");
                    }
                    
                    if(rol.equals("Gerente")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option value='Vendedor'>Vendedor</option>");
                        out.print("<option value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option selected value='Gerente'>Gerente</option>");
                        out.print("<option value='Administrador'>Administrador</option>");
                    }
                    
                    if(rol.equals("Administrador")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option value='Vendedor'>Vendedor</option>");
                        out.print("<option value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option value='Gerente'>Gerente</option>");
                        out.print("<option selected value='Administrador'>Administrador</option>");
                    }
                    out.print("</select>");
                    out.print("<br><br>");
                    
                    out.print("<input type='submit' value='Actualizar' name='valida'>");
                    out.print("</form>");
                }
            }
            
            if(con != null) con.close();
            if(st != null) st.close();
            if(rs != null) rs.close();
        %>
    </body>
</html>
