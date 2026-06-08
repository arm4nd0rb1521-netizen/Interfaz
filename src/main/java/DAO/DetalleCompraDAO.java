package DAO;

import Modelo.DetalleCompra;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DetalleCompraDAO {

    public boolean insertar(DetalleCompra dc) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO detalle_compra(cantidad, precio_unitario, subtotal, id_compra, id_producto) " +
                "VALUES(?,?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setInt(1, dc.getCantidad());
            ps.setDouble(2, dc.getPrecioUnitario());
            ps.setDouble(3, dc.getSubtotal());
            ps.setInt(4, dc.getIdCompra());
            ps.setInt(5, dc.getIdProducto());

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
                "DELETE FROM detalle_compra WHERE id_detalle_compra = ?";

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

    public DetalleCompra buscarUno(int id) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        DetalleCompra dc = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "SELECT * FROM detalle_compra WHERE id_detalle_compra = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if(rs.next()) {

                dc = new DetalleCompra();

                dc.setIdDetalleCompra(
                    rs.getInt("id_detalle_compra")
                );

                dc.setCantidad(
                    rs.getInt("cantidad")
                );

                dc.setPrecioUnitario(
                    rs.getDouble("precio_unitario")
                );

                dc.setSubtotal(
                    rs.getDouble("subtotal")
                );

                dc.setIdCompra(
                    rs.getInt("id_compra")
                );

                dc.setIdProducto(
                    rs.getInt("id_producto")
                );
            }

        } catch(Exception e) {

            e.printStackTrace();

        } finally {

            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }

        return dc;
    }

    public ArrayList<DetalleCompra> buscarTodo() {

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        ArrayList<DetalleCompra> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery(
                "SELECT * FROM detalle_compra;"
            );

            while(rs.next()) {

                DetalleCompra dc = new DetalleCompra();

                dc.setIdDetalleCompra(
                    rs.getInt("id_detalle_compra")
                );

                dc.setCantidad(
                    rs.getInt("cantidad")
                );

                dc.setPrecioUnitario(
                    rs.getDouble("precio_unitario")
                );

                dc.setSubtotal(
                    rs.getDouble("subtotal")
                );

                dc.setIdCompra(
                    rs.getInt("id_compra")
                );

                dc.setIdProducto(
                    rs.getInt("id_producto")
                );

                lista.add(dc);
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

    public boolean actualizar(DetalleCompra dc) {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE detalle_compra " +
                "SET cantidad = ?, " +
                "precio_unitario = ?, " +
                "subtotal = ?, " +
                "id_compra = ?, " +
                "id_producto = ? " +
                "WHERE id_detalle_compra = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, dc.getCantidad());
            ps.setDouble(2, dc.getPrecioUnitario());
            ps.setDouble(3, dc.getSubtotal());
            ps.setInt(4, dc.getIdCompra());
            ps.setInt(5, dc.getIdProducto());
            ps.setInt(6, dc.getIdDetalleCompra());

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