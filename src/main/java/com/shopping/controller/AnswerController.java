package com.shopping.controller;

import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.Message;
import com.shopping.service.AnswerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AnswerController {

    @Resource
    private AnswerService answerService;

    @RequestMapping(value = "/answer")
    public String shopping_record(){
        return "answer";
    }

    @RequestMapping(value = "/getChatMessages",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getChatMessages(String customerName) throws SQLException {
        List<Message> messages = answerService.getMessagesByReceiver(customerName);
        String messagesByReceiver = JSONArray.toJSONString(messages);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("messagesByReceiver",messagesByReceiver);
        System.out.println("我返回了"+messagesByReceiver);
        return resultMap;
    }



}
