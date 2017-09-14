package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户实体类
 * 注解方式配置对应数据表
 * @author Lin
 */
@Entity
@Table(name = "user")
public class User {
	private String account;// 主键acount
	private String password;
	private String phone;// 姓名
	private String name;
	private String school;

	

	/*	private String phone;// 手机号
	private String address;// 地址
*/
	public User() {
		super();
	}
	
	public User(String account, String password, String phone, String name,
			String school) {
		super();
		this.account = account;
		this.password = password;
		this.phone = phone;
		this.name = name;
		this.school = school;
	}

	@Id
	@Column(name = "account", nullable = false, unique = true)
//	@GenericGenerator(name = "generator", strategy = "uuid")
//	@GeneratedValue(generator = "generator")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Column(name = "password", nullable = false, length = 32)
	public String getPwd() {
		return password;
	}

	public void setPwd(String password) {
		this.password = password;
	}

	@Column(name = "phone", nullable = false, length = 32)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "name", nullable = false, length = 32)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "school", nullable = false, length = 32)
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}
	
	@Override
	public String toString() {
		return "User [account=" + account + ", password=" + password + ", name=" + name + ", school=" + school + "]";
	}

}
