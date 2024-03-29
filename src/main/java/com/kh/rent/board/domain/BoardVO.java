package com.kh.rent.board.domain;

import java.sql.Timestamp;
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
	private Timestamp board_cdate;
	private Timestamp board_udate;
	private Integer readcount;
	private String board_mem_id;
	private String board_privateYN;
	private String board_noticeYN;
	
	// 답글
	private int board_group; // 그룹핑
	private int board_seq; // 답글 순서
	private int board_level; // 들여쓰기(답글의 답글)
	private String board_deleteYN; // 삭제여부(N:정상, Y:삭제)
}
