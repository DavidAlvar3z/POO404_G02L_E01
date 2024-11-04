package model;

public class Sucursal {
    private int id;
    private String nombreSucursal;
    private int idDireccion;
    private String telefono;

    // Constructor
    public Sucursal(int id, String nombreSucursal, int idDireccion, String telefono) {
        this.id = id;
        this.nombreSucursal = nombreSucursal;
        this.idDireccion = idDireccion;
        this.telefono = telefono;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreSucursal() {
        return nombreSucursal;
    }

    public void setNombreSucursal(String nombreSucursal) {
        this.nombreSucursal = nombreSucursal;
    }

    public int getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(int idDireccion) {
        this.idDireccion = idDireccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
