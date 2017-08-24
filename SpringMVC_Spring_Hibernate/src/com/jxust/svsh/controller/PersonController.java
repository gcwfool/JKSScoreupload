package com.jxust.svsh.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.util.JSONWrappedObject;
import com.jxust.svsh.entity.Person;
import com.jxust.svsh.service.PersonService;
import com.jxust.util.Common;
import com.jxust.util.ImportExcelUtil;


//import com.jxust.svsh.entity.Person;
/**
 * controller
 * @author Peng
 * @Date2016年12月9日上午11:25:40
 */
@SessionAttributes(value = "username")
@Controller
@RequestMapping(value = "/person")
public class PersonController {

	@Autowired
	public PersonService personService;

	/**
	 * 登录请求，失败返回error.jsp
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public String dologin(String username, String password, Map<String, Object> map) {
		if (username.equals("admin") && password.equals("admin")) {
			map.put("username", username);//存放在request请求域中
			/**
			 * 类上加上@SessionAttributes({"username"}) 同时也会存放在 session域中
			 * @SessionAttributes 除了可以通过属性名指定需要存放到会话中的属性外(使用的是value属性值)
			 * 还可以通过模型属性的对象类型指定哪些模型属性需要放到会话中(实际上使用的是types属性值),
			 */
			return "main";
		}
		return "error";
	}

	/**
	 * 保存添加的数据
	 * 
	 * @param person
	 * @return
	 */
	@RequestMapping(value = "/saveperson")
	public String saveperson(Person person) {
		personService.addPerson(person);
		return "redirect:main";
	}

	/**
	 * 跳转到添加页面
	 * savepage.jsp
	 * @return
	 */
	@RequestMapping(value = "/addperson")
	public String saveperson() {

		return "savepage";
	}

	/**
	 * 删除一条数据
	 * 
	 * @param id
	 * @return
	 */
