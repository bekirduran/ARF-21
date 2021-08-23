package com.ARF21.pack.shop.entity;



public class ProductDto {

	private String productName;

    
    private String productDesc;

    
    private Double productPrice;

    private String productImageURL;

    private Long productStock;
    
    private String category;
    
    /*private String supplier;*/

    public ProductDto() {
    	
    }
    
	public  ProductDto(final Product product) {
		this.productName = product.getProductName();
		this.productDesc = product.getProductDesc();
		this.productPrice = product.getProductPrice();
		this.productImageURL = product.getProductImageURL();
		this.productStock = product.getProductStock();
		this.category = product.getCategory().getCategoryName();
		/*this.supplier = product.getSupplier().getCompanyName();*/
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImageURL() {
		return productImageURL;
	}

	public void setProductImageURL(String productImageURL) {
		this.productImageURL = productImageURL;
	}

	public Long getProductStock() {
		return productStock;
	}

	public void setProductStock(Long productStock) {
		this.productStock = productStock;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	/*public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}*/
	
	
    
    
}
