package edu.mum.coffee.restservice;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * Created by Julia on 5/24/17.
 */
@RestController
@RequestMapping(value="/rest/person")
public class PersonRestAPI {
	
	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/{id}", method = RequestMethod.GET, produces = "application/json")
	public Person getPersonById(@PathVariable long id)
	{
		return personService.findById(id);
	}
	@GetMapping("/")
	public List<Person> getAllPerson()
	{
		return personService.findAll();
	}


	@RequestMapping(value="/email", method = RequestMethod.GET)
	public List<Person> getPersonByEmail(@PathParam(value = "email") String email)
	{
			return (List<Person>) personService.findByEmail(email);
	}

	@RequestMapping(value="/", method = RequestMethod.POST)
	public Person addPerson(@RequestBody Person person)
	{
			return personService.savePerson(person) ;
	}

	
	@RequestMapping(value="/", method = RequestMethod.DELETE)
	public void deletePerson(@RequestBody Person person)
	{
		 personService.removePerson(person);
	}

}
