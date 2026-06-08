package DAO;

import Modelo.Producto;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductoDAO {

    public boolean insertar(Producto p) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO producto(nombre, precio, stock, stock_minimo, id_categoria) " +
                "VALUES(?,?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setDouble(2, p.getPrecio());
            ps.setInt(3, p.getStock());
            ps.setInt(4, p.getStockMinimo());
            ps.setInt(5, p.getIdCategoria());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    }
    
    public boolean eliminar(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = Conexion.getConexion();
            
            String sql = "DELETE  FROM producto WHERE id_producto= ?";
            
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            return ps.executeUpdate() > 0;
            
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    }
    
    public Producto buscarUno(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Producto p = null;

        try {

            con = Conexion.getConexion();

            String sql = "SELECT p.id_producto, p.nombre, p.precio, p.stock, p.stock_minimo, c.nombre AS categoria "
                    + "FROM producto p "
                    + "INNER JOIN categoria c "
                    + "ON p.id_categoria = c.id_categoria "
                    + "WHERE id_producto= ?";
            
            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if(rs.next()) {

                p = new Producto();

                p.setIdProducto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getInt("precio"));
                p.setStock(rs.getInt("stock"));
                p.setStockMinimo(rs.getInt("stock_minimo"));
                p.setNombreCategoria(rs.getString("categoria"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
            try { if (rs != null) rs.close(); } catch(Exception e) {}
        }

        return p;
    }
    
     public ArrayList<Producto> buscarTodo() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
         ArrayList<Producto> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery("SELECT p.id_producto, p.nombre, p.precio, p.stock, p.stock_minimo, c.nombre AS categoria "
                    + "FROM producto p "
                    + "INNER JOIN categoria c "
                    + "ON p.id_categoria = c.id_categoria;");

            while(rs.next()) {

                Producto p = new Producto();

                p.setIdProducto(
                    rs.getInt("id_producto")
                );

                p.setNombre(
                    rs.getString("nombre")
                );

                p.setPrecio(
                    rs.getDouble("precio")
                );

                p.setStock(
                    rs.getInt("stock")
                );
                
                p.setStockMinimo(
                    rs.getInt("stock_minimo")
                );
                
                p.setNombreCategoria(
                    rs.getString("categoria")
                );

                lista.add(p);
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if (con != null) con.close(); } catch(Exception e) {}
            try { if (st != null) st.close(); } catch(Exception e) {}
            try { if (rs != null) rs.close(); } catch(Exception e) {}
        }

        return lista;
    }
     
     public boolean actualizar(Producto p) {
        Connection con = null;
        PreparedStatement ps = null;
         
         try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE producto  " +
                "SET nombre = ?, " +
                "precio = ?, " +
                "stock = ?,  " +
                "stock_minimo = ?,  " +
                "id_categoria = ?  " +
                "WHERE id_producto= ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setDouble(2, p.getPrecio());
            ps.setInt(3, p.getStock());
            ps.setInt(4, p.getStockMinimo());
            ps.setInt(5, p.getIdCategoria());
            ps.setInt(6, p.getIdProducto());

            return ps.executeUpdate() > 0;
            
        } catch(Exception e) {

            e.printStackTrace();
            return false;
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    }
     
}
