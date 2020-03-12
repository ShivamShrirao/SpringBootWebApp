package com.example.loginApp.repository;

import com.example.loginApp.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends MongoRepository<User,String> {
    public List<User> findByLastName(@Param("name") String name);
    public User findByUsernameAndPassword(String username, String password);
    public User findByUsername(String username);
}
