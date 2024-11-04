package model;

public class Usuario {
    private int id;
    private String nombre;
    private String telefono;
    private String email;
    private String contraseña;

    // Constructor sin parámetros
    public Usuario() {}

    // Constructor con parámetros
    public Usuario(String nombre, String telefono, String email, String contraseña) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.contraseña = contraseña;
    }

    // Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    private String dui;

    // Constructor con parámetros
    public Usuario(String nombre, String telefono, String email, String contraseña, String dui) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.contraseña = contraseña;
        this.dui = dui; // Inicializar DUI
    }

    // Getters y setters
    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

}