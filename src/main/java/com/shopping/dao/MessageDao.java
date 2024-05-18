package com.shopping.dao;

import com.shopping.entity.Message;


import java.util.List;


public interface MessageDao  {


    List<Message> getMessage(String receiver);

    void addMessage(Message message);
}
