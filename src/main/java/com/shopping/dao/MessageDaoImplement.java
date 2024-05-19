package com.shopping.dao;

import com.shopping.entity.Message;
import com.shopping.entity.Product;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Repository
public class MessageDaoImplement implements MessageDao{


    @Resource
    private SessionFactory sessionFactory;


    @Override
    public List<Message> getMessage(String receiver) throws SQLException {

//        String hql = "from Message where receiver = ? ";
//        Query query = sessionFactory.getCurrentSession().createQuery(hql);
//        query.setParameter(0,receiver);
//        //query.setParameter(1,receiver);
//        return query.list();
         // 数据库连接信息


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
            ps.setString(1,receiver);
            ps.setString(2,receiver);
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

    @Override
    public void addMessage(Message message) throws SQLException {
        Connection conn;

        try {
            conn = DriverManager.getConnection(
                    "jdbc:mysql://118.31.251.111:32780",
                    "root",
                    "root"
            );
        } catch (SQLException e) {
            return ;
        }
        String sql ="INSERT INTO shopping.message (sender, text, times, receiver) VALUES (?, ?, ?, ?);" ;
        PreparedStatement ps ;
        try {
            ps = conn.prepareStatement(sql);
        	ps.setString(1, message.getSender());
            ps.setString(2, message.getText());
            ps.setString(3,String.valueOf(message.getTimes()));
            ps.setString(4,message.getReceiver());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
        conn.close();
    }
}
