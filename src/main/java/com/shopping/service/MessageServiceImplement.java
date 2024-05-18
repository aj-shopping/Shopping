package com.shopping.service;

import com.shopping.dao.MessageDao;
import com.shopping.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServiceImplement implements MessageService{


    @Autowired
    private MessageDao messageDao;



    @Override
     public List<Message> findMessagesByReceiver(String receiver) {
        return messageDao.getMessage(receiver);
    }

    @Override
    public void sendMessage(String sender, String text, String receiver) {
        Message message = new Message();
        message.setReceiver(receiver);
        message.setSender(sender);
        message.setText(text);
        message.setTimes(LocalDateTime.now());
        messageDao.addMessage(message);
    }
}
