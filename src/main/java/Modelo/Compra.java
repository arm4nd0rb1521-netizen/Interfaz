package Modelo;

import java.sql.Timestamp;

public class Compra {
    private int idCompra;
    private Timestamp fecha;
    private double total;
    private int idProveedor;
    private int idUsuario;

    public Compra() {
    }

    public Compra(int idCompra, Timestamp fecha, double total, int idProveedor, int idUsuario) {
        this.idCompra = idCompra;
        this.fecha = fecha;
        this.total = total;
        this.idProveedor = idProveedor;
        this.idUsuario = idUsuario;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
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
