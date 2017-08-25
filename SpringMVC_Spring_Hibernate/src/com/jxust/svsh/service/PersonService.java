package com.jxust.svsh.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.PersonDAO;
import com.jxust.svsh.entity.Person;

@Transactional
@Service
public class PersonService {

	@Autowired
	public PersonDAO personDAO;
	
	/**
	 * 添加
	 * @param person
	 */
	public boolean addPerson(Person person) {
		return personDAO.addPerson(person);
	}
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Person getPersonById(String id){
		return personDAO.getPersonById(id);
	}
	
	public List<Person> getPersonByPage(int start, int pageSize){
		return personDAO.getPersonByPage(start, pageSize);
	}
	
	/**
	 * 更新
	 * @param person
	 */
	public boolean updatePerson(Person person) {
		return personDAO.updatePerson(person);
	}
	/**
	 * 删除
	 * @param id
	 */
	public boolean deletePersonById(String  id) {
		return personDAO.deletePersonById(id);
		
	}
	
	
	public boolean deletePersonsById(String[]  ids) {
		return personDAO.deletePersonsById(ids);
		
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Person> getPersons() {
		return personDAO.getPersons();
	}
	
	public int getCount(){
		return personDAO.getCount();
	}
}
