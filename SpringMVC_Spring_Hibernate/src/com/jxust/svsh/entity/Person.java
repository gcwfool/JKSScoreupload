package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 个人信息实体类
 * 注解方式配置对应数据表
 * @author Peng
 * @Date2016年12月8日下午2:54:52
 */
@Entity
@Table(name = "student")
public class Person {

	

	private int id;// 主键id
	private String name;// 姓名
	private int chinese;
	private int math;
	private int english;
	private int physics;
	private int chemistry;
	private int sxpd;
	private int history;
	private int geography;
	private int biology;
	
	


	/*	private String phone;// 手机号
	private String address;// 地址
*/
	public Person() {
		super();
	}
	
	public Person(int id, String name, int chinese, int math, int english,
			int physics, int chemistry, int sxpd, int history, int geography,
			int biology) {
		super();
		this.id = id;
		this.name = name;
		this.chinese = chinese;
		this.math = math;
		this.english = english;
		this.physics = physics;
		this.chemistry = chemistry;
		this.sxpd = sxpd;
		this.history = history;
		this.geography = geography;
		this.biology = biology;
	}

	@Id
	@Column(name = "id", nullable = false, unique = true)
//	@GenericGenerator(name = "generator", strategy = "uuid")
//	@GeneratedValue(generator = "generator")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false, length = 32)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "chinese", nullable = false)
	public int getChinese() {
		return chinese;
	}

	public void setChinese(int chinese) {
		this.chinese = chinese;
	}

	@Column(name = "math", nullable = false, length = 32)
	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	@Column(name = "english", nullable = false)
	public int getEnglish() {
		return english;
	}
	
	public void setEnglish(int english) {
		this.english = english;
	}

	@Column(name = "physics", nullable = false)
	public int getPhysics() {
		return physics;
	}

	public void setPhysics(int physics) {
		this.physics = physics;
	}

	@Column(name = "chemistry", nullable = false)
	public int getChemistry() {
		return chemistry;
	}

	public void setChemistry(int chemistry) {
		this.chemistry = chemistry;
	}

	@Column(name = "sxpd", nullable = false)
	public int getSxpd() {
		return sxpd;
	}

	public void setSxpd(int sxpd) {
		this.sxpd = sxpd;
	}

	@Column(name = "history", nullable = false)
	public int getHistory() {
		return history;
	}

	public void setHistory(int history) {
		this.history = history;
	}

	@Column(name = "geography", nullable = false)
	public int getGeography() {
		return geography;
	}

	public void setGeography(int geography) {
		this.geography = geography;
	}

	@Column(name = "biology", nullable = false)
	public int getBiology() {
		return biology;
	}

	public void setBiology(int biology) {
		this.biology = biology;
	}
	
	@Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", chinese=" + chinese + ", math=" + math + 
				", english=" + english + ", physics=" + physics + ", chemistry=" + chemistry
				+ ", sxpd=" + sxpd + ", history=" + history + ", geography=" + geography + ", biology="
				+ biology +"]";
	}

}
