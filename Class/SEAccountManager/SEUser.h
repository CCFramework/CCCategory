//
//  SEUser.h
//  bname
//
//  Created by iMac Maxt on 2018/7/20.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEUser : NSObject


//国家
@property (nonatomic, copy) NSString *country;
//省
@property (nonatomic, copy) NSString *province;
//市
@property (nonatomic, copy) NSString *city;
//区
@property (nonatomic, copy) NSString *area;
//详细地址
@property (nonatomic, copy) NSString *detailAddr;
//简单地址
@property (nonatomic, copy) NSString *simpleAddress;


//最地带号
@property (nonatomic, copy) NSString *bname;
//用户ID
@property (nonatomic, copy) NSString *id;
//身份证号
@property (nonatomic, copy) NSString *idNum;
//Email
@property (nonatomic, copy) NSString *email;
//生日
@property (nonatomic, copy) NSString *birthDay;
//头像地址
@property (nonatomic, copy) NSString *avatarUrl;
//真实姓名
@property (nonatomic, copy) NSString *fullName;
//联系电话
@property (nonatomic, copy) NSString *phone;
//年龄
@property (nonatomic, strong) NSNumber *age;
//性别 1 男 0 女
@property (nonatomic, assign) BOOL  sex;
//个性签名
@property (nonatomic, copy) NSString *signature;
//个人空间背景图地址
@property (nonatomic, copy) NSString *backgroundImage;
//星座
@property (nonatomic, copy) NSString *constellation;
//花名
@property (nonatomic, copy) NSString *alias;
//花名ID
@property (nonatomic, copy) NSString *aliasId;
//是否认证
@property (nonatomic, assign) BOOL isAuth;
//是否会员
@property (nonatomic, assign) BOOL  isVip;



//"inUse": 0,
@property (nonatomic, assign) BOOL inUse;
//特权
@property (nonatomic, copy) NSString *privilege;
//获赞数量
@property (nonatomic, strong) NSNumber *upvote;
//我的关注数量
@property (nonatomic, strong) NSNumber *mylike;
//我的粉丝数量
@property (nonatomic, strong) NSNumber *likeme;



//微信号
@property (nonatomic, copy) NSString *weixinid;
//微信原生数据
@property (nonatomic, copy) NSString *wechat;
//facebook号
@property (nonatomic, copy) NSString *facebookid;
//facebook原生数据
@property (nonatomic, copy) NSString *facebook;
//QQ号
@property (nonatomic, copy) NSString *qqid;
//QQ原生数据
@property (nonatomic, copy) NSString *qq;
//twitter号
@property (nonatomic, copy) NSString *twitterid;
//twitter原生数据
@property (nonatomic, copy) NSString *twitter;
//微博号
@property (nonatomic, copy) NSString *weiboid;
//微博原生数据
@property (nonatomic, copy) NSString *weibo;


//数据更新时间
@property (nonatomic, copy) NSString *updateTime;
//最后登录时间
@property (nonatomic, copy) NSString *lastLoginTime;
//账号创建时间
@property (nonatomic, copy) NSString *createTime;
//用户类型
@property (nonatomic, assign) NSInteger  userType;

//纬度
@property (nonatomic, copy) NSString *latitude;
//经度
@property (nonatomic, copy) NSString *longitude;

@end
