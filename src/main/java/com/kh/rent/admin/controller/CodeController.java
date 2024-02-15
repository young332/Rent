package com.kh.rent.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.service.CodeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/commonCode/*")
public class CodeController {
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping(value = "/subcodes/{parent_code}", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public List<CommonCodeVO> getSubMenus(@PathVariable("parent_code") String parent_code, Model model) {
		List<CommonCodeVO> subMenuList = codeService.getSubCode(parent_code);
		return subMenuList;
    }
	
	
	@PostMapping("/topCodeAdd")
	public String topCodeAdd(CommonCodeVO commonCodeVO, RedirectAttributes rttr) {
		log.info("commonCodeVO:" + commonCodeVO);
		int count = codeService.addCode(commonCodeVO);
		if(count == 1) {
			rttr.addFlashAttribute("AddCodeName",commonCodeVO.getCode_name());
		}
		
		return "redirect:/admin/commonCode";
	}
	
	@PostMapping("/subCodeAdd")
	public String SubMenuAdd(CommonCodeVO CommonCodeVO, RedirectAttributes rttr) {
		//log.info("menuVO:" + menuVO);
		int count = codeService.addCode(CommonCodeVO);
		if(count == 1) {
			rttr.addFlashAttribute("AddCodeName",CommonCodeVO.getCode_name());
		}
		return "redirect:/admin/commonCode";
	}
	
	@PostMapping("/topCodeModify")
	public String topCodeModify(CommonCodeVO CommonCodeVO, RedirectAttributes rttr) {
		log.info("CommonCodeVO:" + CommonCodeVO);
		int count = codeService.modifyCode(CommonCodeVO);
		log.info("count:"+count);
		if(count == 1) {
			rttr.addFlashAttribute("ModifyCodeName",CommonCodeVO.getCode_name());
		}
		return "redirect:/admin/commonCode";
	}
	
	@PostMapping("/subCodeModify")
	public String subCodeModify(CommonCodeVO CommonCodeVO, RedirectAttributes rttr) {
		int count = codeService.modifyCode(CommonCodeVO);
		if(count == 1) {
			rttr.addFlashAttribute("ModifyCodeName",CommonCodeVO.getCode_name());
		}
		return "redirect:/admin/commonCode";
	}
	
	@PostMapping("/delete/{parent_code}")
	public String codeDelete(@PathVariable("parent_code") String parent_code, RedirectAttributes rttr) {
		int count = codeService.delete(parent_code);
	    log.info("count:" + count);
		if(count == 1) {
			rttr.addFlashAttribute("deleteMenuName",parent_code);
		}
		return "redirect:/admin/commonCode";
	}
	
	
	
}
