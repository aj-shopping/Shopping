package com.shopping.service;


import com.shopping.dao.AnswerDao;
import com.shopping.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class AnswerServiceImplement implements AnswerService{


    @Autowired
    private AnswerDao answerDao;

    @Override
    public List<Message> getMessagesByReceiver(String customerName) throws SQLException {
        return answerDao.getMessage(customerName);
    }
}
