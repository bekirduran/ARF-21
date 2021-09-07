package com.ARF21.pack.shop.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.HashSet;
import java.util.Set;

@Entity
public class ProductAttribute extends BaseEntity{

    private String attributeName;

    @JsonManagedReference
    @OneToMany(mappedBy = "productAttribute", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<AttributeValue> attributeValues = new HashSet<>();



    public ProductAttribute() {

    }

    public ProductAttribute(String attributeName) {
        this.attributeName = attributeName;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }
}
