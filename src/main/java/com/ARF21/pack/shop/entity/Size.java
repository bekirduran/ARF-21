package com.ARF21.pack.shop.entity;

import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity

@NoArgsConstructor
public class Size extends BaseEntity{

    @NotBlank
    private String sizeName;

        @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private Set<ProductSize> products = new HashSet<>();

        
    public Size() {
        	
        }
    public Size(String sizeName, Set<ProductSize> products) {
        this.sizeName = sizeName;
        this.products = products;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public Set<ProductSize> getProducts() {
        return products;
    }

    public void setProducts(Set<ProductSize> products) {
        this.products = products;
    }
}
