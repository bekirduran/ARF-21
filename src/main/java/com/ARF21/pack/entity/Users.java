package com.ARF21.pack.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;



@Entity
@Table(name="users",
	uniqueConstraints = {
			@UniqueConstraint(columnNames = "username"),
			@UniqueConstraint(columnNames = "email")
		})

public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	
	@Size(max=20)
	private String username;
	
	
	@Size(max=50)
	private String email;
	
	
	@Size(max=20)
	private String name;
	
	
	@Size(max=20)
	private String lastname;
	
	
	@Size(max=11)
	private String tc;
	
	@NotBlank
	@Size(max=120)
	private String password;
	
	private String image;
	private String adres;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name="user_roles",
	joinColumns=@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="role_id"))
	
	
	
	
	
	private Set<Role> roles =new HashSet<>();


	public Users() {
		
	}
	
	
	
	public Users(String username,String email,String password) {
		this.username = username;
		this.email = email;
		this.password = password;
	}



	public Users(String username, String email,String name, String lastname, String tc, String password,String image,String adres) {
		this.username = username;
		this.email = email;
		this.name=name;
		this.lastname=lastname;
		this.tc=tc;
		this.password = password;
		this.adres=adres;
		this.image=image;
	}


	

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getTc() {
		return tc;
	}

	public void setTc(String tc) {
		this.tc = tc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}
	
	
	
	
	

	
	 
}
