package com.ARF21.pack.shop.entity;


import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Supplier extends BaseEntity {

    private String companyName;

    //address, logo...
    @JsonManagedReference(value ="secondParent")
    @OneToMany(mappedBy = "supplier", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Product> supplierProducts = new HashSet<>();

    public Supplier() {
    	
    }
    
    public Supplier(String companyName) {
        this.companyName = companyName;

    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }




}
