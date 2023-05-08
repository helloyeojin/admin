package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ItemSearch {
    private String name;
//    private int search_price1;
//    private int search_price2;
    private Integer price;
    private String startdate;
    private String enddate;
}
