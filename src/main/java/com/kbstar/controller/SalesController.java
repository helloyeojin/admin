package com.kbstar.controller;

import com.kbstar.dto.Sales;
import com.kbstar.mapper.SalesMapper;
import com.kbstar.service.SalesService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.Random;
@RestController
public class SalesController {
    @Autowired
    SalesService salesService;

    @RequestMapping("/chart")
    public Object chart() throws Exception {
        List<Sales> result = salesService.gendersales();

        // [1,2,3] 데이터가 이런 식으로 생겼음
        JSONArray jaMale = new JSONArray();
        JSONArray jaFemale = new JSONArray();
        JSONObject jo = new JSONObject();
// 각 월별 데이터를 jaMale, jaFemale에 추가

            for (Sales sales : result) {
                if (sales.getGender().equals("M")) {
                    jaMale.add(sales.getPrice());
                } if (sales.getGender().equals("F")) {
                    jaFemale.add(sales.getPrice());
                }
            }
        // 결과 JSON 객체 생성
        jo.put("male", jaMale);
        jo.put("female", jaFemale);
        return jo;
    }
}


