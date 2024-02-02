package com.kh.rent.admin.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.service.CarInfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/car/*")
public class CarInfoController {
	
	@Autowired
	private CarInfoService carInfoService;
	
	 // 업로드된 파일이 저장될 디렉토리 경로
    @Value("Rent/src/main/webapp/resources/AttachFiles")
    private String uploadPath;
	
//	@PostMapping("/CarInfoAdd")
//	public String CarInfoAdd(CarInfoVO carInfoVO, RedirectAttributes rttr) {
//		log.info("carInfoVO:" + carInfoVO);
//		int count = carInfoService.addCar(carInfoVO);
//		if(count == 1) {
//			rttr.addFlashAttribute("AddMenuName",carInfoVO.getCar_number());
//		}
//		
//		return "redirect:/admin/car/registerCar";
//	}
	
	// 차량 등록 처리
    @PostMapping("/CarInfoAdd")
    public String carInfoAdd(CarInfoVO carInfoVO, 
                             @RequestParam("image_path") MultipartFile imagePath,
                             RedirectAttributes rttr) {
        log.info("carInfoVO:" + carInfoVO);
        
        try {
            // 업로드할 파일에 대한 정보 설정
            UUID uuid = UUID.randomUUID();
            String originalFilename = imagePath.getOriginalFilename();
            String uniqueFilename = uuid + "_" + originalFilename;
            Path destination = Paths.get(uploadPath, uniqueFilename);

            // 파일 업로드
            imagePath.transferTo(destination.toFile());
            
            // 이미지 경로를 CarInfoVO에 설정
            carInfoVO.setImage_path(uniqueFilename);
        } catch (IOException e) {
            e.printStackTrace();
            // 파일 업로드 중 오류가 발생한 경우 예외 처리
            rttr.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
            return "redirect:/admin/car/registerCar";
        }

        int count = carInfoService.addCar(carInfoVO);
        if (count == 1) {
            rttr.addFlashAttribute("AddMenuName", carInfoVO.getCar_number());
        }

        return "redirect:/admin/car/registerCar";
    }


	
	
	
	 	
	
	
}
