package com.kh.rent.board.domain;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PageDTO {

	private Criteria criteria;
	private boolean prev;
	private boolean next;
	private int startPage; //페이지 시작 번호
	private int  endPage; //페이지 끝 번호
	private int total;
	
	public PageDTO(Criteria criteria, int total) {
		this.criteria = criteria;
		this.total =total;
		
		endPage = (int)(Math.ceil(criteria.getPageNum() /10.0)) *10; //페이징의 끝번호 계산
		startPage = endPage - 9; 	//페이징의 시작번호 계산
		
		//보여줄 페이지가 10개 단위가 아닐 시 끝 페이지 번호 처리
		int realEnd = (int)(Math.ceil((float)total / criteria.getAmount()));
		if(realEnd < endPage) {
			endPage = realEnd; 	 //total을 통한 endPage의 재계산
		}
		
		prev = startPage > 1;			//이전페이지 계산
		next = endPage < realEnd;		//다음페이지 계산
	}
	
	
}
