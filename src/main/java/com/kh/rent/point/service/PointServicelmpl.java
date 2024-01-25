package com.kh.rent.point.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.point.mapper.PointMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PointServicelmpl {
	
	@Autowired
	private PointMapper pointMapper;

}
