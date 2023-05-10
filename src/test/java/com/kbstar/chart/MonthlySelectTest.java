package com.kbstar.chart;

import com.kbstar.dto.Chart;
import com.kbstar.service.ChartService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class MonthlyTotalTest {
    @Autowired
    ChartService service;
    @Test
    void contextLoads() {
        // [{},{}]
        try {
            List<Chart> list = service.getMonthlyTotal();
            JSONArray fma = new JSONArray();
            JSONArray ma = new JSONArray();
            for(Chart c:list){
                if(c.getGender().equals("F")){
                    fma.add(c.getTotal());
                } else{
                    ma.add(c.getTotal());
                }
            }
            JSONObject fmo = new JSONObject();
            JSONObject mo = new JSONObject();
            fmo.put("name", "여성");
            fmo.put("data", fma);
            mo.put("name", "남성");
            mo.put("data", ma);
            JSONArray data = new JSONArray();
            data.add(fmo);
            data.add(mo);
        } catch (Exception e) {
            log.info("에러..");
            e.printStackTrace();
        }
    }

}