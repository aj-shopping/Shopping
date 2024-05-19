package com.shopping.dao;

import com.shopping.entity.Message;

import java.sql.SQLException;
import java.util.List;

public interface AnswerDao {
    List<Message> getMessage(String customerName) throws SQLException;
}
