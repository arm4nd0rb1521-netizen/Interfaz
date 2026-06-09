package Modelo;

import java.sql.Timestamp;

public class Compra {
    private int idCompra;
    private String fecha;
    private double total;
    private int idProveedor;
    private int idUsuario;
    private String nombreUsuario;
    private String nombreProv;

    public Compra() {
    }

    public Compra(int idCompra, String fecha, double total, int idProveedor, int idUsuario, String nombreUsuario, String nombreProv) {
        this.idCompra = idCompra;
        this.fecha = fecha;
        this.total = total;
        this.idProveedor = idProveedor;
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.nombreProv = nombreProv;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getNombreProv() {
        return nombreProv;
    }

    public void setNombreProv(String nombreProv) {
        this.nombreProv = nombreProv;
    }

   

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
