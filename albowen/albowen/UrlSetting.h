//
//  UrlSetting.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/11.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#ifndef UrlSetting_h
#define UrlSetting_h

#define ErrorMessage @"ขอข้อมูลล้มเหลวโปรดตรวจสอบเครือข่ายของคุณ"

#define BaseUrl(api_IP, lastUrl) ([NSString stringWithFormat:@"%@%@", (api_IP), (lastUrl)])

#define Api_IP @"http://dansheng.byqckj.com/"


//启动图
#define GetStartPageBaseUrl BaseUrl(Api_IP, @"ds/app/base/startPage")

//获取注册验证码
#define GetRegistCodeBaseUrl BaseUrl(Api_IP, @"ds/app/base/getRegistCode")

//注册
#define RegisterBaseUrl BaseUrl(Api_IP, @"ds/app/user/register")

//手机号密码登陆
#define LoginBaseUrl BaseUrl(Api_IP, @"ds/app/user/login")

//获取登录验证码
#define GetLoginCodeBaseUrl BaseUrl(Api_IP, @"ds/app/base/getLoginCode")

//手机号验证码登陆
#define LoginCodeBaseUrl BaseUrl(Api_IP, @"ds/app/user/loginCode")

//三方登录
#define LoginByThirdPartyBaseUrl BaseUrl(Api_IP, @"ds/app/user/loginByThirdParty")

//三方绑定
#define RegisterByThirdPartyBaseUrl BaseUrl(Api_IP, @"ds/app/user/registerByThirdParty")


//精选MV
#define GetSiftMvBaseUrl BaseUrl(Api_IP, @"ds/app/mv/getSiftMv")

//推荐MV
#define GetRecommendMvBaseUrl BaseUrl(Api_IP, @"ds/app/mv/getRecommendMv")

//搜索
#define FindMvBaseUrl BaseUrl(Api_IP, @"ds/app/mv/findMv")

//热门搜索标签接口
#define FindMvSearchLabelBaseUrl BaseUrl(Api_IP, @"ds/app/user/findMvSearchLabel")

//搜索记录接口
#define MvUserSearchLogBaseUrl BaseUrl(Api_IP, @"ds/app/user/mvUserSearchLog")

//删除搜索记录接口
#define DelUserSearchLogBaseUrl BaseUrl(Api_IP, @"ds/app/user/delUserSearchLog")

//模糊搜索
#define FuzzySeachByTitleBaseUrl BaseUrl(Api_IP, @"ds/app/mv/fuzzySeachByTitle")




#endif /* UrlSetting_h */
