package main.entry.webapp.data;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.helper.HttpWebIOHelper;
import common.wechat.WechatData;
import database.models.QRCode;
import service.basicFunctions.QRCodeService;

@Controller
public class QRCodeDataController {
	
	@Autowired
	private QRCodeService QRCodeService;

	/**
	 * 获取当前所有现成二维码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/QRCodeList")
	public void QRCodeList(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String,Object> data = new HashMap<String,Object>();
		List<QRCode> list = QRCodeService.findAll();
		data.put("status","success");
		data.put("data",list);
		HttpWebIOHelper._printWebJson(data, response);
	}
	
	/**
	 * 保存二维码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/saveQRCode")
	public void saveQRCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String,Object> data = new HashMap<String,Object>();
		String key = request.getParameter("key");
		String desc = request.getParameter("desc");
		String url = WechatData.OAUTH_URL_TWO+"/q.html?key="+key;
		String realUrl = WechatData.OAUTH_URL_ONE+WechatData.OAUTH_URL_TWO+"/index.html?qKey="+key+WechatData.OAUTH_URL_THREE;
		QRCode qrCode = QRCodeService.findByKey(key);
		if(qrCode!=null){
			data.put("status","fail");
			data.put("data","该关键字已经存在！");
		}else{
			qrCode = new QRCode();
			qrCode.setCreateTime(new Date());
			qrCode.setKeyword(key);
			qrCode.setRealUrl(realUrl);
			qrCode.setUrl(url);
			qrCode.setDescription(desc);
			QRCodeService.save(qrCode);
			data.put("status","success");
			data.put("data",qrCode);
		}
		HttpWebIOHelper._printWebJson(data, response);
	}
	
}
