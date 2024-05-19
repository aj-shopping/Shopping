package com.shopping.service;

import com.shopping.entity.Message;

import java.sql.SQLException;
import java.util.List;

public interface AnswerService {
    List<Message> getMessagesByReceiver(String customerName) throws SQLException;
}
