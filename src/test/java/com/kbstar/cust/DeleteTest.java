package com.kbstar.cust;

import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {
    @Autowired
    CustService service;

    @Test
    void contextLoads() {
        try{
            service.remove("id10");
        } catch (Exception e){
            log.info("에러..........");  //디비가 죽었거나 네트워크를 날렸거나
            // 없는 아이디여서 삭제가 안되더라도 에러는 아님
        }
    }
}