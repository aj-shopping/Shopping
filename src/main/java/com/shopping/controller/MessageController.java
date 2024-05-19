package com.shopping.controller;

import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.Message;
import com.shopping.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;


    @RequestMapping(value = "/getMessages",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object>  getMessages(String nickName) throws SQLException {
        List<Message>  messages = messageService.findMessagesByReceiver(nickName);
        String messagesByReceiver = JSONArray.toJSONString(messages);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("messagesByReceiver",messagesByReceiver);
        System.out.println("我返回了"+messagesByReceiver);
        return resultMap;
    }


    @RequestMapping(value = "/sendMessage",method = RequestMethod.POST)
    @ResponseBody
    public void sendMessage(String sender, String text,String receiver) throws SQLException {
        messageService.sendMessage(sender, text,receiver);
    }
}
