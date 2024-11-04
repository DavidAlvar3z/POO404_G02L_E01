package model;

public class Empleado {
    private int id;
    private String nombre;
    private String telefono;
    private String email;
    private String contraseña;
    private String rol;
    private String fechaContratacion;
    private String dui;

    // Constructor
    public Empleado(int id, String nombre, String telefono, String email, String contraseña, String rol, String fechaContratacion, String dui) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.contraseña = contraseña;
        this.rol = rol;
        this.fechaContratacion = fechaContratacion;
        this.dui = dui;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getContraseña() { return contraseña; }
    public void setContraseña(String contraseña) { this.contraseña = contraseña; }
    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }
    public String getFechaContratacion() { return fechaContratacion; }
    public void setFechaContratacion(String fechaContratacion) { this.fechaContratacion = fechaContratacion; }
    public String getDui() { return dui; }
    public void setDui(String dui) { this.dui = dui; }
}
