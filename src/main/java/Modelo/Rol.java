package Modelo;

public class Rol {
    private int idRol;
    private String inombre;

    public Rol() {
    }

    public Rol(int idRol, String inombre) {
        this.idRol = idRol;
        this.inombre = inombre;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getInombre() {
        return inombre;
    }

    public void setInombre(String inombre) {
        this.inombre = inombre;
    }
    
}
