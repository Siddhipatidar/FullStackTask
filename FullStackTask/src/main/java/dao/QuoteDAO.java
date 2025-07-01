package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.mysql.cj.util.Util;

import model.Quote;
import util.DBConnection;

public class QuoteDAO {
    public static boolean saveQuote(Quote quote) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO contact_quotes (full_name, email, mobile, city) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, quote.getFullName());
            stmt.setString(2, quote.getEmail());
            stmt.setString(3, quote.getMobile());
            stmt.setString(4, quote.getCity());

            status = stmt.executeUpdate() > 0;
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
