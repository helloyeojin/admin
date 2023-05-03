package com.kbstar.markerdesc;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerDescService service;
    @Test
    void contextLoads() {
        MarkerDesc obj = new MarkerDesc(15,107,"주먹밥", 15000,"dak4.jpg");
        try {
            service.modify(obj);
            log.info("수정정상");
        } catch (Exception e) {
     
               log.info("시스템장애입니다.");

        }
    }

}
