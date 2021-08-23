package com.ARF21.pack.shop.controller.request;

public class Imagerequest {

	private Long id;
	private String imageURL;
	
	
	public Imagerequest() {
		
	}
	public Imagerequest(Long id, String imageURL) {
		this.id = id;
		this.imageURL = imageURL;
	}
	public Imagerequest(Long id) {
		this.id = id;
	}
	public Imagerequest(String imageURL) {
		this.imageURL = imageURL;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	
	
	
	
	
	
}
