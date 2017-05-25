package edu.mum.coffee.restservice;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.Date;
import java.util.List;

/**
 * Created by Julia on 5/24/17.
 */

@RestController
@RequestMapping(value="/rest/order")
public class OrderRestAPI {
	

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(method = RequestMethod.POST)
	public Order saveOrder(@RequestBody Order order)
	{
			return orderService.save(order) ;
	}

	@RequestMapping(method = RequestMethod.DELETE)
	public void removeOrder(@RequestBody Order order)
	{
			  orderService.delete(order) ;
	}

	
	@RequestMapping(value="/product/{pid}", method = RequestMethod.GET)
	public List<Order> findByProduct(@PathVariable int pid)
	{
			return orderService.findByProduct( productService.getProduct(pid));
	}


	@RequestMapping(value="/person/{pid}", method = RequestMethod.GET)
	public List<Order> findByPerson(@PathVariable long pid)
	{
			return orderService.findByPerson( personService.findById(pid));
	}


	
	@RequestMapping( value="/date", method = RequestMethod.GET)
	public List<Order> findByDate(@PathParam(value = "minDate") Date minDate, @PathParam(value = "maxDate") Date maxDate)
	{
			return orderService.findByDate(minDate, maxDate);
	}

	
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public Order findById(@PathVariable int id)
	{
		return orderService.findById(id);
	}


	@RequestMapping( method = RequestMethod.GET)
	public List<Order> findAll()
	{
			return orderService.findAll();
	}

	
}
