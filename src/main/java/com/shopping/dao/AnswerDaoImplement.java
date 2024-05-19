package com.shopping.dao;


import com.shopping.entity.Message;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AnswerDaoImplement implements AnswerDao{
    @Override
    public List<Message> getMessage(String customerName) throws SQLException {
        ArrayList<Message> messages = new ArrayList<>();
        Connection conn;

        try {
            conn = DriverManager.getConnection(
                    "jdbc:mysql://118.31.251.111:32780",
                    "root",
                    "root"
            );
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String sql= "SELECT * FROM shopping.message where receiver = ? or sender = ?";
        PreparedStatement ps ;

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,customerName);
            ps.setString(2,customerName);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Long id = rs.getLong("id");
                String sender = rs.getString("sender");
                String text = rs.getString("text");
                String times = rs.getString("times");
                String receive = rs.getString("receiver");
                Message reservation = new Message(id, sender, text, times, receive);
                messages.add(reservation);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        conn.close();
        //System.out.println(reservations);
        return messages;
    }
}
