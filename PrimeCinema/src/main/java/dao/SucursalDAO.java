package dao;

import model.Sucursal;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SucursalDAO {
    private Connection connection;

    public SucursalDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Sucursal> obtenerSucursales() {
        List<Sucursal> sucursales = new ArrayList<>();
        String query = "SELECT * FROM Sucursales";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Sucursal sucursal = new Sucursal(
                        rs.getInt("id"),
                        rs.getString("nombre_sucursal"),
                        rs.getInt("id_direccion"),
                        rs.getString("telefono")
                );
                sucursales.add(sucursal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sucursales;
    }
}
