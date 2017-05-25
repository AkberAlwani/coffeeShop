package edu.mum.coffee.controller;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Julia on 5/24/17.
 */

@Controller
@RequestMapping(value = "/persons")
public class PersonController {

  @Autowired
  PersonService personService;

  @GetMapping("")
  public List<Person> getAllPerson()
  {
    return personService.findAll();
  }

  @PostMapping("")
  public Person create(Person person) {
    personService.savePerson(person);
    return person;
  }

  @PostMapping(value="/addperson")
  public String addperson(Person person, Address address, Model model)
  {
    person.setAddress(address);
    personService.savePerson(person);
    model.addAttribute("persons", personService.findAll());
    return "addperson";
  }
  @GetMapping(value="/addperson")
  public String getperson(Model model)
  {
    model.addAttribute("persons", personService.findAll());
    return "addperson";
  }

  @DeleteMapping("/deleteperson/{id}")
  public String delete(@PathVariable int id) {
    Person person=personService.find(id);
    personService.delete(person);
    return "persons";
  }

  @GetMapping(value="/updateperson/{id}")
  public String updateperson(@PathVariable("id") int id, Model model)
  {
    model.addAttribute("person", personService.find(id));
    return "updateperson";
  }

  @PostMapping(value="/updateperson")
  public String updateperson(Person person, Address address, Model model)
  {
      Person found= personService.findById(person.getId());
      personService.delete(person);
      person.setAddress(address);
      personService.save(person);
      model.addAttribute("persons", personService.findAll());
      return "addperson";
  }






}
