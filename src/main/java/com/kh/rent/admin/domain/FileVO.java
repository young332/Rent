package com.kh.rent.admin.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class FileVO {
	
	private Integer file_id;
	private Integer file_sn;
	private String file_stre_cours;
	private String orignl_file_nm;
	private String unique_file_nm;
	private String file_extension;
	private long file_size;
	private Timestamp file_create_date;
	
}