/*	@RequestMapping(value = "/deletePersonById")
	public String deletePersonById(@RequestParam(value = "id") String id) {
		System.out.println("删除单个");
		personService.deletePersonById(id);
		return "redirect:main";
	}*/
	
	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public Map<String,Object> delete(@PathVariable("id") String id) {
		boolean res = personService.deletePersonById(id);
		
		
		Map<String, Object> param=new HashMap<String, Object>();
		
		if(res == true){
			param.put("status", 1);
		}else{
			param.put("status", 0);
		}
		
		return param;
	}
	
	
	

	/**
	 * 跳转到更新页面，回显数据
	 * editpage.jsp
	 * @param id
	 * @param model 使用的Model保存回显数据
	 * @return
	 */
	@RequestMapping(value = "/doupdate")
	public String doupdate(@RequestParam(value = "id") String id, Model model) {
		model.addAttribute("person", personService.getPersonById(id));
		return "editpage";
	}

	/**
	 * 更新数据
	 * 
	 * @param person
	 * @return
	 */
	@RequestMapping(value = "/updateperson")
	public String updateperson(Person person) {
		System.out.println(person.toString());
		personService.updatePerson(person);
		return "redirect:main";
	}

	/**
	 * 查询所有人员信息
	 * 
	 * @param map 使用的是map保存回显数据
	 * @return
	 */
	@RequestMapping(value = "/main")
	public String mian(Map<String, Object> map) {
		//map.put("personlist", personService.getPersons());
		/*遍历集合，查看查询到的数据
		 * List<Person> lists = personService.getPersons(); 
		 * Iterator<Person> it = lists.iterator(); 
		 * while(it.hasNext()){ 
		 * 		Person p =it.next();
		 *	 	System.out.println(p.toString());
		 *  }
		 */
		return "main";
	}
	
	/**
	 * 描述：通过传统方式form表单提交方式导入excel文件
	 * 
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value="/upload.do",method={RequestMethod.GET,RequestMethod.POST})  
    public  String  uploadExcel(HttpServletRequest request, Model model) throws Exception {  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        System.out.println("通过传统方式form表单提交方式导入excel文件！");  
          
        InputStream in =null;  
        List<List<Object>> listob = null;  
        MultipartFile file = multipartRequest.getFile("upfile");
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());  
        in.close();  
        String outputMsg = "";
        boolean success = true;
        
        List<Object> first = listob.get(0);
        if(first.size() < 10 || !first.get(0).equals("学号") || !first.get(1).equals("姓名") || !first.get(2).equals("语文") || 
        		!first.get(3).equals("数学") || !first.get(4).equals("英语") || !first.get(5).equals("物理") || 
        		!first.get(6).equals("化学") || !first.get(7).equals("思想品德") || !first.get(8).equals("历史") || 
        		!first.get(9).equals("地理") || !first.get(10).equals("生物") ) {
        	model.addAttribute("msg", "首行标题格式错误，请参照模板");
        	return "scoreerror";
        }
//        if(first.size() != 11) {
//        	throw new Exception("首行标题错误！");
//        }
          
        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
        for (int i = 1; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            String id = String.valueOf(lo.get(0));
            String name = String.valueOf(lo.get(1));
            String chinese = String.valueOf(lo.get(2));
            String math = String.valueOf(lo.get(3));
            String english = String.valueOf(lo.get(4));
            String physics = String.valueOf(lo.get(5));
            String chemistry = String.valueOf(lo.get(6));
            String sxpd = String.valueOf(lo.get(7));
            String history = String.valueOf(lo.get(8));
            String geography = String.valueOf(lo.get(9));
            String biology = String.valueOf(lo.get(10));
            String errorMsg = "";
            if(id.length() != 7 || !Common.isNumeric(id)) {
            	errorMsg += "第" + (i + 1) + "行学号格式错误";
            	errorMsg += "\n";
            	success = false;
            }
            
            if(name == null || name.length() == 0) {
            	System.out.println("第" + (i + 1) + "行名字不能为空");
            	errorMsg += "第" + (i + 1) + "行名字不能为空";
            	errorMsg += "\n";
            	success = false;
            }
            
            if(!Common.isNumeric(chinese)) {
            	System.out.println("第" + (i + 1) + "行语文分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行语文分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(chinese);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行语文分数超出范围");
            		errorMsg += "第" + (i + 1) + "行语文分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(math)) {
            	System.out.println("第" + (i + 1) + "行数学分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行数学分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(math);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行数学分数超出范围");
            		errorMsg += "第" + (i + 1) + "行数学分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(english)) {
            	System.out.println("第" + (i + 1) + "行英语分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行英语分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(english);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行英语分数超出范围");
            		errorMsg += "第" + (i + 1) + "行英语分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(physics)) {
            	System.out.println("第" + (i + 1) + "行物理分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行物理分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(physics);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行物理分数超出范围");
            		errorMsg += "第" + (i + 1) + "行物理分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(chemistry)) {
            	System.out.println("第" + (i + 1) + "行化学分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行化学分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(chemistry);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行化学分数超出范围");
            		errorMsg += "第" + (i + 1) + "行化学分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(sxpd)) {
            	System.out.println("第" + (i + 1) + "行思想品德分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行思想品德分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(sxpd);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行思想品德分数超出范围");
            		errorMsg += "第" + (i + 1) + "行思想品德分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(history)) {
            	System.out.println("第" + (i + 1) + "行历史分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行历史分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(history);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行历史分数超出范围");
            		errorMsg += "第" + (i + 1) + "行历史分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(geography)) {
            	System.out.println("第" + (i + 1) + "行地理分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行地理分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(geography);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行地理分数超出范围");
            		errorMsg += "第" + (i + 1) + "行地理分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!Common.isNumeric(biology)) {
            	System.out.println("第" + (i + 1) + "行生物分数只能是数字");
            	errorMsg += "第" + (i + 1) + "行生物分数只能是数字";
            	errorMsg += "\n";
            	success = false;
            }else {
            	int num = Integer.valueOf(biology);
            	if(num < 0 || num > 100) {
            		System.out.println("第" + (i + 1) + "行生物分数超出范围");
            		errorMsg += "第" + (i + 1) + "行生物分数超出范围";
                	errorMsg += "\n";
            		success = false;
            	}
            }
            
            if(!success) {
            	model.addAttribute("msg", errorMsg);
            	return "scoreerror";
            }

            try {
            	personService.addPerson(new Person(Integer.valueOf(id), name, Integer.valueOf(chinese), Integer.valueOf(math)
            			, Integer.valueOf(english), Integer.valueOf(physics),Integer.valueOf(chemistry),Integer.valueOf(sxpd),
            			Integer.valueOf(history), Integer.valueOf(geography), Integer.valueOf(biology)));
            } catch (Exception e){
            	System.out.println("第" + (i + 1) + "行插入错误");
            	return "scoreerror";
            }
        }
        
        System.out.print(outputMsg);
        
        return "scoremanager"; 
    }
	
	@RequestMapping(value = "/createName.do")
	public void createName() {
		String[] firsname = { "赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈",
				"楮", "卫", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许", "何", "吕",
				"施", "张", "孔", "曹", "严", "华", "金", "魏", "陶", "姜", "戚", "谢",
				"邹", "喻", "柏", "水", "窦", "章", "云", "苏", "潘", "葛", "奚", "范",
				"彭", "郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任",
				"袁", "柳", "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺",
				"倪", "汤", "滕", "殷", "罗", "毕", "郝", "邬", "安", "常", "乐", "于",
				"时", "傅", "皮", "卞", "齐", "康", "伍", "余", "元", "卜", "顾", "孟",
				"平", "黄", "和", "穆", "萧", "尹", "姚", "邵", "湛", "汪", "祁", "毛",
				"禹", "狄", "米", "贝", "明", "臧", "计", "伏", "成", "戴", "谈", "宋",
				"茅", "庞", "熊", "纪", "舒", "屈", "项", "祝", "董", "梁", "杜", "阮",
				"蓝", "闽", "席", "季", "麻", "强", "贾", "路", "娄", "危", "江", "童",
				"颜", "郭", "梅", "盛", "林", "刁", "锺", "徐", "丘", "骆", "高", "夏",
				"蔡", "田", "樊", "胡", "凌", "霍", "虞", "万", "支", "柯", "昝", "管",
				"卢", "莫", "经", "房", "裘", "缪", "干", "解", "应", "宗", "丁", "宣",
				"贲", "邓", "郁", "单", "杭", "洪", "包", "诸", "左", "石", "崔", "吉",
				"钮", "龚", "程", "嵇", "邢", "滑", "裴", "陆", "荣", "翁", "荀", "羊",
				"於", "惠", "甄", "麹", "家", "封", "芮", "羿", "储", "靳", "汲", "邴",
				"糜", "松", "井", "段", "富", "巫", "乌", "焦", "巴", "弓", "牧", "隗",
				"山", "谷", "车", "侯", "宓", "蓬", "全", "郗", "班", "仰", "秋", "仲",
				"伊", "宫", "宁", "仇", "栾", "暴", "甘", "斜", "厉", "戎", "祖", "武",
				"符", "刘", "景", "詹", "束", "龙", "叶", "幸", "司", "韶", "郜", "黎",
				"蓟", "薄", "印", "宿", "白", "怀", "蒲", "邰", "从", "鄂", "索", "咸",
				"籍", "赖", "卓", "蔺", "屠", "蒙", "池", "乔", "阴", "郁", "胥", "能",
				"苍", "双", "闻", "莘", "党", "翟", "谭", "贡", "劳", "逄", "姬", "申",
				"扶", "堵", "冉", "宰", "郦", "雍", "郤", "璩", "桑", "桂", "濮", "牛",
				"寿", "通", "边", "扈", "燕", "冀", "郏", "浦", "尚", "农", "温", "别",
				"庄", "晏", "柴", "瞿", "阎", "充", "慕", "连", "茹", "习", "宦", "艾",
				"鱼", "容", "向", "古", "易", "慎", "戈", "廖", "庾", "终", "暨", "居",
				"衡", "步", "都", "耿", "满", "弘", "匡", "国", "文", "寇", "广", "禄",
				"阙", "东", "欧", "殳", "沃", "利", "蔚", "越", "夔", "隆", "师", "巩",
				"厍", "聂", "晁", "勾", "敖", "融", "冷", "訾", "辛", "阚", "那", "简",
				"饶", "空", "曾", "毋", "沙", "乜", "养", "鞠", "须", "丰", "巢", "关",
				"蒯", "相", "查", "后", "荆", "红", "游", "竺", "权", "逑", "盖", "益",
				"桓", "公", "万俟", "司马", "上官", "欧阳", "夏侯", "诸葛", "闻人", "东方", "赫连",
				"皇甫", "尉迟", "公羊", "澹台", "公冶", "宗政", "濮阳", "淳于", "单于", "太叔",
				"申屠", "公孙", "仲孙", "轩辕", "令狐", "锺离", "宇文", "长孙", "慕容", "鲜于",
				"闾丘", "司徒", "司空", "丌官", "司寇", "仉", "督", "子车", "颛孙", "端木", "巫马",
				"公西", "漆雕", "乐正", "壤驷", "公良", "拓拔", "夹谷", "宰父", "谷梁", "晋", "楚",
				"阎", "法", "汝", "鄢", "涂", "钦", "段干", "百里", "东郭", "南门", "呼延",
				"归", "海", "羊舌", "微生", "岳", "帅", "缑", "亢", "况", "后", "有", "琴",
				"梁丘", "左丘", "东门", "西门", "商", "牟", "佘", "佴", "伯", "赏", "南宫",
				"墨", "哈", "谯", "笪", "年", "爱", "阳", "佟" };
				String[] namelist = { "伟", "伟", "芳", "伟", "秀英", "秀英", "娜", "秀英", "伟",
				"敏", "静", "丽", "静", "丽", "强", "静", "敏", "敏", "磊", "军", "洋",
				"勇", "勇", "艳", "杰", "磊", "强", "军", "杰", "娟", "艳", "涛", "涛",
				"明", "艳", "超", "勇", "娟", "杰", "秀兰", "霞", "敏", "军", "丽", "强",
				"平", "刚", "杰", "桂英", "芳", "嘉懿", "煜城", "懿轩", "烨伟", "苑博", "伟泽",
				"熠彤", "鸿煊", "博涛", "烨霖", "烨华", "煜祺", "智宸", "正豪", "昊然", "明杰",
				"立诚", "立轩", "立辉", "峻熙", "弘文", "熠彤", "鸿煊", "烨霖", "哲瀚", "鑫鹏",
				"致远", "俊驰", "雨泽", "烨磊", "晟睿", "天佑", "文昊", "修洁", "黎昕", "远航",
				"旭尧", "鸿涛", "伟祺", "荣轩", "越泽", "浩宇", "瑾瑜", "皓轩", "擎苍", "擎宇",
				"志泽", "睿渊", "楷瑞", "子轩", "弘文", "哲瀚", "雨泽", "鑫磊", "修杰", "伟诚",
				"建辉", "晋鹏", "天磊", "绍辉", "泽洋", "明轩", "健柏", "鹏煊", "昊强", "伟宸",
				"博超", "君浩", "子骞", "明辉", "鹏涛", "炎彬", "鹤轩", "越彬", "风华", "靖琪",
				"明诚", "高格", "光华", "国源", "冠宇", "晗昱", "涵润", "翰飞", "翰海", "昊乾",
				"浩博", "和安", "弘博", "宏恺", "鸿朗", "华奥", "华灿", "嘉慕", "坚秉", "建明",
				"金鑫", "锦程", "瑾瑜", "晋鹏", "经赋", "景同", "靖琪", "君昊", "俊明", "季同",
				"开济", "凯安", "康成", "乐语", "力勤", "良哲", "理群", "茂彦", "敏博", "明达",
				"朋义", "彭泽", "鹏举", "濮存", "溥心", "璞瑜", "浦泽", "奇邃", "祺祥", "荣轩",
				"锐达", "睿慈", "绍祺", "圣杰", "晟睿", "思源", "斯年", "泰宁", "天佑", "同巍",
				"奕伟", "祺温", "文虹", "向笛", "心远", "欣德", "新翰", "兴言", "星阑", "修为",
				"旭尧", "炫明", "学真", "雪风", "雅昶", "阳曦", "烨熠", "英韶", "永贞", "咏德",
				"宇寰", "雨泽", "玉韵", "越彬", "蕴和", "哲彦", "振海", "正志", "子晋", "自怡",
				"德赫", "君平" };
				Random random = new Random();
				int id = 1000001;
				for(int i = 0; i < 100; ++i) {
					String name = firsname[i] + namelist[i];
					int chinese = random.nextInt(101);
					int math = random.nextInt(101);
					int eng = random.nextInt(101);
					int phy = random.nextInt(101);
					int che = random.nextInt(101);
					int sxpd = random.nextInt(101);
					int his = random.nextInt(101);
					int geo = random.nextInt(101);
					int bio = random.nextInt(101);
					Person person = new Person(id, name, chinese, math, eng, phy, che, sxpd, his, geo, bio);
					personService.addPerson(person);
					id++;
				}
	}
	
	
	@RequestMapping(value = "/scoremanager")
	public String scoremanager(){
        return "scoremanager";
	}
	
	@RequestMapping(value = "/authoritymanager")
	public String authoritymanager(){
        return "authoritymanager";
	}
	
	@RequestMapping(value = "/kaoshiinfo")
	public String kaoshiinfo(){
        return "kaoshiinfo";
	}
	
	@RequestMapping(value = "/kemumanager")
	public String kemumanager(){
        return "kemumanager";
	}
	
	@RequestMapping(value = "/logmanager")
	public String logmanager(){
        return "logmanager";
	}
	
	
	@RequestMapping(value = "/personalmanager")
	public String personalmanager(){
        return "personalmanager";
	}
	
	
	@RequestMapping(value = "/usermanager")
	public String usermanager(){
        return "usermanager";
	}
	
	@RequestMapping(value = "/changepassword")
	public String changepassword(){
        return "changepassword";
	}
	
	@RequestMapping(value = "/details")
	@ResponseBody
	public Map<String,Object> selectByFy(int draw,int start,int length){
        /*所需参数*/
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Person> persons = personService.getPersonByPage(start, length);
		
		int total = persons.size();
		map.put("recordsFiltered", length);
		map.put("recordsTotal", total);
		map.put("draw", draw);
		map.put("data", persons);
		return map;
	}
	
	private List<Map<String, Object>> createExcelRecord(List<Person> projects) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "sheet1");
		listmap.add(map);
		Person project = null;
		for (int j = 0; j < projects.size(); j++) {
			project = projects.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("id", project.getId());
			mapValue.put("name", project.getName());
			mapValue.put("chinese", project.getChinese());
			mapValue.put("math", project.getMath());
			mapValue.put("english", project.getEnglish());
			mapValue.put("physics", project.getPhysics());
			mapValue.put("chemistry", project.getChemistry());
			mapValue.put("sxpd", project.getSxpd());
			mapValue.put("history", project.getHistory());
			mapValue.put("geography", project.getGeography());
			mapValue.put("biology", project.getBiology());
			listmap.add(mapValue);
		}
		return listmap;
	}
	
	@RequestMapping(value = "/export.do")
	public String download(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String fileName = "excel文件";
		// 填充projects数据
		List<Person> projects = personService.getPersons();
		List<Map<String, Object>> list = createExcelRecord(projects);
		String columnNames[] = { "学号", "姓名", "语文", "数学", "英语", "物理", "化学", "思想品德", "历史"
				, "地理", "生物"};// 列名
		String keys[] = { "id", "name", "chinese", "math", "english", "physics", "chemistry", "sxpd"
				, "history", "geography", "biology"};// map中的key
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		try {
			ImportExcelUtil.createWorkBook(list, keys, columnNames).write(os);
		} catch (IOException e) {
			e.printStackTrace();
		}
		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
		ServletOutputStream out = response.getOutputStream();
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(out);
			byte[] buff = new byte[2048];
			int bytesRead;
			// Simple read/write loop.
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			throw e;
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
		return "scoremanager";
	}
		
}
