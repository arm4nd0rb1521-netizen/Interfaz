package DAO;

import java.sql.*;
import Modelo.Usuario;
import conexion.Conexion;
import java.util.ArrayList;

public class UsuarioDAO {

    public boolean insertar(Usuario u) {

        try {

            Connection con = Conexion.getConexion();

            String sql =
                "INSERT INTO usuario(nombre, apellido, contraseña, id_rol) " +
                "VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getContraseña());
            ps.setInt(4, u.getIdRol());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean eliminar(int id) {
        try {
            Connection con = Conexion.getConexion();
            
            String sql = "DELETE  FROM usuario WHERE id_usuario = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            return ps.executeUpdate() > 0;
            
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Usuario buscarUno(int id) {
        Usuario u = null;

        try {

            Connection con = Conexion.getConexion();

            String sql =
                "SELECT u.id_usuario, u.nombre, u.apellido, u.contraseña, r.nombre AS rol "
                    + "FROM usuario u INNER JOIN rol r "
                    + "ON u.id_rol = r.id_rol "
                    + "WHERE id_usuario = ?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                u = new Usuario();

                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setContraseña(rs.getString("contraseña"));
                u.setNombreRol(rs.getString("rol"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return u;
    }
    
     public ArrayList<Usuario> buscarTodo() {
        ArrayList<Usuario> lista = new ArrayList<>();

        try {

            Connection con =
                Conexion.getConexion();

            Statement st =
                con.createStatement();

            ResultSet rs =
                st.executeQuery("SELECT u.id_usuario, u.nombre, u.apellido, u.contraseña, r.nombre  AS nombreRol "
                        + "FROM usuario u "
                        + "INNER JOIN rol r "
                        + "ON u.id_rol = r.id_rol");

            while(rs.next()) {

                Usuario u =
                    new Usuario();

                u.setIdUsuario(
                    rs.getInt("id_usuario")
                );

                u.setNombre(
                    rs.getString("nombre")
                );

                u.setApellido(
                    rs.getString("apellido")
                );

                u.setContraseña(
                    rs.getString("contraseña")
                );

                u.setNombreRol(
                    rs.getString("nombreRol")
                );

                lista.add(u);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
     
     public boolean actualizar(Usuario u) {
        try {

            Connection con = Conexion.getConexion();

            String sql =
                "UPDATE usuario " +
                "SET nombre = ?, " +
                "apellido = ?, " +
                "contraseña = ?, " +
                "id_rol = ? " +
                "WHERE id_usuario = ?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getContraseña());
            ps.setInt(4, u.getIdRol());
            ps.setInt(5, u.getIdUsuario());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {

            e.printStackTrace();
            return false;
        }
    }
     
     public Usuario login(String nombre, String contraseña) {
        Usuario u = null;

        try {
            Connection con = Conexion.getConexion();

            String sql =
                "SELECT * FROM usuario " +
                "WHERE nombre = ? AND contraseña = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, nombre);
            ps.setString(2, contraseña);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                u = new Usuario();

                u.setIdUsuario(
                    rs.getInt("id_usuario")
                );

                u.setNombre(
                    rs.getString("nombre")
                );

                u.setApellido(
                    rs.getString("apellido")
                );

                u.setIdRol(
                    rs.getInt("id_rol")
                );
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return u;
    }
}