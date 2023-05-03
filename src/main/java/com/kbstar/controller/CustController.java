package com.kbstar.controller;


import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    BCryptPasswordEncoder encoder;

    @Autowired
    CustService custService;
    String dir = "cust/";
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        //@Validated를 붙이면 cust dto에 우리가 정의해놓은대로 미리 검증을 하겠다는 얘기
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e:es){
                msg += e.getDefaultMessage();
                msg += "<br>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.register(cust);
        return "redirect:/cust/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();
        model.addAttribute("clist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception{
        Cust cust = null;
            cust = custService.get(id);
        model.addAttribute("dcust", cust);
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e:es){
                msg += e.getDefaultMessage();
                msg += "<br>";
            }
            throw new Exception(msg);
        }
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.modify(cust);
        return "redirect:/cust/detail?id="+cust.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception{
        custService.remove(id);
        return "redirect:/cust/all";
    }
}