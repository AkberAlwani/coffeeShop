package edu.mum.coffee.restclient;

/**
 * Created by Julia on 5/24/2017.
 */

import edu.mum.coffee.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductClient {

    @GetMapping({ "/product" })
    public String productPage(Model model) {

        RestTemplate restTemplate = new RestTemplate();
        List<Product> products = restTemplate.getForObject("http://localhost:8082/product", ArrayList.class);
        model.addAttribute("products", products);
        return "products";

    }

}
