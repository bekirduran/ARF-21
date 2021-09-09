package com.ARF21.pack.shop.controller.request;



public class AttiRequest {

	private Long productId;
	private Long attributeId;
	private String value;

	public AttiRequest() {
	}

	public AttiRequest(Long productId, Long attributeId, String value) {
		this.productId = productId;
		this.attributeId = attributeId;
		this.value = value;
	}

	public Long getProductId() {
		return productId;
	}

	public Long getAttributeId() {
		return attributeId;
	}

	public String getValue() {
		return value;
	}
}
