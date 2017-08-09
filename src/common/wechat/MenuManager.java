package common.wechat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MenuManager {

	 private static Logger log = LoggerFactory.getLogger(MenuManager.class);

	    public static void main(String[] args) {
	        // 第三方用户唯一凭证
	        String appId = "";
	        // 第三方用户唯一凭证密钥
	        String appSecret = "";

	        // 调用接口获取access_token
	        AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);

	        if (null != at) {
	            // 调用接口创建菜单
	            int result = WeixinUtil.createMenu(getMenu(), at.getToken());

	            // 判断菜单创建结果
	            if (0 == result)
	                log.info("菜单创建成功！");
	            else
	                log.info("菜单创建失败，错误码：" + result);
	        }
	    }
	    
	    
	    /**
	     * 组装菜单数据
	     * 
	     * @return
	     */
	    private static Menu getMenu() {
	        CommonButton btn11 = new CommonButton();
	        btn11.setName("创办故事");
	        btn11.setType("click");
	        btn11.setKey("11");

	        CommonButton btn12 = new CommonButton();
	        btn12.setName("名企联谊");
	        btn12.setType("click");
	        btn12.setKey("12");

	        CommonButton btn13 = new CommonButton();
	        btn13.setName("精彩回顾");
	        btn13.setType("click");
	        btn13.setKey("13");

	        CommonButton btn21 = new CommonButton();
	        btn21.setName("康康爱情讲堂");
	        btn21.setType("click");
	        btn21.setKey("21");

	        CommonButton btn22 = new CommonButton();
	        btn22.setName("妈妈团精彩回顾");
	        btn22.setType("click");
	        btn22.setKey("22");

	        CommonButton btn23 = new CommonButton();
	        btn23.setName("806大龄交友");
	        btn23.setType("click");
	        btn23.setKey("23");

	        CommonButton btn24 = new CommonButton();
	        btn24.setName("爱情百问");
	        btn24.setType("click");
	        btn24.setKey("24");

	        CommonButton btn25 = new CommonButton();
	        btn25.setName("免费挂牌");
	        btn25.setType("click");
	        btn25.setKey("25");

	        CommonButton btn31 = new CommonButton();
	        btn31.setName("推荐男生");
	        btn31.setType("click");
	        btn31.setKey("31");

	        CommonButton btn32 = new CommonButton();
	        btn32.setName("推荐女生");
	        btn32.setType("click");
	        btn32.setKey("32");

	        ViewButton btn33 = new ViewButton();
			btn33.setName("注册信息");
			btn33.setType("view");
			btn33.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxcc1379ef67da7f48&redirect_uri=http://123.207.141.172/base/&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
			
	        
	        /**
	         * 微信：  mainBtn1,mainBtn2,mainBtn3底部的三个一级菜单。
	         */
	        
	        ComplexButton mainBtn1 = new ComplexButton();
	        mainBtn1.setName("名企频道");
	        //一级下有4个子菜单
	        mainBtn1.setSub_button(new Button[] { btn11, btn12, btn13 });

	        
	        ComplexButton mainBtn2 = new ComplexButton();
	        mainBtn2.setName("当月活动");
	        mainBtn2.setSub_button(new Button[] { btn21, btn22, btn23, btn24, btn25 });

	        
	        ComplexButton mainBtn3 = new ComplexButton();
	        mainBtn3.setName("免费注册");
	        mainBtn3.setSub_button(new Button[] { btn31, btn32, btn33 });

	        
	        /**
	         * 封装整个菜单
	         */
	        Menu menu = new Menu();
	        menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

	        return menu;
	    }
}
