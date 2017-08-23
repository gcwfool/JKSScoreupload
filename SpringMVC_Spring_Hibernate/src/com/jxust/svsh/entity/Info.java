package com.jxust.svsh.entity;


//将Excel每一行数值转换为对象  
public class Info {  
    
  private String id;  
  private String name;  
  private String chinese;  
  private String math;
  
  public Info() {
	  
  }

public String getIdCard() {
	return id;
}

public void setIdCard(String idCard) {
	this.id = idCard;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getChinese() {
	return chinese;
}

public void setChinese(String chinese) {
	this.chinese = chinese;
}

public String getMath() {
	return math;
}

public void setMath(String math) {
	this.math = math;
}
    
  
}  

