package edu.mum.coffee.restservice;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * Created by Julia on 5/24/17.
 */
@RestController
@RequestMapping(value="/rest/product")
public class ProductRestAPI {

	@Autowired
	private ProductService productService;

	@RequestMapping(method = RequestMethod.POST)
	public Product saveProduct(@RequestBody Product order)
	{
			return productService.save(order) ;
	}

	@RequestMapping(method = RequestMethod.DELETE)
	public void deleteProduct(@RequestBody Product product)
	{
		productService.delete(product) ;
	}

	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public Product findById(@PathVariable int id)
	{
		return productService.getProduct(id);
	}

	@RequestMapping( method = RequestMethod.GET)
	public List<Product> findAll()
	{
			return productService.getAllProduct();
	}

	@RequestMapping(value="/type", method = RequestMethod.GET)
	public List<Product> findByProductType(@PathParam(value = "productType") ProductType productType)
	{
			return productService.findByProductType(productType) ;
	}

	
	

	
	
}
