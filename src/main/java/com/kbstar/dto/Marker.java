package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Marker {
    private int id;
    private String title;
    private String target;
    private double lat;
    private double lng;
    private String img;
    private String loc;

    private MultipartFile imgfile;

    public Marker(int id, String title, String target, double lat, double lng, String img, String loc) {
        this.id = id;
        this.title = title;
        this.target = target;
        this.lat = lat;
        this.lng = lng;
        this.img = img;
        this.loc = loc;
    }
}
