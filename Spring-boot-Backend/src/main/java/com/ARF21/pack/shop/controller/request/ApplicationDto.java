package com.ARF21.pack.shop.controller.request;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
public class ApplicationDto {

	private Long userId;
	private Long companyId;
	
	
	
	public ApplicationDto(Long userId, Long companyId) {
		this.userId = userId;
		this.companyId = companyId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long usertId) {
		this.userId = userId;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	
	
}
