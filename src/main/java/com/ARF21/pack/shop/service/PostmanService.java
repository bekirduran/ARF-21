package com.ARF21.pack.shop.service;



import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ARF21.pack.entity.Users;
import com.ARF21.pack.repository.UserRepository;
import com.ARF21.pack.response.MessageResponse;
import com.ARF21.pack.shop.controller.request.AttiRequest;
import com.ARF21.pack.shop.controller.request.Imagerequest;
import com.ARF21.pack.shop.controller.request.OrderDto;
import com.ARF21.pack.shop.entity.AttributeValue;
import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Company;
import com.ARF21.pack.shop.entity.OrderItems;
import com.ARF21.pack.shop.entity.Orders;
import com.ARF21.pack.shop.entity.Product;
import com.ARF21.pack.shop.entity.ProductAttribute;
import com.ARF21.pack.shop.entity.ProductDto;
import com.ARF21.pack.shop.entity.ProductImage;
import com.ARF21.pack.shop.entity.Supplier;
import com.ARF21.pack.shop.repository.AttributeValueRepository;
import com.ARF21.pack.shop.repository.CategoryRepository;
import com.ARF21.pack.shop.repository.CompanyRepository;
import com.ARF21.pack.shop.repository.OrderItemsRepository;
import com.ARF21.pack.shop.repository.OrdersRepository;
import com.ARF21.pack.shop.repository.ProductAttributeRepository;
import com.ARF21.pack.shop.repository.ProductImagerepository;
import com.ARF21.pack.shop.repository.ProductRepository;
import com.ARF21.pack.shop.repository.SupplierRepository;

@Service
public class PostmanService {

	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	OrdersRepository ordersRepository;
	
	@Autowired
	OrderItemsRepository orderItemsRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	
	@Autowired
	SupplierRepository supplierRepository;
	
	
	@Autowired
    ProductImagerepository productImagerepository;

    @Autowired
    ProductAttributeRepository productAttributeRepository;
    
    @Autowired
    AttributeValueRepository attributeValueRepository;
    
    @Autowired 
	CompanyRepository companyRepository;
    
    @Autowired
	 UserRepository userRepository ;
    
    
	
	public ResponseEntity<?> postcata(@Valid @RequestBody Category request ){
		Category cata =new Category(request.getCategoryName(),
				request.getCategoryDesc(),request.getImage());
		categoryRepository.save(cata);
		return ResponseEntity.ok(new MessageResponse("category save success!"));
		
	}
	
	public ResponseEntity<?> postsup(@Valid @RequestBody Supplier request ){
		Supplier sup =new Supplier(request.getCompanyName());
		supplierRepository.save(sup);
		return ResponseEntity.ok(new MessageResponse("supplier save success!"));
		
	}
	
	public ResponseEntity<?> comppush(@Valid @RequestBody Company request){
		Company company=new Company(request.getCompanyName(), request.getCompanyUrl(), request.getCompanyDepartment(),
				request.getEstablishment(), request.getEmployeeCount(),
				request.getAddress(), request.getContact(), request.getWebsite(), request.getCompanyAbout());
		companyRepository.save(company);
		return ResponseEntity.ok(new MessageResponse("company save success!"));
	}
	
	
	public List<ProductDto> allAccess() {

        return productRepository.findAll().stream()
                .map(ProductDto::new)
                .toList();
    }
	
	public List<Category> getAllCategories() {

        return categoryRepository.findAll();
    }
	
	 public ProductImage postimage(@Valid @RequestBody Imagerequest request) {
	    	Product pd = productRepository.findById(request.getId())
	                .orElseThrow(() -> new EntityNotFoundException("not found"));
	    	ProductImage pimage=new ProductImage(request.getImageURL(),pd);
	    	productImagerepository.save(pimage);
	    	return pimage;
	    	
	 }
	 
	 public void postatti(@Valid @RequestBody ProductAttribute request) {
	    	ProductAttribute pat=new ProductAttribute(request.getAttributeName());
	    	productAttributeRepository.save(pat);
	    	
	    }
	 
	 public void postproductAttribute(@RequestBody AttiRequest request) {
	    	System.out.println(request.getValue()+"**"+request.getProductId()+"**"+request.getAttributeId());

	        Product pd = productRepository.findById(request.getProductId())
	                .orElseThrow(() -> new EntityNotFoundException("product not found"));

	    	ProductAttribute pa = productAttributeRepository.findById(request.getAttributeId())
	                .orElseThrow(() -> new EntityNotFoundException("product attribute not found"));

	    	AttributeValue av =new AttributeValue(request.getValue(), pd, pa);
	    	attributeValueRepository.save(av);
	    	
	    	
	    }
	 
	 public void postorder( @RequestBody OrderDto request) {
	       request.getOrderItems().forEach(orderItemDto -> System.out.println(orderItemDto.toString()));
	       Users user = userRepository.findById(request.getUserid()).orElseThrow(() -> new EntityNotFoundException("user not found"));
	       Orders order = new Orders(user, request.getOrderDate().atTime(LocalTime.now()), request.getOrderTotal());
	        for (int i = 0; i < request.getOrderItems().size(); i++) {
	            Product product = productRepository.findById(request.getOrderItems().get(i).getProductId()).orElseThrow(() -> new EntityNotFoundException("product not found"));
	            if(request.getOrderItems().get(i).getAttribute().isEmpty() || request.getOrderItems().get(i).getAttribute().isBlank())
	            	order.getOrderItems().add(new OrderItems(order,product,request.getOrderItems().get(i).getQuantity(),product.getProductPrice()*request.getOrderItems().get(i).getQuantity()));
	            else{
	            	AttributeValue attributeValue = attributeValueRepository.findByValueAndProductId(request.getOrderItems().get(i).getAttribute(),product.id()).orElseThrow(() -> new EntityNotFoundException("attribute not found"));
					order.getOrderItems().add(new OrderItems(order,product,request.getOrderItems().get(i).getQuantity(),product.getProductPrice()*request.getOrderItems().get(i).getQuantity(),attributeValue));

				}
				ordersRepository.save(order);
	        }
	    }

	 public List<Company> getCompanyall() {
	       return companyRepository.findAll();
	    }

	 public Optional<Company> getCompany(@PathVariable Long id) {
	       return companyRepository.findById(id);
	    }

	 public List<Orders> getOrdersOfUser( @PathVariable Long id) {
	        return ordersRepository.findByUserIdOrderByIdDesc(id);
	    }

	 public @ResponseBody List<Product> getProduct(@RequestParam String name) {
	       return productRepository.findByProductNameContaining(name);
	    }

	 public @ResponseBody List<Category> getCate(@RequestParam String name) {
	       return categoryRepository.findByCategoryNameContaining(name);
	    }
	
	
	
}
