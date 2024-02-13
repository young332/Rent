package com.kh.rent;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.rent.admin.domain.CarInfoVO;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;

import com.kh.rent.admin.service.AdMemberService;

import com.kh.rent.reserve.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
    @Autowired
    private ReserveService reserveService;
    
    @Autowired
    private AdMemberService adMemberService;
    
    @GetMapping("/main")
    public String index(HttpSession session, Model model) {
        //List<CarInfoVO> carinfolist = reserveService.getCarInfo();
    	
    	MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
        model.addAttribute("loginInfo", loginInfo);
        NonMemberLoginDTO nonMemberLoginDTO = (NonMemberLoginDTO) session.getAttribute("nonMemberLoginDTO");
        model.addAttribute("nonMemberLoginDTO", nonMemberLoginDTO);
        
    	List<CarInfoVO> carinfolist = reserveService.getPosCar();
        model.addAttribute("carinfolist", carinfolist);
        log.info("Maincarinfolist" + carinfolist);
        log.info("MainController...");
        log.info("loginInfo:" + loginInfo);
        return "main"; 
    }
    
    
    
    
}


