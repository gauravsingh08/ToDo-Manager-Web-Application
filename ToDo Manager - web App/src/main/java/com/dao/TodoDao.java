package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.ToDo;

@Component
public class TodoDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public int save(ToDo t) {
		Integer i = (Integer) this.hibernateTemplate.save(t);
		return i;
	}

	public List<ToDo> getAll() {
		List<ToDo> list = this.hibernateTemplate.loadAll(ToDo.class);
		return list;
	}

}
