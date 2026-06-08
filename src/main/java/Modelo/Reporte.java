package Modelo;

import java.sql.Timestamp;

public class Reporte {
    private int idReporte;
    private Timestamp fecha;
    private String tipo;
    private String contenido;
    private int idUsuario;

    public Reporte() {
    }

    public Reporte(int idReporte, Timestamp fecha, String tipo, String contenido, int idUsuario) {
        this.idReporte = idReporte;
        this.fecha = fecha;
        this.tipo = tipo;
        this.contenido = contenido;
        this.idUsuario = idUsuario;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
