package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.TodoDao;
import com.entities.ToDo;

@Controller
public class HomeCtrl {

	@Autowired
	ServletContext context;

	@Autowired
	TodoDao todoDao;

	@RequestMapping(value = "/home")
	public String home(Model m) {
		m.addAttribute("page", "home");

		List<ToDo> list = this.todoDao.getAll();
		m.addAttribute("todos", list);

		return "home";

	}

	@RequestMapping(value = "/add")
	public String addToDo(Model m) {
		ToDo t = new ToDo();
		m.addAttribute("page", "add");
		m.addAttribute("todo", t);

		return "home";
	}

	@RequestMapping(value = "/saveToDo", method = RequestMethod.POST)
	public String saveToDo(@ModelAttribute("todo") ToDo t, Model m) {
		m.addAttribute("page", "home");

		System.out.println(t);
		t.setTodoDate(new Date());
		this.todoDao.save(t);

		/*
		 * // Without DataBase // get todo list from context List<ToDo> list =
		 * (List<ToDo>) context.getAttribute("list"); list.add(t);
		 */

		// with DataBase

		m.addAttribute("msg", "successfully added....");

		return "home";
	}

}
