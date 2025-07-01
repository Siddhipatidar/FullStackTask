package dao;

import model.ContactForm;
import util.DBConnection;

import java.sql.*;
import java.util.*;

public class ContactFormDAO {

    public static boolean addForm(ContactForm form) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO contact_forms(full_name, email, mobile, city) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, form.getFullName());
            ps.setString(2, form.getEmail());
            ps.setString(3, form.getMobile());
            ps.setString(4, form.getCity());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<ContactForm> getAllForms() {
        List<ContactForm> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM contact_forms";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContactForm f = new ContactForm();
                f.setId(rs.getInt("id"));
                f.setFullName(rs.getString("full_name"));
                f.setEmail(rs.getString("email"));
                f.setMobile(rs.getString("mobile"));
                f.setCity(rs.getString("city"));
                list.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	public static boolean saveContactForm(ContactForm form) {
		// TODO Auto-generated method stub
		return false;
	}
}
