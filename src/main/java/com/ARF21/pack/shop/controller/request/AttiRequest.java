package com.ARF21.pack.shop.controller.request;



public class AttiRequest {

	private Long id;
	private int iid;
	private String value;
	
	public AttiRequest() {
		
	}

	public AttiRequest(Long id) {
		super();
		this.id = id;
	}

	public AttiRequest(int iid) {
		super();
		this.iid = iid;
	}

	public AttiRequest(String value) {
		super();
		this.value = value;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	


	
	
	
	
	
}
