package com.kh.rent;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.reserve.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
    @Autowired
    private ReserveService reserveService;
    
    @GetMapping("/main")
    public String index(Model model) {
        //List<CarInfoVO> carinfolist = reserveService.getCarInfo();
    	List<CarInfoVO> carinfolist = reserveService.getPosCar();
        model.addAttribute("carinfolist", carinfolist);
        log.info("Maincarinfolist" + carinfolist);
        log.info("MainController...");
        return "main"; 
    }
    
    
}


