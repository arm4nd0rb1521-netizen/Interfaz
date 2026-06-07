<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/myownshop?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                st = con.createStatement();
                
            } catch(SQLException e) {
                out.print(e.toString());
                out.print("Error" + e.getMessage());
            }
            
            int id = Integer.parseInt(request.getParameter("idecin"));
            String nombre = request.getParameter("nombrecin");
            String ape = request.getParameter("apellidocin");
            String contra = request.getParameter("contrasenia");
            String rolecin = request.getParameter("rolecin");
            int rol = 0;
            
            if(rolecin.equals("Vendedor")) {
                rol = 1;
            }
            
            if(rolecin.equals("Encargado_almacen")) {
                rol = 2;
            }
            
            if(rolecin.equals("Gerente")) {
                rol = 3;
            }
            
            if(rolecin.equals("Administrador")) {
                rol = 4;
            }
            
            String sqlCode = "UPDATE usuario SET nombre = ?, apellido = ?, contraseña = ?, id_rol = ? "
                    + "WHERE id_usuario = ?";
            PreparedStatement ps = con.prepareStatement(sqlCode);
            
            ps.setString(1, nombre);
            ps.setString(2, ape);
            ps.setString(3, contra);
            ps.setInt(4, rol);
            ps.setInt(5, id);
            
            ps.executeUpdate();
            out.print("<script>alert('Cambios realizados con exito');</script>");
            
            if(con != null)con.close();
            if(st != null)st.close();
            if(rs != null)rs.close();
        %>
    </body>
</html>
