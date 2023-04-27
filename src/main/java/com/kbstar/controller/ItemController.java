package com.kbstar.controller;


import com.kbstar.dto.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "items/";

    //127.0.0.1/item
    @RequestMapping("")
    public String all(Model model) {
        List<Item> list = new ArrayList<>();
        list.add(new Item(100, "rose", 7000, 3, new Date()));
        list.add(new Item(101, "daisy", 2000, 10, new Date()));
        list.add(new Item(102, "lily", 3000, 5, new Date()));
        list.add(new Item(103, "marigold", 4000, 7, new Date()));
        list.add(new Item(104, "jasmine", 5000, 19, new Date()));
        list.add(new Item(105, "iris", 5500, 20, new Date()));
        list.add(new Item(106, "daffodil", 3000, 1, new Date()));
        list.add(new Item(107, "lotus", 15000, 2, new Date()));
        list.add(new Item(108, "lavender", 4000, 6, new Date()));
        list.add(new Item(109, "dandelion", 5000, 7, new Date()));
        list.add(new Item(110, "freesia", 7000, 29, new Date()));
        list.add(new Item(111, "buttercups", 2000, 13, new Date()));
        list.add(new Item(112, "aster", 4500, 11, new Date()));
        list.add(new Item(113, "chrysanthemum", 10000, 7, new Date()));
        list.add(new Item(114, "tulip", 9700, 19, new Date()));
        list.add(new Item(115, "hibiscus", 5000, 9, new Date()));
        list.add(new Item(116, "peony", 6300, 12, new Date()));
        list.add(new Item(117, "periwinkle", 4700, 17, new Date()));
        list.add(new Item(118, "bluebell", 6750, 5, new Date()));
        list.add(new Item(119, "hyacinth", 8700, 6, new Date()));
        model.addAttribute("allitem", list);

        model.addAttribute("center", "tables");
        return "index";
    }
}