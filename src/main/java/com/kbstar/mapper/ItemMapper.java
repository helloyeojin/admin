package com.kbstar.mapper;


import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemMapper extends KBMapper<Integer, Item> {
    public List<Item> search(ItemSearch is);
}
