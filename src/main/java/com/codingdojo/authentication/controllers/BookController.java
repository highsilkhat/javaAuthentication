package com.codingdojo.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.authentication.models.Book;
import com.codingdojo.authentication.models.User;
import com.codingdojo.authentication.services.BookService;
import com.codingdojo.authentication.services.UserService;

@Controller

public class BookController {
	
	@Autowired
	BookService bookServ;
	
	@Autowired
	UserService userServ;
	
	@RequestMapping("/books/new")
	public String bookForm(@ModelAttribute Book book,
							HttpSession session,
							Model model)
	{
		if(session.getAttribute("user_id") != null) {
			
			User user = userServ.findUser((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			
			return "/books/form.jsp";
		}
		else 
		{
		return "redirect:/";
		}
		
	}
	
	@PostMapping("/book/post")
	public String postBook(@Valid
							@ModelAttribute("book")
							Book book,
							BindingResult result)
	{
		if (result.hasErrors()) {
			return "/books/form.jsp";
		} else {
			bookServ.createBook(book);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/books/{id}")
	public String showBook(@PathVariable("id") Long id, 
							Model model,
							HttpSession session)
	{
	
	model.addAttribute("user_id", session.getAttribute("user_id"));
	
	Book book = bookServ.findBook(id);

	model.addAttribute("book", book);

	return "/books/show.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String edit(@PathVariable("id") 
						Long id, 
						Model model) 
	{
		Book book = bookServ.findBook(id);
		
		model.addAttribute("book", book);
		
		return "/books/edit.jsp";
	}
	
	@PutMapping("/books/{id}")
	public String update(@Valid
						@ModelAttribute("book") 
						Book book, 
						BindingResult result,
						Model model)
	{
		if (result.hasErrors()) 
		{
			model.addAttribute("newBook", new Book());
			return "/books/edit.jsp";
		}	else {
			
			book = bookServ.updateBook(book);
			return "redirect:/home";
			
		}
	}
	
	
	

}
