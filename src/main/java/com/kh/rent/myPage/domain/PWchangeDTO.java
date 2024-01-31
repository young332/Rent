package com.kh.rent.myPage.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PWchangeDTO {

	private String mem_id;
    private String password;
    private String newPassword;
}
