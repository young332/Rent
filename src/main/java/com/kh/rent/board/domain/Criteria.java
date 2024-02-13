package com.kh.rent.board.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Criteria {

	private int pageNum; //페이지 번호
	private int amount; //페이지당 출력할 데이터 수
	private int startRow;
	private int endRow;
	
	
	//기본생성자 기본값 1페이지,10개
	public Criteria() {
		this(1, 10, 1, 10);
		setRows();
	}
	
	public Criteria(int pageNum, int amount, int startRow, int endRow) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	private void setRows() {
		endRow = pageNum * amount;
		startRow = endRow - (amount -1);
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		setRows();
	}
	
	

}