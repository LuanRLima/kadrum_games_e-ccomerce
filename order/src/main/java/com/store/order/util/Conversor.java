package com.store.order.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.store.order.dto.PaymentResult;
import reactor.core.publisher.Mono;

import java.io.IOException;
import java.util.Map;

public class Conversor {
    public static Map<String, Object> convertToObject(String jsonS){
        try{
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> map = mapper.readValue(jsonS, Map.class);
            return map;
        }catch(JsonProcessingException e){
            return null;
        }
    }

    public static PaymentResult convertJsonToPaymentResult(String json, boolean success) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            PaymentResult paymentResult = mapper.readValue(json, PaymentResult.class);
            return paymentResult;
        } catch (IOException e) {
            throw new RuntimeException("Erro ao converter JSON para PaymentResult", e);
        }
    }
}
