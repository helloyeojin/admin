package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cust;
import com.kbstar.service.AdmService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class MainController {
    @Autowired
    private BCryptPasswordEncoder encoder;
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    @Autowired
    AdmService admService;
    @Value("${adminserver}")
    String adminserver;


    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("adminserver", adminserver);
        return "index";
    }
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        logger.info("-------------------------- "+id+" "+pwd);
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm = admService.get(id);
            if(adm != null && encoder.matches(pwd, adm.getPwd())){
                //&&가 두개 있으면 앞에꺼 실패하면 뒤에꺼 굳이 안해봄
                nextPage = "loginok";
                session.setMaxInactiveInterval(100000);
                session.setAttribute("loginadm", adm);
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애: 잠시 후 다시 로그인하세요");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/adminfo")
    public String adminfo(Model model, String id) throws Exception {
        Adm adm = null;
        try {
            adm = admService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("adminfo", adm);
        model.addAttribute("center", "adminfo");
        return "index";
    }

    @RequestMapping("/adminfoimpl")
    public String adminfoimpl(Model model, Adm adm) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.modify(adm);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        return "redirect:/adminfo?id="+adm.getId();
    }

    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession session) {
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
            session.setAttribute("loginadm", adm); //정상적으로 회원가입되면 자동으로 로그인되게
        } catch (Exception e) {
            throw new Exception("-------------가입 오류-------------");
        }
        model.addAttribute("radm", adm);
//        model.addAttribute("center", "registerok");
        return "redirect:/";
    }

    @RequestMapping("/charts")
    public String charts(Model model) {
        model.addAttribute("center", "charts");
        return "index";
    }

    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "livechart");
        return "index";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "websocket");
        return "index";
    }
}