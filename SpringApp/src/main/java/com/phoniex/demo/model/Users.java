package com.phoniex.demo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="users")
public class Users {
	
	    @Id
	    private int id;
	    private String email;
	    private String password;
	    private String name;
	    private String lastname;
		private String role;
	
	public Users() {
		// TODO Auto-generated constructor stub
	}
	
	
	 public Users(Users users) {
	        this.email = users.getEmail();
	        this.role=users.getRole();
	        this.name = users.getName();
	        this.lastname =users.getLastname();
	        this.id = users.getId();
	        this.password = users.getPassword();
	    }


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}





	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

	

}
