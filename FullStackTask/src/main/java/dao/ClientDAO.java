package dao;

import model.Client;
import util.DBConnection;

import java.sql.*;
import java.util.*;

public class ClientDAO {

    public static boolean addClient(Client client) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO clients(name, description, designation, image_url) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, client.getName());
            ps.setString(2, client.getDescription());
            ps.setString(3, client.getDesignation());
            ps.setString(4, client.getImageUrl());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Client> getAllClients() {
        List<Client> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM clients";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Client c = new Client();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setDesignation(rs.getString("designation"));
                c.setImageUrl(rs.getString("image_url"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
