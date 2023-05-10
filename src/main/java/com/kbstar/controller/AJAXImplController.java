package com.kbstar.controller;

import com.kbstar.dto.Chart;
import com.kbstar.service.ChartService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AJAXImplController {
    @Autowired
    ChartService chartService;
    @RequestMapping("/chart1")
    public Object chart1() throws Exception {
        List<Chart> list = chartService.getMonthlyTotal();
        JSONArray fma = new JSONArray();
        JSONArray ma = new JSONArray();
        for(Chart c:list){
            if(c.getGender().toUpperCase().equals("F")){
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
        return data;
    }

    @RequestMapping("/chart2")
    public Object chart2() throws Exception {
        List<Chart> list = chartService.getMonthlyTotal();
        JSONArray fma = new JSONArray();
        JSONArray ma = new JSONArray();
        for(Chart c:list){
            if(c.getGender().toUpperCase().equals("F")){
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
        return data;
    }
}
