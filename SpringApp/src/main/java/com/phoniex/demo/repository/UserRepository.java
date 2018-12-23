package com.phoniex.demo.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.phoniex.demo.model.Users;

public interface UserRepository extends MongoRepository<Users,Double>{
	
	public Optional<Users> findOneByName(String username);

}
