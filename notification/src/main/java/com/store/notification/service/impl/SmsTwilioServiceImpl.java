package com.store.notification.service.impl;

import com.store.notification.service.GenericService;

import com.twilio.Twilio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SmsTwilioServiceImpl extends GenericServiceImpl{
    @Value("${twilio.account.sid}")
    private String ACCOUNT_SID;

    @Value("${twilio.auth.token}")
    private String AUTH_TOKEN;

    @Value("${twilio.phone.number}")
    private String PHONE_NUMBER;

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendSms(String message, String to) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message.creator(
                new PhoneNumber(to),
                new PhoneNumber(PHONE_NUMBER),
                message
        ).create();
    }
    public  void readSms() {
        ResourceSet messages = Message.reader().read();
        for (Message message : messages) {
            System.out.println(message.getSid() + " : " + message.getStatus());
        }
    }

}
