package DAO;

import Modelo.Compra;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CompraDAO {

    public boolean insertar(Compra c) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO compra(fecha, total, id_proveedor, id_usuario) " +
                "VALUES(?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, c.getFecha());
            ps.setDouble(2, c.getTotal());
            ps.setInt(3, c.getIdProveedor());
            ps.setInt(4, c.getIdUsuario());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {

            e.printStackTrace();
            return false;

        } finally {

            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    }

    public boolean eliminar(int id) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "DELETE FROM compra WHERE id_compra = ?";

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

    public Compra buscarUno(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Compra c = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "SELECT * FROM compra WHERE id_compra = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if(rs.next()) {

                c = new Compra();

                c.setIdCompra(
                    rs.getInt("id_compra")
                );

                c.setFecha(
                    rs.getString("fecha")
                );

                c.setTotal(
                    rs.getDouble("total")
                );

                c.setIdProveedor(
                    rs.getInt("id_proveedor")
                );

                c.setIdUsuario(
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

        return c;
    }

    public ArrayList<Compra> buscarTodo() {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        ArrayList<Compra> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery(
                "SELECT c.id_compra, c.fecha, c.total, p.nombre AS proveedor, u.nombre AS usuario "
                        + "FROM compra c "
                        + "INNER JOIN proveedor p ON c.id_proveedor = p.id_proveedor "
                        + "INNER JOIN usuario u ON c.id_usuario = u.id_usuario;"
            );

            while(rs.next()) {

                Compra c = new Compra();

                c.setIdCompra(
                    rs.getInt("id_compra")
                );

                c.setFecha(
                    rs.getString("fecha")
                );

                c.setTotal(
                    rs.getDouble("total")
                );

                c.setNombreProv(
                    rs.getString("proveedor")
                );

                c.setNombreUsuario(
                    rs.getString("usuario")
                );

                lista.add(c);
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

    public boolean actualizar(Compra c) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE compra " +
                "SET fecha = ?, " +
                "total = ?, " +
                "id_proveedor = ?, " +
                "id_usuario = ? " +
                "WHERE id_compra = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, c.getFecha());
            ps.setDouble(2, c.getTotal());
            ps.setInt(3, c.getIdProveedor());
            ps.setInt(4, c.getIdUsuario());
            ps.setInt(5, c.getIdCompra());

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