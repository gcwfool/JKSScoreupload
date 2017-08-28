package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Person;

@Repository
public class PersonDAO {

	@Resource
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Person getPersonById(String id) {
		return (Person) this.getSession().createQuery("from Person where id=?").setParameter(0, id).uniqueResult();
	}
	
	/**
	 * 根据学校查询
	 * @param school
	 * @return
	 */
	public Person getPersonBySchool(String school) {
		return (Person) this.getSession().createQuery("from Person where school=?").setParameter(0, school).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Person> getPersonByPage(int start, int pageSize, String school){
		String queryStr = "";
		Query query = null;
		if(!school.equals("请选择学校")) {
			queryStr = "from Person where school=?";
			query = this.getSession().createQuery(queryStr).setParameter(0, school);
		} else {
			queryStr = "from Person";
			query = this.getSession().createQuery(queryStr);
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
			count=((Long) this.getSession()
	                .createQuery(queryStr).setParameter(0, school).iterate().next()).intValue();
		} else {
			queryStr = "select count(*) from Person";
			count=((Long) this.getSession()
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
			this.getSession().saveOrUpdate(person);
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
			this.getSession().update(person);
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
		int count = this.getSession().createQuery("delete Person where id=?").setParameter(0, param).executeUpdate();
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
			count += this.getSession().createQuery("delete Person where id=?").setParameter(0, param).executeUpdate();
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
		return this.getSession().createCriteria(Person.class).list();
	}
}
