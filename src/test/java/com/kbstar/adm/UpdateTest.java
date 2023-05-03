package com.kbstar.adm;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    AdmService service;

    @Test
    void contextLoads() {
        try{
            service.modify(new Adm("admin05", "pwd05", 5));
            service.modify(new Adm("admin03", "pwd03", 10));
            service.get();
        } catch (Exception e){
            log.info("에러..........");
            e.printStackTrace();
        }
    }
}