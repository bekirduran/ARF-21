package com.ARF21.pack.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Company extends BaseEntity {
	

	private String companyName;
	private String companyUrl;
	private String companyDepartment;
	private String establishment;
	private int employeeCount;
	private String address;
	private String contact;
	private String website;
	
	@Column(columnDefinition = "TEXT")
	private  String companyAbout;
	
	public Company() {
		
	}
	
	public Company(String companyName, String companyUrl, String companyDepartment, String establishment,
			int employeeCount, String address, String contact, String website, String companyAbout) {
		this.companyName = companyName;
		this.companyUrl = companyUrl;
		this.companyDepartment = companyDepartment;
		this.establishment = establishment;
		this.employeeCount = employeeCount;
		this.address = address;
		this.contact = contact;
		this.website = website;
		this.companyAbout = companyAbout;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyUrl() {
		return companyUrl;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getCompanyDepartment() {
		return companyDepartment;
	}

	public void setCompanyDepartment(String companyDepartment) {
		this.companyDepartment = companyDepartment;
	}

	public String getEstablishment() {
		return establishment;
	}

	public void setEstablishment(String establishment) {
		this.establishment = establishment;
	}

	public int getEmployeeCount() {
		return employeeCount;
	}

	public void setEmployeeCount(int employeeCount) {
		this.employeeCount = employeeCount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getCompanyAbout() {
		return companyAbout;
	}

	public void setCompanyAbout(String companyAbout) {
		this.companyAbout = companyAbout;
	} 
	
	
	
	
	
	
}
