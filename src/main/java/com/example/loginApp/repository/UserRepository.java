package com.example.loginApp.repository;

import com.example.loginApp.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

//@RepositoryRestResource(collectionResourceRel = "users",path = "users")
public interface UserRepository extends MongoRepository<User,String> {
    public List<User> findByLastName(@Param("name") String name);
    public User findByUsername(String username);
}
