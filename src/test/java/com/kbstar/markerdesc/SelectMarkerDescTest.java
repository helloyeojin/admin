package com.kbstar.markerdesc;

import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectMarkerDescTest {
    @Autowired
    MarkerDescService service;
    @Test
    void contextLoads() {
//          List<Marker> list=null;
        try {
//            list= service.get();
            service.getMarkerDesc(107);
        } catch (Exception e) {
            log.info("error...");
            e.printStackTrace();
        }
    }

}
