package com.kh.rent.admin.controller;

import java.io.File;
import java.io.IOException;
import org.springframework.util.StringUtils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.FileVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.domain.Search;
import com.kh.rent.admin.service.CarInfoService;
import com.kh.rent.login.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/car/*")
public class CarInfoController {
	
	@Autowired
	private CarInfoService carInfoService;
	
	// 업로드된 파일이 저장될 디렉토리 경로
    //@Value("C:\\Users\\well0\\git\\Rent\\src\\main\\webapp\\resources\\upload")
	//@Value("${upload.directory}")
	@Value("G:/Workspace/spring/Rent/src/main/webapp/resources/upload")
    private String uploadDirectory;
	
	// 차량 등록 처리
    @PostMapping("/CarInfoAdd")
    public String carInfoAdd(CarInfoVO carInfoVO, 
                             @RequestParam("image_path") MultipartFile imagePath,
                             RedirectAttributes rttr) {
        log.info("carInfoVO:" + carInfoVO);
        log.info("uploadDirectory:" +uploadDirectory);
        FileVO fileVO = new FileVO();
  
        try {
            // 업로드할 파일에 대한 정보 설정
            UUID uuid = UUID.randomUUID();
            String originalFilename = imagePath.getOriginalFilename();
            String uniqueFilename = uuid + "_" + originalFilename;
            
            // 상대경로를 기반으로 Path 객체 생성
            Path relativeDestination = Paths.get(uploadDirectory, uniqueFilename);

            
            String fileExtension = StringUtils.getFilenameExtension(originalFilename);
            
            long fileSize = imagePath.getSize();
            
            // 파일 업로드
            imagePath.transferTo(relativeDestination.toFile());
            
            fileVO.setFile_sn(1);
            fileVO.setFile_stre_cours(uploadDirectory);
            fileVO.setOrignl_file_nm(originalFilename);
            fileVO.setUnique_file_nm(uniqueFilename);
            fileVO.setFile_extension(fileExtension);
            fileVO.setFile_size(fileSize);
            
        } catch (IOException e) {
            e.printStackTrace();
            // 파일 업로드 중 오류가 발생한 경우 예외 처리
            rttr.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
            return "redirect:/admin/car/registerCar";
        }
        
        int file_id = carInfoService.insertFile(fileVO);
        
        carInfoVO.setFile_id(file_id);
        
        int count = carInfoService.addCar(carInfoVO);
        if (count == 1) {
            rttr.addFlashAttribute("AddCar", "success");
        }
        
        return "redirect:/admin/car/ListCar";
    }
    
    @PostMapping("/CarInfoModify")
    public String CarInfoModify(CarInfoVO carInfoVO,
    							@RequestParam("image_path") MultipartFile imagePath,
    							RedirectAttributes rttr) {
    	
    	log.info("carInfoUpdateVO: "+carInfoVO);
    	log.info("uploadDirectory:" +uploadDirectory);
    	
    	int file_id1 = carInfoVO.getFile_id();
    	System.out.println("file_id1:"+file_id1);
    	int resultDel = carInfoService.deleteCarFile(file_id1);
    	
        FileVO fileVO = new FileVO();
  
        try {
            // 업로드할 파일에 대한 정보 설정
            UUID uuid = UUID.randomUUID();
            String originalFilename = imagePath.getOriginalFilename();
            String uniqueFilename = uuid + "_" + originalFilename;
            
            // 상대경로를 기반으로 Path 객체 생성
            Path relativeDestination = Paths.get(uploadDirectory, uniqueFilename);

            String fileExtension = StringUtils.getFilenameExtension(originalFilename);
            
            long fileSize = imagePath.getSize();
            
            // 파일 업로드
            imagePath.transferTo(relativeDestination.toFile());
            fileVO.setFile_id(carInfoVO.getFile_id());
            fileVO.setFile_sn(1);
            fileVO.setFile_stre_cours(uploadDirectory);
            fileVO.setOrignl_file_nm(originalFilename);
            fileVO.setUnique_file_nm(uniqueFilename);
            fileVO.setFile_extension(fileExtension);
            fileVO.setFile_size(fileSize);
            
        } catch (IOException e) {
            e.printStackTrace();
            // 파일 업로드 중 오류가 발생한 경우 예외 처리
            rttr.addFlashAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
            return "redirect:/admin/car/ListCar";
        }
        
        System.out.println("fileID:"+ carInfoVO.getFile_id());

        int file_id = carInfoService.insertFile(fileVO);
        carInfoVO.setFile_id(file_id);
        
//        if(carInfoVO.getFile_id() != 0) {
//        	
//        }
        
        int count = carInfoService.updateCarInfo(carInfoVO);
    	if (count == 1) {
            rttr.addFlashAttribute("ModifyCar", "success");
        }
        
    	return "redirect:/admin/car/ListCar";
    }
    
    @GetMapping(value = "/deleteCarFile", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public Map<String, String> deleteCarFile(@RequestParam Integer file_id) {
    	Map<String, String> response = new HashMap<>();
		int resultDel = carInfoService.deleteCarFile(file_id);
		//int resultUpdate = carInfoService.updateCarinfoFile(file_id);
		
		// 작업에 따른 응답 메시지 설정
	    if (resultDel > 0 ) {
	        response.put("status", "success");
	        response.put("message", "파일 삭제 및 차량 정보 업데이트 성공");
	    } else {
	        response.put("status", "error");
	        response.put("message", "파일 삭제 및 차량 정보 업데이트 실패");
	    }
	    
	    return response;
    }
    
	@GetMapping(value = "/getCarInfo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public CarInfoVO getCarInfo(@RequestParam Integer car_index) {
		System.out.println("car_index: " + car_index);
		CarInfoVO carInfoVO = carInfoService.selectCarInfoByIndex(car_index);
		
        return carInfoVO;
    }

	 //검색기능
	 @GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public List<CarInfoVO> search(@RequestParam String type, @RequestParam String keyword) {
		 Search search = new Search(type, keyword);
		 search.setKeyword(keyword);
		 search.setType(type);
		 log.info("search:" +search);
		 List<CarInfoVO> carInfoList = carInfoService.selectCarInfo(search);
		 log.info("carInfoList:"+carInfoList);
		 return carInfoList;
	 }
    
    

}
