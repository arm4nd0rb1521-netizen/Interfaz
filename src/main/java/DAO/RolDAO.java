package DAO;

import Modelo.Rol;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class RolDAO {

    public boolean insertar(Rol r) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO rol(nombre) VALUES(?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, r.getInombre());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    public boolean eliminar(int id) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "DELETE FROM rol WHERE id_rol = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    public Rol buscarUno(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Rol r = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "SELECT * FROM rol WHERE id_rol = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {

                r = new Rol();

                r.setIdRol(
                    rs.getInt("id_rol")
                );

                r.setInombre(
                    rs.getString("nombre")
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return r;
    }

    public ArrayList<Rol> buscarTodo() {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        ArrayList<Rol> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery("SELECT * FROM rol");

            while (rs.next()) {

                Rol r = new Rol();

                r.setIdRol(
                    rs.getInt("id_rol")
                );

                r.setInombre(
                    rs.getString("nombre")
                );

                lista.add(r);
            }

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (st != null) st.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return lista;
    }

    public boolean actualizar(Rol r) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE rol " +
                "SET nombre = ? " +
                "WHERE id_rol = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, r.getInombre());
            ps.setInt(2, r.getIdRol());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}