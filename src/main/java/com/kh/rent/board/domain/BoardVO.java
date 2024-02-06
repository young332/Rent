package com.kh.rent.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BoardVO {
	
	private Long board_no;
	private String board_title;
	private String board_content;
	private Date board_cdate;
	private Date board_udate;

}
