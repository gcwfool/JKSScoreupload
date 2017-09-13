package com.jxust.svsh.dao;

import java.util.List;

import org.hibernate.HibernateException;

import com.jxust.svsh.entity.Person;


public interface PersonDao extends BaseDao<Person> {

	public Person getPersonById(String id);	

	public List<Person> getPersonsBySchool(String school);
		
	public List<Person> getPersonByPage(int start, int pageSize, String school);
	
	public int getCount(String school);

	public boolean addPerson(Person person);

	public boolean updatePerson(Person person);
	
	public boolean deletePersonById(String id);
	
	public boolean deletePersonsById(String[] ids);
	
	public List<Person> getPersons();
}
