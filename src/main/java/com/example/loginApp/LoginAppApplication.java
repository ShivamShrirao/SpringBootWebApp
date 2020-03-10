package com.example.loginApp;

import com.example.loginApp.model.Customer;
import com.example.loginApp.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LoginAppApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(LoginAppApplication.class, args);
	}

	@Autowired
	private CustomerRepository repo;

	@Override
	public void run(String... args) throws Exception{
		repo.deleteAll();

		repo.save(new Customer("Alice","Smith"));
		repo.save(new Customer("Bob","Smith"));

		System.out.println("Customers:");
		for (Customer customer : repo.findAll()){
			System.out.println(customer);
		}
		System.out.println("\nby first name\n");
		System.out.println(repo.findByFirstName("Alice"));
		System.out.println("by last name\n");
		System.out.println(repo.findByLastName("Smith"));
		System.out.println("line by line");
		for (Customer customer : repo.findByLastName("Smith")){
			System.out.println(customer);
		}
	}
}
