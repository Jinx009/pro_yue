package main.entry.webapp.data;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.helper.ConstantUtil;
import common.helper.HttpWebIOHelper;
import database.models.UserA;
import database.models.UserConnA;
import service.basicFunctions.UserAService;
import service.basicFunctions.UserConnAService;

@Controller
public class UserController {

	@Autowired
	private UserAService userAService;
	@Autowired
	private UserConnAService userConnAService;

	private Map<String, Object> data;

	/*
	 * 根据用户id获取用户信息
	 */
	@RequestMapping(value = "/data/user/byId")
	public void userList(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		UserA user = userAService.findById(id);

		data = new HashMap<String, Object>();
		data.put(ConstantUtil.CODE, ConstantUtil.CODE_RIGHT);
		data.put(ConstantUtil.MSG, "根据id取用户");
		data.put(ConstantUtil.DATA, user);

		HttpWebIOHelper._printWebJson(data, response);
	}

	/*
	 * 排行榜
	 */
	@RequestMapping(value = "/front/getStars")
	public void getStars(HttpServletResponse response, HttpServletRequest request) throws IOException {
		List<UserA> list = userAService.getByHql(" FROM UserA WHERE realName != ''AND realName is not null ORDER BY star_num DESC ");
		int _nv = 0;
		int _nan = 0;
		List<UserA> res = new ArrayList<UserA>();
		for(UserA userA:list){
			if(_nan<10&&userA.getSex().equals("男")){
				res.add(userA);
				_nan++;
			}
			if(_nv<10&&userA.getSex().equals("女")){
				res.add(userA);
				_nv++;
			}
		}
		data = new HashMap<String, Object>();
		data.put(ConstantUtil.CODE, ConstantUtil.CODE_RIGHT);
		data.put(ConstantUtil.DATA, res);

		HttpWebIOHelper._printWebJson(data, response);
	}

	/*
	 * 登录
	 */
	@RequestMapping(value = "/doLogin")
	public void doLogin(HttpServletResponse response, HttpServletRequest request) throws IOException {
		data = new HashMap<String, Object>();
		data.put("status", "fail");

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		if ("admin".equals(userName) && "admin".equals(password)) {
			data.put("status", "success");
			request.getSession().setAttribute("sessionUser", "success");
		}

		HttpWebIOHelper._printWebJson(data, response);
	}

	/**
	 * 获取全部用户
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/getAllUserList")
	public void allUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String qrcode = request.getParameter("qrcode");
		String hql = " FROM UserA WHERE qrcode = '" + qrcode + "' AND realName is not null";
		List<UserA> list = userAService.getByHql(hql);

		data = new HashMap<String, Object>();
		data.put("status", "success");
		data.put("data", list);
		if(list!=null&&!list.isEmpty()){
			data.put("size", list.size());
		}else{
			data.put("size", 0);
		}

		HttpWebIOHelper._printWebJson(data, response);
	}

	/**
	 * 获取可以筛选用户列表
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/getUserList")
	public void getUserList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		UserA nowUser = userAService.findById(id);
		String hql2 = " FROM  UserConnA WHERE first = " + id + " or (likeUser.id = " + id
				+ " and status!=0  and status !=3 )  ";
		List<UserConnA> list2 = userConnAService.getByHql(hql2);
		ArrayList<Integer> ids = new ArrayList<Integer>();
		String sex = "男";
		if ("男".equals(nowUser.getSex())) {
			sex = "女";
		} else {
			sex = "男";
		}
		ids.add(id);
		if (null != list2) {
			for (UserConnA userConn : list2) {
				UserA user = userConn.getUser();
				UserA likeUser = userConn.getLikeUser();
				if (user.getId().equals(id)) {
					ids.add(likeUser.getId());
				} else
					ids.add(user.getId());
			}
		}
		String idss = "";
		if (ids != null && ids.size() > 0) {
			for (int i = 0; i < ids.size(); i++) {
				idss += ids.get(i) + ",";
			}
			idss = idss.substring(0, idss.length() - 1);
		}
		String hql = " FROM UserA WHERE id not in(" + idss + ") and sex = '" + sex
				+ "' and status =1 AND addTime>'2015-05-13' ";
		System.out.println(hql);
		List<UserA> list = userAService.getByHql(hql);
		List<UserA> list3 = new ArrayList<UserA>();
		if (list != null && list.size() > 20) {
			for (int i = 0; i < 20; i++) {
				list3.add(list.get(i));
			}
		} else {
			list3 = list;
		}
		data = new HashMap<String, Object>();
		data.put("status", "success");
		data.put("data", list3);

		HttpWebIOHelper._printWebJson(data, response);
	}

	/**
	 * 上传个人信息
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/saveInfo")
	public void saveInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// realName searcher num age address job likes request zodiac edu tag
		// info
		data = new HashMap<String, Object>();
		System.out.println("进入者姓名：" + request.getParameter("realName"));
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		UserA user = userAService.findById(userId);
		user.setRealName(request.getParameter("realName"));
		user.setSex(request.getParameter("sex"));
		user.setNum("");
		user.setAge(request.getParameter("age"));
		user.setAddress(request.getParameter("address"));
		user.setJobInfo(request.getParameter("job"));
		user.setLikes(request.getParameter("likes"));
		user.setRequest(request.getParameter("request"));
		user.setZodiac(request.getParameter("zodiac"));
		user.setEdu(request.getParameter("edu"));
		user.setTag(request.getParameter("tag"));
		user.setDanwei(request.getParameter("danwei"));
		user.setWechatAccount(request.getParameter("wechatAccount"));
		user.setInfo(request.getParameter("info"));
		user.setPic1(request.getParameter("pic1"));
		user.setPic2(request.getParameter("pic2"));
		user.setPic3(request.getParameter("pic3"));
		user.setMobilePhone(request.getParameter("mobilePhone"));
		user.setStatus(1);

		userAService.update(user);
		request.getSession().setAttribute("name", user.getRealName());
		request.getSession().setAttribute("pic", user.getPic1());
		data.put("status", "success");
		data.put("data", "信息上传成功");

		HttpWebIOHelper._printWebJson(data, response);

	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
