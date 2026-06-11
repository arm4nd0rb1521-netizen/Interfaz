package DAO;

import Modelo.Venta;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class VentaDAO {

    public boolean insertar(Venta v) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO venta(fecha, id_usuario) " +
                "VALUES(?, ?)";

            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, v.getFecha());
            ps.setInt(2, v.getIdUsuario());

            int filas = ps.executeUpdate();

            if(filas > 0) {

                rs = ps.getGeneratedKeys();

                if(rs.next()) {
                    v.setIdVenta(rs.getInt(1));
            }

            return true;
        }

        return false;

        } catch(Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
            try { if(rs != null) rs.close(); } catch(Exception e) {}
        }
    }

    public boolean eliminar(int id) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "DELETE FROM venta WHERE id_venta = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    }

    public Venta buscarUno(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Venta v = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "SELECT * FROM venta WHERE id_venta = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if(rs.next()) {

                v = new Venta();

                v.setIdVenta(
                    rs.getInt("id_venta")
                );

                v.setFecha(
                    rs.getString("fecha")
                );

                v.setIdUsuario(
                    rs.getInt("id_usuario")
                );
            }

        } catch(Exception e) {

            e.printStackTrace();

        } finally {

            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }

        return v;
    }

    public ArrayList<Venta> buscarTodo() {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        ArrayList<Venta> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery(
                "SELECT * FROM venta;"
            );

            while(rs.next()) {

                Venta v = new Venta();

                v.setIdVenta(
                    rs.getInt("id_venta")
                );

                v.setFecha(
                    rs.getString("fecha")
                );

                v.setIdUsuario(
                    rs.getInt("id_usuario")
                );

                lista.add(v);
            }

        } catch(Exception e) {

            e.printStackTrace();

        } finally {

            try { if(con != null) con.close(); } catch(Exception e) {}
            try { if(st != null) st.close(); } catch(Exception e) {}
            try { if(rs != null) rs.close(); } catch(Exception e) {}
        }

        return lista;
    }

    public boolean actualizar(Venta v) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE venta " +
                "SET fecha = ?, " +
                "id_usuario = ? " +
                "WHERE id_venta = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, v.getFecha());
            ps.setInt(2, v.getIdUsuario());
            ps.setInt(3, v.getIdVenta());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    }
}