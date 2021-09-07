package com.ARF21.pack.shop.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.ARF21.pack.entity.Users;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Application extends BaseEntity{

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "users_id")
	private Users users;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "company_id")
	private Company company;

	public Application() {
		
	}
	
	public Application(Users users, Company company) {
		this.users = users;
		this.company = company;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	
	
}
