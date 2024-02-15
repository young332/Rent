package com.kh.rent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;
import com.kh.rent.point.domain.PointVO;
import com.kh.rent.reserve.service.CustomerEventService;
import com.kh.rent.reserve.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
    @Autowired
    private ReserveService reserveService;
    
    @Autowired
    private CustomerEventService customerEventService;
    
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
    
    @GetMapping("/customerevent")
    public void customer() {
    	
    }
    

    @Transactional
	@PostMapping("/customerevent")
	public String pointIn( HttpSession session,MemberVO memberVO, PointVO pointVO,RedirectAttributes rttr) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		log.info("YeonMemberVO:" + memberVO);
		log.info("YeonPointVO:"+ pointVO);
		
		int point_cost = pointVO.getPoint_cost();
		String point_code = pointVO.getPoint_code();
		String mem_id = loginInfo.getMem_id();
		Map<String, Object> pointMap = new HashMap<>();
		pointMap.put("point_cost", point_cost);
		pointMap.put("point_code", point_code);
		pointMap.put("mem_id", mem_id);
		
		boolean result = customerEventService.addPointOfEvent(pointMap);
		
//		int result = customerEventService.addEventPoint(memberVO);
//		customerEventService.addPointTable(pointVO);
		
		 if (result) {
//	    	String mem_id = pointVO.getPoint_user_id();
//	    	int point= customerEventService.selectPoint(mem_id);
//	    	int eventpoint = pointVO.getPoint_cost();
	    	loginInfo.setMem_point(memberVO.getMem_point()+point_cost);
	    	session.setAttribute("loginInfo", loginInfo);
	    	
	    } else {
	    	rttr.addFlashAttribute("msg", "fail");
	    }
		 
		return "redirect:/myPage/myPage";
		
	}
	
}

