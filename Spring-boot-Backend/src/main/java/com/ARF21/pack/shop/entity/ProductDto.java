package com.ARF21.pack.shop.entity;

import java.util.ArrayList;
import java.util.List;

public class ProductDto {
    private String productName;


    private String productDesc;


    private Double productPrice;


    private Long productStock;

    private String category;

    private String supplier;

    private List<String> imageURLs=new ArrayList<>();
    private List<String> attributes=new ArrayList<>();

    public ProductDto() {

    }

    public  ProductDto(final Product product) {
        this.productName = product.getProductName();
        this.productDesc = product.getProductDesc();
        this.productPrice = product.getProductPrice();
        this.productStock = product.getProductStock();
        this.category = product.getCategory().getCategoryName();
        this.supplier = product.getSupplier().getCompanyName();
        for (var entry : product.getImages()) {
            this.imageURLs.add(entry.getImageURL());
        }
        for (var entry : product.getAttributeValues()) {
            this.attributes.add(entry.getValue());
        }



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

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public List<String> getImageURLs() {
        return imageURLs;
    }

    public void setImageURLs(List<String> imageURLs) {
        this.imageURLs = imageURLs;
    }

    public List<String> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<String> attributes) {
        this.attributes = attributes;
    }
}
