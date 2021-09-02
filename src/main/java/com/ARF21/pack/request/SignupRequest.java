package com.ARF21.pack.request;

import java.util.Set;

import javax.validation.constraints.*;

public class SignupRequest {

	
    @Size(min = 3, max = 20)
    private String username;
 
    
    @Size(max = 50)
    @Email
    private String email;
    
    
	@Size(max=20)
	private String name;
	
	
	@Size(max=20)
	private String lastname;
	
	
	@Size(min=11,max=11)
	private String tc;
    
    private Set<String> role;
    
    
    //@Size(min = 6, max = 40)
    private String password;
    
    private String image;
    private String adres;
  
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
    
    public Set<String> getRole() {
      return this.role;
    }
    
    public void setRole(Set<String> role) {
      this.role = role;
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
