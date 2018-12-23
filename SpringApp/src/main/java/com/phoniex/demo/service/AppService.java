package com.phoniex.demo.service;

import java.util.ArrayList;
import java.util.Arrays;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.phoniex.demo.beans.Student;

@Service
public class AppService {

	
	public Student DisplayOne(String id)
	{
		RestTemplate template=new RestTemplate();
		String url="http://localhost:8081/SpringDemo-0.0.1-SNAPSHOT/app/student/"+id;
		return template.getForObject(url, Student.class);
	}

	public ArrayList<Student> AllStudent() {
		RestTemplate template=new RestTemplate();
		String url="http://localhost:8081/SpringDemo-0.0.1-SNAPSHOT/app/allstudent/";
		ArrayList<Student> studentList= new ArrayList<>();
		studentList.addAll(Arrays.asList(template.getForObject(url, Student[].class)));
		return studentList;
	}

	public void Insert(Student student) {
		RestTemplate template=new RestTemplate();
		String url="http://localhost:8081/SpringDemo-0.0.1-SNAPSHOT/app/insert/";
		template.postForObject(url, student, String.class);
	}

	public void Update(Student student) {
		RestTemplate template=new RestTemplate();
		String url="http://localhost:8081/SpringDemo-0.0.1-SNAPSHOT/app/update/";
		template.postForObject(url, student, String.class);
	}

	public void Delete(String id) {
		RestTemplate template=new RestTemplate();
		String url="http://localhost:8081/SpringDemo-0.0.1-SNAPSHOT/app/student/delete/"+id;
		template.delete(url);
	}
	
	
	
}
