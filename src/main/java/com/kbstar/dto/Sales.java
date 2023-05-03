package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Sales {
    private String rdate;  //화면에서는 보통 달력 선택해서 날짜를 클릭하는데 그거가 스트링 타입
    private int price;
    private String gender;
}
