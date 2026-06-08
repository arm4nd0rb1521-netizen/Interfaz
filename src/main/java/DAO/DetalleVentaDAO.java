package DAO;

import Modelo.DetalleVenta;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DetalleVentaDAO {

    public boolean insertar(DetalleVenta dv) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO detalle_venta(cantidad, precio_unitario, subtotal, id_venta, id_producto) " +
                "VALUES(?,?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setInt(1, dv.getCantidad());
            ps.setDouble(2, dv.getPrecioUnitario());
            ps.setDouble(3, dv.getSubtotal());
            ps.setInt(4, dv.getIdVenta());
            ps.setInt(5, dv.getIdProducto());

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
                "DELETE FROM detalle_venta WHERE id_detalle_venta = ?";

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

    public DetalleVenta buscarUno(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        DetalleVenta dv = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "SELECT * FROM detalle_venta WHERE id_detalle_venta = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {

                dv = new DetalleVenta();

                dv.setIdDetalleVenta(
                    rs.getInt("id_detalle_venta")
                );

                dv.setCantidad(
                    rs.getInt("cantidad")
                );

                dv.setPrecioUnitario(
                    rs.getDouble("precio_unitario")
                );

                dv.setSubtotal(
                    rs.getDouble("subtotal")
                );

                dv.setIdVenta(
                    rs.getInt("id_venta")
                );

                dv.setIdProducto(
                    rs.getInt("id_producto")
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return dv;
    }

    public ArrayList<DetalleVenta> buscarTodo() {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        ArrayList<DetalleVenta> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery(
                "SELECT * FROM detalle_venta"
            );

            while (rs.next()) {

                DetalleVenta dv = new DetalleVenta();

                dv.setIdDetalleVenta(
                    rs.getInt("id_detalle_venta")
                );

                dv.setCantidad(
                    rs.getInt("cantidad")
                );

                dv.setPrecioUnitario(
                    rs.getDouble("precio_unitario")
                );

                dv.setSubtotal(
                    rs.getDouble("subtotal")
                );

                dv.setIdVenta(
                    rs.getInt("id_venta")
                );

                dv.setIdProducto(
                    rs.getInt("id_producto")
                );

                lista.add(dv);
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

    public boolean actualizar(DetalleVenta dv) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE detalle_venta " +
                "SET cantidad = ?, " +
                "precio_unitario = ?, " +
                "subtotal = ?, " +
                "id_venta = ?, " +
                "id_producto = ? " +
                "WHERE id_detalle_venta = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, dv.getCantidad());
            ps.setDouble(2, dv.getPrecioUnitario());
            ps.setDouble(3, dv.getSubtotal());
            ps.setInt(4, dv.getIdVenta());
            ps.setInt(5, dv.getIdProducto());
            ps.setInt(6, dv.getIdDetalleVenta());

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
    

