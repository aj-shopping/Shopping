package com.shopping.service;

import com.shopping.entity.Message;

import java.sql.SQLException;
import java.util.List;

public interface MessageService {

    List<Message> findMessagesByReceiver(String receiver) throws SQLException;

    void sendMessage(String sender, String text, String receiver) throws SQLException;
}
