package com.shopping.service;

import com.shopping.entity.Message;

import java.util.List;

public interface MessageService {

    List<Message> findMessagesByReceiver(String receiver);

    void sendMessage(String sender, String text, String receiver);
}
