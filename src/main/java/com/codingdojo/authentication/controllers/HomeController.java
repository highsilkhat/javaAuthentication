package com.codingdojo.authentication.controllers;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.authentication.models.Book;
import com.codingdojo.authentication.models.LoginUser;
import com.codingdojo.authentication.models.User;
import com.codingdojo.authentication.services.BookService;
import com.codingdojo.authentication.services.UserService;

@Controller

public class HomeController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private BookService bookServ;
	
	@GetMapping("/")
	public String index(Model model)
	{
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") 
							User newUser,
							BindingResult result, 
							Model model, 
							HttpSession session)
	{
		userServ.register(newUser, result);
		
		if(result.hasErrors())
		{
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/home";
		
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin")
						LoginUser newLogin,
						BindingResult result,
						Model model,
						HttpSession session)
	{
		User user = userServ.login(newLogin, result);
		if(result.hasErrors())
		{
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String dashboard(HttpSession session,
							Model model) 
	{
		if(session.getAttribute("user_id") != null) {
			
			List<Book> allBooks = bookServ.allBooks();
			
			model.addAttribute("books", allBooks);
			
			User user = userServ.findUser((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			
			return "dashboard.jsp";
		}
		else 
		{
		return "redirect:/";
		}
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("user_id");
		return "redirect:/";
	}
}
