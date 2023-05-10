package com.kbstar.mapper;


import com.kbstar.dto.Chart;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ChartMapper {
    List<Chart> getMonthlyTotal();
}
