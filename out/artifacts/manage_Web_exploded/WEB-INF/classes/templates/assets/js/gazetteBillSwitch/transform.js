/*付款类型paymenttype 
		付款类型：1、常规  2、积分 3、分期
		*/
		function paymentType(type){
			if(type == 1){
				return "常规";
			}else if(type == 2){
				return "积分";
			}else if(type == 3){
				return "分期";
			}else{
				return "未知";
			}
		}
		
		/*报单类型entryType
		代理类型：1、区运营中心  2、报单中心  3、代理商
		*/
		function entryType(type){
			if(type == 1){
				return "区运营中心";
			}else if(type == 2){
				return "报单中心";
			}else if(type == 3){
				return "代理商";
			}else{
				return "未知";
			}
		}
		
		/*状态类型stateType
		状态类型  1、待审核 2、代收尾款  3、不通过  4、已通过
		*/
		function stateType(type){
			if(type == 1){
				return "草稿";
			}else if(type == 2){
				return "待审核";
			}else if(type == 3){
				return "待收尾款";
			}else if(type == 4){
				return "审核不通过";
			}else if(type == 5){
				return "已通过";
			}else{
				return "未知";
			}
		}
		
		//判断奖金是否发放
		function giveOutType(type){
			if(type==1){
				return "待发放";
			}else if(type==2){
				return "已发放"
			}else{
				return "";
			}
		}

		
		/*修改广告页面*/
		function advertisingLocation(type){
			if(type == 1){
				return "app首页轮播图";
			}else if(type == 2){
				return "商家入驻轮播图";
			}else if(type == 3){
				return "H5推荐图";
			}
		}
		
		/*修改广告页面上线下线*/
		function ONOFFstate(type){
			if(type == 1){
				return "上线";
			}else if(type == 2){
				return "下线";
			}else if(type == -1){
				return "已删除";
			}
		}
		
		function orderType(type){
			if(type == 1){
				return "微信支付";
			}else if(type == 2){
				return "支付宝支付";
			}else{
				return "";
			}
		}
		
		function remarksShop(type){
			if(type==1){
				return "锁定消费者商家";
			}else{
				return "";
			}
		}
		
		function remarksUser(type){
			if(type == 1){
				return "消费者返利";
			}else if(type == 2){
				return "区运营中心";
			}else if(type == 3){
				return "直推代理";
			}else if(type == 4){
				return "间推代理";
			}else if(type == 5){
				return "推荐人";
			}else if(type == 6){
				return "市运营中心";
			}else if(type == 7){
				return "省运营中心";
			}else{
				return "";
			}
		}

		//注册类型
		function registerType(type){
            if(type == 1){
                return "微信扫码注册";
            }else if(type == 2){
                return "支付宝扫码注册";
            }else if(type == 3){
                return "分享注册";
            }else if(type == 4){
                return "APP注册";
            }else{
            	return "";
			}
		}