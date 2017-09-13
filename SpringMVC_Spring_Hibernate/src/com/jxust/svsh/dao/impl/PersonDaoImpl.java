package com.jxust.svsh.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.dao.PersonDao;
import com.jxust.svsh.entity.Person;

@Repository("personDao")
public class PersonDaoImpl extends BaseDaoImpl<Person> implements PersonDao {

	public Person getPersonById(String id) {
		return (Person) this.getCurrentSession().createQuery("from Person where id=?").setParameter(0, id).uniqueResult();
	}
	
	/**
	 * 根据学校查询
	 * @param school
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Person> getPersonsBySchool(String school) {
		String queryStr = "from Person where school=?";
		Query query = this.getCurrentSession().createQuery(queryStr).setParameter(0, school);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Person> getPersonByPage(int start, int pageSize, String school){
		String queryStr = "";
		Query query = null;
		if(!school.equals("请选择学校")) {
			queryStr = "from Person where school=?";
			query = this.getCurrentSession().createQuery(queryStr).setParameter(0, school);
		} else {
			queryStr = "from Person";
			query = this.getCurrentSession().createQuery(queryStr);
		}
				
		query.setFirstResult(start) ;
		query.setMaxResults(pageSize); 
		
		return query.list();
	}
	
	public int getCount(String school){
		String queryStr = "select count(*) from Person where school=?";
		int count = 0;
		if(!school.equals("请选择学校")) {
			queryStr = "select count(*) from Person where school=?";
			count=((Long) this.getCurrentSession()
	                .createQuery(queryStr).setParameter(0, school).iterate().next()).intValue();
		} else {
			queryStr = "select count(*) from Person";
			count=((Long) this.getCurrentSession()
	                .createQuery(queryStr).iterate().next()).intValue();
		}
		
        return count;
	}
	
	/**
	 * 添加
	 * @param person
	 */
	public boolean addPerson(Person person) {
		//this.getSession().save(person);
		
		
		try{
			this.getCurrentSession().saveOrUpdate(person);
			return true;
		}catch(HibernateException e){
			return false;
		}
		
	}
	/**
	 * 更新
	 * @param person
	 */
	public boolean updatePerson(Person person) {
		
		try{
			this.getCurrentSession().update(person);
			return true;
		}catch(HibernateException e){
			return false;
		}
		
		
	}
	/**
	 * 删除
	 * @param id
	 */
	public boolean deletePersonById(String id) {
		int param = Integer.parseInt(id);
		int count = this.getCurrentSession().createQuery("delete Person where id=?").setParameter(0, param).executeUpdate();
		if(count == 0){
			return false;
		}else{
			return true;
		}
	}
	
	public boolean deletePersonsById(String[] ids) {
		
		int count = 0;
		
		for(int i = 0; i < ids.length; i++){
			int param = Integer.parseInt(ids[i]);
			count += this.getCurrentSession().createQuery("delete Person where id=?").setParameter(0, param).executeUpdate();
		}
		

		if(count == ids.length){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Person> getPersons() {
		return this.getCurrentSession().createCriteria(Person.class).list();
	}
}
