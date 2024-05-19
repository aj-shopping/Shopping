package com.shopping.dao;

import com.shopping.entity.Message;


import java.sql.SQLException;
import java.util.List;


public interface MessageDao  {


    List<Message> getMessage(String receiver) throws SQLException;

    void addMessage(Message message) throws SQLException;
}
