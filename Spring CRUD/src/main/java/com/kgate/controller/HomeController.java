package com.kgate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kgate.entity.Book;
import com.kgate.entity.Student;
import com.kgate.service.BookService;

@Controller
public class HomeController {

	@Autowired
	private BookService bookService;

	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView view = new ModelAndView("person");
		Book book = new Book();
		List<Book> lists = bookService.list();
		view.addObject("listsbook", lists);
		view.addObject("book", book);
		return view;
	}

	@PostMapping("/saveBook")
	public ModelAndView saveBook(@ModelAttribute("book") Book book) {
		ModelAndView view = new ModelAndView("person");
		long id = bookService.save(book);
		List<Book> lists = bookService.list();
		view.addObject("listsbook", lists);
		view.addObject("book", book);
		return view;
	}

	@GetMapping("/updateBook")
	public ModelAndView updateBook(@RequestParam("id") long id) {
		ModelAndView view = new ModelAndView("person");
		Book book = bookService.update2(id);
		List<Book> lists = bookService.list();
		view.addObject("listsbook", lists);
		view.addObject("book", book);
		return view;
	}

	@GetMapping("/deleteBook")
	public ModelAndView deleteBook(@RequestParam("id") long id) {
		ModelAndView view = new ModelAndView("person");
		bookService.delete(id);
		List<Book> lists = bookService.list();
		view.addObject("listsbook", lists);
		Book book = new Book();
		view.addObject("book", book);
		return view;
	}

	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView view = new ModelAndView("person");
		List<Book> lists = bookService.list();
		Book book = new Book();
		view.addObject("listsbook", lists);
		return view;
	}

	@GetMapping("/")
	public ModelAndView view() {
		Student student = new Student();
		ModelAndView view = new ModelAndView("home");
		view.addObject("student", student);
		return view;
	}

	@PostMapping("/save")
	public @ResponseBody Map<String, Object> getAll(@RequestBody Student student) {
		Map<String, Object> map = new HashMap<>();
		String fname = student.getFirstName();
		String lname = student.getLastName();
//		if (list != null) {
//			map.put("status", "200");
//			map.put("message", "Data found");
//			map.put("data", list);
//		} else {
//			map.put("status", "404");
//			map.put("message", "Data not found");
//
//		}
		System.out.println("check;;;;;;;;" + fname + ": " + lname);
		map.put("msg", "done");
		map.put("data", student);
		return map;
	}
}
