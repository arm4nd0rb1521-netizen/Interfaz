package DAO;

import Modelo.Reporte;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ReporteDAO {

    public boolean insertar(Reporte r) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO reporte(fecha, tipo, contenido, id_usuario) " +
                "VALUES(?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setTimestamp(1, r.getFecha());
            ps.setString(2, r.getTipo());
            ps.setString(3, r.getContenido());
            ps.setInt(4, r.getIdUsuario());

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
                "DELETE FROM reporte WHERE id_reporte = ?";

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

    public Reporte buscarUno(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Reporte r = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "SELECT * FROM reporte WHERE id_reporte = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {

                r = new Reporte();

                r.setIdReporte(
                    rs.getInt("id_reporte")
                );

                r.setFecha(
                    rs.getTimestamp("fecha")
                );

                r.setTipo(
                    rs.getString("tipo")
                );

                r.setContenido(
                    rs.getString("contenido")
                );

                r.setIdUsuario(
                    rs.getInt("id_usuario")
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

    public ArrayList<Reporte> buscarTodo() {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        ArrayList<Reporte> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery(
                "SELECT * FROM reporte;"
            );

            while (rs.next()) {

                Reporte r = new Reporte();

                r.setIdReporte(
                    rs.getInt("id_reporte")
                );

                r.setFecha(
                    rs.getTimestamp("fecha")
                );

                r.setTipo(
                    rs.getString("tipo")
                );

                r.setContenido(
                    rs.getString("contenido")
                );

                r.setIdUsuario(
                    rs.getInt("id_usuario")
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

    public boolean actualizar(Reporte r) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE reporte " +
                "SET fecha = ?, " +
                "tipo = ?, " +
                "contenido = ?, " +
                "id_usuario = ? " +
                "WHERE id_reporte = ?";

            ps = con.prepareStatement(sql);

            ps.setTimestamp(1, r.getFecha());
            ps.setString(2, r.getTipo());
            ps.setString(3, r.getContenido());
            ps.setInt(4, r.getIdUsuario());
            ps.setInt(5, r.getIdReporte());

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
