package com.kh.rent.reserve.mapper;

import java.util.List;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface ReserveMapper {
	
	public void reserveinsert(ReserveVO reserveVO);
	public List<ReserveVO> getList(); 
	public List<CarInfoVO> getCarInfo();
	public List<ReserveDTO> selectCheck(ReserveDTO reserveDTO);
	public List<MemberVO> getMemberInfo();
	public ReserveDTO findByCindex(String car_index);
}
