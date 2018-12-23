package com.phoniex.demo.controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.phoniex.demo.beans.Student;
import com.phoniex.demo.service.AppService;

@Controller
public class SpringController {

	@Autowired
	AppService appService;
	
	 @PreAuthorize("hasAnyRole('ADMIN')")
	 @RequestMapping(value="/index",method=RequestMethod.GET)
	  public String index() {
		 return "index";
	  }
	 
	
	 @RequestMapping(value="/error",method=RequestMethod.GET)
	  public String Error() {
		 return "<h3>Something Went Wrong!!!</h3>";
	  }
	
	 @RequestMapping(value="/id",method=RequestMethod.GET)
	  public ModelAndView GetStudent(HttpServletRequest request) {
		 Student student=appService.DisplayOne(request.getParameter("id"));
		 return new ModelAndView("profile", "student", student);
	  }
	 
	 @RequestMapping(value="/all",method=RequestMethod.GET)
	  public @ResponseBody ArrayList<Student> GetAllStudent() {
		 return appService.AllStudent();
	  }
	 
	 @RequestMapping(value="/updateid",method=RequestMethod.GET)
	  public @ResponseBody Student UpdateId(@RequestParam("id") String id) {
		 return appService.DisplayOne(id);
	  }
	 
	 @RequestMapping(value="/insert",method=RequestMethod.POST)
	  public @ResponseBody void InsertStudent(@RequestBody Student student) {
		 appService.Insert(student);
	  }
	 
	 @RequestMapping(value="/update",method=RequestMethod.POST)
	  public @ResponseBody void UpdateStudent(@RequestBody Student student) {
		 appService.Update(student);
	  }
	 
	 @RequestMapping(value="/delete",method=RequestMethod.GET)
	  public @ResponseBody void DeleteId(@RequestParam("id") String id) {
		 appService.Delete(id);
	  }
	 
}
