package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Person;

@Repository
public class PersonDAO {

	@Resource
	private SessionFactory sessionFactory;
	
	private int count = 0;

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
	
	@SuppressWarnings("unchecked")
	public List<Person> getPersonByPage(int start, int pageSize){
		
		String queryStr = "from Person";
		Query query = this.getSession().createQuery(queryStr);
		
		count = query.list().size();
		
		query.setFirstResult(start) ;
		query.setMaxResults(pageSize); 
		//System.out.println(query.list());
		return query.list();
	}
	
	public int getCount(){
		return count;
	}
	
	
	/**
	 * 添加
	 * @param person
	 */
	public void addPerson(Person person) {
		//this.getSession().save(person);
		this.getSession().saveOrUpdate(person);
	}
	/**
	 * 更新
	 * @param person
	 */
	public void updatePerson(Person person) {
		this.getSession().update(person);
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
	
	
	
	/**
	 * 查询所有
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Person> getPersons() {
		return this.getSession().createCriteria(Person.class).list();
	}
}
