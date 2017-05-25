package edu.mum.coffee.restclient;

import edu.mum.coffee.domain.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Julia on 5/24/2017.
 */
@Controller
public class PersonClient {
    @GetMapping({ "/person" })
    public String productPage(Model model) {

        RestTemplate restTemplate = new RestTemplate();
        List<Person> persons = restTemplate.getForObject("http://localhost:8082/person", ArrayList.class);
        model.addAttribute("persons ",persons );
        return "persons";

    }
}
