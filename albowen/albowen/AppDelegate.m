//
//  AppDelegate.m
//  albowen
//
//  Created by 关云秀 on 2019/1/12.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "ResourceClass.h"
#import "AppDelegate+Push.h"

@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    _window.rootViewController = [BaseTabBarController new];
    [_window makeKeyAndVisible];
    
    NSArray* list = [[NSUserDefaults standardUserDefaults]objectForKey:@"data"];
    if (list == nil) {
        [self initshuj];
    }
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        // Fallback on earlier versions
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:@"45cc0539e033901cccdcda8b" channel:@"" apsForProduction:true];
    
    
    return YES;
}

//通知方法
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    
    //调用接口
    
    //通知后台registrationID
    
    
    //注销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kJPFNetworkDidLoginNotification object:nil];
}


- (void)initshuj {
    NSString *date = @"{\"item\":[{\"name\":\"โรงแรมในสไตล์ไทยแบบดั้งเดิม\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":7.6,\"lat\":13.75919,\"lng\":100.49651,\"dis\":\"โรงแรมในถนนข้าวสารในช่วงกลางและสะดวกมากที่อุดมด้วยอาหารเช้าของโรงแรม โรงแรมสระว่ายน้ําบนดาดฟ้าที่เต็มไปด้วยอารมณ์ของเด็ก\",\"imageList\":[\"http://p2-q.mafengwo.net/s10/M00/9F/EA/wKgBZ1mIb0OAA50wAAIdaeBF-i416.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://p4-q.mafengwo.net/s6/M00/B2/BE/wKgB4lMDacGAPLq7AAKizs4AHDw28.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b1-q.mafengwo.net/s6/M00/22/9D/wKgB4lMOfwCAUhaEAAGquSxMU8Y47.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n2-q.mafengwo.net/s10/M00/9F/E8/wKgBZ1mIb0KAEhHYAAHrcl5-u5E76.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b3-q.mafengwo.net/s11/M00/7D/30/wKgBEFsiGMSATat7AAVJB2dLxEw20.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b1-q.mafengwo.net/s7/M00/1B/16/wKgB6lS9w_WABdwvAAZR9r9y__I00.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b3-q.mafengwo.net/s10/M00/9F/F2/wKgBZ1mIb0OAPdSQAAJAKHTZdsI59.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"D & D โรงแรม\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nสยามสแควร์ : แท็กซี่ 13 นาทีใช้เวลาเดินทางประมาณ 5.7 กม.\\nเดินเพียง 1 นาทีจากถนนข้าวสาร :\\nไชน่าทาวน์ : แท็กซี่ 9 นาทีใช้เวลาเดินทางประมาณ 3.9 กม.\\nพิพิธภัณฑ์สถานแห่งชาติ : เดิน 10 นาที\\nวัดโพธิ์ : เดิน 21 นาทีหรือนั่งแท็กซี่ 8 นาทีใช้เวลาเดินทางประมาณ 3.3 กม.\\nวัดอรุณราชวรารามราชวรมหาวิหาร : แท็กซี่ 12 นาทีใช้เวลาเดินทางประมาณ 6.4 กม.\\nพระราชวังจักรพรรดิ : แท็กซี่ 7 ไม้สัก 5 นาทีโดยรถยนต์ประมาณ 3.2 กม.\\nพิพิธภัณฑ์หุ่นขี้ผึ้งมาดามทุซโซต์กรุงเทพ : แท็กซี่ 18 นาทีใช้เวลาเดินทางประมาณ 9 กม.\\nสยามโอเชี่ยนเวิลด์ : แท็กซี่ 15 นาทีใช้เวลาเดินทางประมาณ 6.4 กิโลเมตรหรือก่อนเดินทางไปรถไฟฟ้า BTS ( สถานีรถไฟฟ้าใต้ดิน Bearing BTS1 สาย ) , คุณสามารถใช้สำหรับวัด Makok รถบัส ( 511 ถนน ) ไปที่\\nสถานีรถไฟหัวลําโพงรถยนต์ 14 นาทีใช้เวลาเดินทางประมาณ 6.1 กม.\\nอนุสาวรีย์ชัยสมรภูมิ : แท็กซี่ 13 นาทีใช้เวลาเดินทางประมาณ 6.8 กม.\",\"fangxing\":\"โรงแรมให้บริการห้องพักสุดหรูมีให้เลือกหลากหลายสามคน , ห้องมาตรฐานและห้องดีลักซ์เตียงคู่หรือเตียงคู่สองเตียงและห้องสวีทและห้องสวีทและห้องพักทุกห้องติดตั้งเครื่องปรับอากาศ , กระเบื้อง / พื้นหินอ่อน , ฝักบัว , อุปกรณ์อาบน้ําฟรี , ห้องน้ำ , ห้องน้ํา , โทรศัพท์ , ทีวีดาวเทียม , เคเบิลทีวี , เครื่องบินทีวี , ตู้เย็น , บริการโทรปลุก , ผ้าขนหนูพรีเมี่ยม / เตียง เดี่ยว\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องปลอดบุหรี่ , เขตสูบบุหรี่ , ATM , นำสัตว์เลี้ยง , บาร์ , ข้อมูลท่องเที่ยว , รถบัส , ปลุก , แลกเปลี่ยนเงินตราต่างประเทศ , นวด , ร้านอาหาร , โรงแรมให้บริการฟรี Wi - Fi โรงแรมสระว่ายน้ําในร่ม โรงแรมใน D & D , คุณสามารถเพลิดเพลินกับร้านอาหารในกรุงเทพอร่อยแบบดั้งเดิม\",\"tiaokuan\":\"เวลาเช็คอิน\\n14 : 00-19 : 00 น.\\nเวลาเช็คเอาท์\\n12 ก่อนน.\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nยินดีต้อนรับเด็กทุกวัย .\\n1 ชื่อ 7 อายุของเด็กในการใช้เตียงที่มีอยู่ในฟรี\\nรองรับได้ถึงเตียงเสริม : 0 .\\nสัตว์เลี้ยง\\nไม่อนุญาตให้นำสัตว์เลี้ยง . . . . . . .\\nรับเฉพาะเงินสด\\nโรงแรมที่พักผู้เข้าพักสามารถใช้รับเฉพาะเงินสดจ่าย\\nบัตรเครดิตเป็นเพียงการรับประกันการจอง\",\"isSc\":false,\"fenshu\":7.1,\"lat\":13.75918,\"lng\":100.49651,\"dis\":\"จองโรงแรมในกรุงเทพถนนข้าวสารคึกคักมากในช่วงเช้าและกลางคืนมีหลายลักษณะของขนมมีหลายบาร์และเหมาะสำหรับเยาวชน โรงแรมรอบๆมีหลายตัวเธอ。\",\"imageList\":[\"http://n4-q.mafengwo.net/s9/M00/BF/A6/wKgBs1ZqgzqASo7kAAL1Wvut1R040.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://n4-q.mafengwo.net/s11/M00/B3/E8/wKgBEFsyGcKAcRVAAAJ2u0bVLRg85.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b2-q.mafengwo.net/s9/M00/BF/A7/wKgBs1ZqgzqAS_U6AAIrytVvyAQ57.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p4-q.mafengwo.net/s6/M00/22/7C/wKgB4lMOfuyAUKXSAAE77__rvnM87.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n3-q.mafengwo.net/s11/M00/B3/E8/wKgBEFsyGcKAd34KAAlxQbGpUeY39.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n1-q.mafengwo.net/s10/M00/4D/3A/wKgBZ1oS5RWAQnl5AAKnjVN0Eoo36.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p1-q.mafengwo.net/s9/M00/BF/F7/wKgBs1Zqg6qAbxzWAAIRkAYwVKQ32.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"กรุงเทพฯโรงแรมบูติกสํารูปภาพชิป\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":8.6,\"lat\":13.77006,\"lng\":100.50535,\"dis\":\"เจ้านายพูดภาษาจีน , ห้องถูกตกแต่งแบบเรียบง่ายบรรยากาศและความรู้สึกที่ละเอียดอ่อนประณีตมีการตกตะกอน , อาหารเช้า , อาหารที่หลากหลายและรสชาติที่ยอดเยี่ยมหรือบริการไม่ว่าสภาพแวดล้อมที่ได้รับความนิยมมาก\",\"imageList\":[\"http://b4-q.mafengwo.net/s5/M00/DE/F2/wKgB3FIGX8iAMQLHAAd3JV1nTa827.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://n3-q.mafengwo.net/s6/M00/D6/CE/wKgB4lI-qkuAeP2DAAte6bLiEMw22.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p3-q.mafengwo.net/s10/M00/09/19/wKgBZ1mMuQmAc9EJAAEwomHOIMY92.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n2-q.mafengwo.net/s5/M00/DE/F6/wKgB3FIGX8yAb-q6AAP9Hi1PyhQ71.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b4-q.mafengwo.net/s8/M00/2B/55/wKgBpVWRMhCAJO0WAAaaTLzXG4s14.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b4-q.mafengwo.net/s11/M00/F8/66/wKgBEFpwTIyAcADtAAYO_2vmiEk37.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b1-q.mafengwo.net/s6/M00/D6/CD/wKgB4lI-qkmATVD8AA1mC4hFkFI26.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"Chillax Resortโรงแรมรีสอร์ท\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":8.4,\"lat\":13.76271,\"lng\":100.49988,\"dis\":\"ทำเลดีห่างจากย่านถนนข้าวสาร 5 เพียงนาทีเดินไปยังพระบรมมหาราชวังสถานที่ท่องเที่ยวอื่นๆยังสะดวกมาก ภายในโรงแรมตกแต่งใหม่สวยงามพร้อมอุปกรณ์ครบครัน\",\"imageList\":[\"http://b4-q.mafengwo.net/s6/M00/75/E4/wKgB4lMCAEmAG--hAANXc-WfkXk10.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://p1-q.mafengwo.net/s7/M00/3F/41/wKgB6lPU1SKABDUsAA03m-HqVgo01.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p3-q.mafengwo.net/s11/M00/08/3E/wKgBEFr6nK-ABYctAAfD-nw70EY75.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b3-q.mafengwo.net/s11/M00/08/38/wKgBEFr6nK6AEn6rAACdTSNGv1c38.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b1-q.mafengwo.net/s11/M00/08/39/wKgBEFr6nK6AMNo5AADqO7D728A95.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n1-q.mafengwo.net/s11/M00/08/59/wKgBEFr6nLqASI08AAf2GdZrwsE45.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b3-q.mafengwo.net/s11/M00/08/5E/wKgBEFr6nL2AHv3zAAF56rUFqzE78.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"โรงแรมรอยัลปริ๊นเซส\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":8.3,\"lat\":13.7577,\"lng\":100.51307,\"dis\":\"ที่ตั้งของโรงแรมดีห่างจากพระบรมมหาราชวังและถนนข้าวสารสามกิโลเมตรเพียงไม่กี่นาทีโดยรถยนต์ โรงแรมมีบริการรถรับ - ส่งฟรีไปที่เว็บไซต์ช้อปปิ้งมนุษย์มาก\",\"imageList\":[\"http://p4-q.mafengwo.net/s10/M00/93/E0/wKgBZ1l9ce6AeKspAAIdwYddcs429.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://n4-q.mafengwo.net/s10/M00/93/DC/wKgBZ1l9ceeAQnX9AAIUywloMF438.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p2-q.mafengwo.net/s6/M00/F8/CB/wKgB4lMOYfKAbCyVAAJjWKmTMCg92.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p2-q.mafengwo.net/s6/M00/F8/BB/wKgB4lMOYemAG_e4AAHSurBNoqo33.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b2-q.mafengwo.net/s10/M00/98/6C/wKgBZ1mIbkuAZKxRAAJ4LglGExo70.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p4-q.mafengwo.net/s10/M00/98/69/wKgBZ1mIbkuAfiQaAAJxxqZe3os05.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p3-q.mafengwo.net/s7/M00/BA/E3/wKgB6lR0UJGAQyToAAJpn-xF-MQ69.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"โรงแรมแม็ค\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":8,\"lat\":13.76173,\"lng\":100.50423,\"dis\":\"เป็นโรงแรมสไตล์ย้อนยุคที่ใกล้ถนนข้าวสารถนนข้าวสารให้เดินทางไปดู tutu ฟรีรถและการเดินทางที่สะดวก ห้องพักสะอาดสะดวกสบายแม้จะไม่ใหม่แต่ก็มี . . . . . . .\",\"imageList\":[\"http://n1-q.mafengwo.net/s10/M00/49/80/wKgBZ1odFCSAb00eAAOYYIBVyrA16.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://n1-q.mafengwo.net/s8/M00/F8/19/wKgBpVX7dreAX-tKAAKEzhuFPes93.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p4-q.mafengwo.net/s8/M00/F8/0A/wKgBpVX7dqOAMTqtAALqJrElgzA62.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n4-q.mafengwo.net/s8/M00/F7/D7/wKgBpVX7doSAbKfbAAFrfPCNPNU05.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n4-q.mafengwo.net/s7/M00/A6/E5/wKgB6lRy9oOAXI-pAAHQ-2H_esI10.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b1-q.mafengwo.net/s8/M00/F8/0D/wKgBpVX7dqeAUOcNAAKtVKJxlAk00.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p1-q.mafengwo.net/s2/M00/8D/E5/wKgBpU449SXCUDM7AABVKLuttrM65.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"ถนนข้าวสาร\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":6.3,\"lat\":13.75905,\"lng\":100.49721,\"dis\":\"โรงแรมอยู่ห่างจากถนนข้าวสารและพระบรมมหาราชวังที่ใกล้ๆมี 7-11 และร้านอาหารมากมายที่บาร์ในโรงแรมยังให้บริการฟรี Wi - Fi และสระว่ายน้ำบนชั้นดาดฟ้าและห้องสะอาดและเป็นระเบียบเรียบร้อยพนักงานก็ . . . . . . .\",\"imageList\":[\"http://n4-q.mafengwo.net/s6/M00/5F/91/wKgB4lMDIIiAQzzgAAJJDud2z3c86.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://b4-q.mafengwo.net/s7/M00/C3/2D/wKgB6lQqU7yAc73ZAAeWf7q-NWE48.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b3-q.mafengwo.net/s6/M00/7F/BE/wKgB4lNbkaSAdkbhAB6QoHrbIho26.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p4-q.mafengwo.net/s6/M00/BB/0F/wKgB4lMNxsyATwzyAAE7GpzMNAg35.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p4-q.mafengwo.net/s7/M00/2C/27/wKgB6lR0o7eAJFF0AABm0X_mMMg35.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b2-q.mafengwo.net/s10/M00/54/0E/wKgBZ1ogLYWAK8iXAAUm7qO7aHo06.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b4-q.mafengwo.net/s5/M00/CD/39/wKgB21Bi1h67Tc5NAAVmXrr2FxM71.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]},{\"name\":\"จองโรงแรมที่พักปฏิรูป\",\"jiaotong\":\"โรงแรมที่พักเดินทางสะดวกใกล้กับแหล่งท่องเที่ยวหลักทั้งหมดมีดังนี้ :\\nโบสถ์โคโลญ : เดิน 18 นาทีหรือนั่งแท็กซี่ 3 นาทีใช้เวลาเดินทางประมาณ 1.4 กม.\\nสถานีรถไฟโคโลญจน์ : เดิน 19 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.6 กม.\\nโบราณตลาดและศาลากลางของเมือง : เดิน 20 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.3 กม.\\nพิพิธภัณฑ์กลิ่นหอม 4711 : เดิน 12 นาที\\nเซนต์มาร์ตินโบสถ์โคโลญจน์ : เดิน 22 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 2.7 กม.\\nพิพิธภัณฑ์ช็อกโกแลตโคโลญจน์ : แท็กซี่ 10 นาทีใช้เวลาเดินทางประมาณ 4.3 กม.\\nโคโลญจน์ : ทางเดินรถ 8 นาทีใช้เวลาเดินทางประมาณ 3.8 กม.\\nเรือล่องเรือ : ไรน์เดิน 16 นาทีหรือนั่งแท็กซี่ 4 นาทีใช้เวลาเดินทางประมาณ 1.5 กม.\\nพิพิธภัณฑ์ลุดวิก : เดิน 21 นาทีหรือนั่งแท็กซี่ 5 นาทีใช้เวลาเดินทางประมาณ 1.7 กม.\\nกรุงโรม - พิพิธภัณฑ์นอร์ดิกเดิน 18 นาทีหรือนั่งแท็กซี่ 6 นาทีใช้เวลาเดินทางประมาณ 1.8 กม.\",\"fangxing\":\"ห้องพักแต่ละห้องมีการติดตั้งมินิบาร์ , โต๊ะเขียนหนังสือ , พัดลมเพดาน , ทีวีดาวเทียม / เคเบิลทีวี , โทรทัศน์ , ตู้เซฟในห้องพัก , ฝักบัว , เครื่องเป่าผม , ฟรีอินเตอร์เน็ตไร้สาย\\nโรงแรมเสนอห้องพักมีให้เลือกหลากหลายคู่หรือเตียงแฝดและห้องสวีทสองห้องนอน ( 1 คน ) และห้องสามสามคน ,\",\"fangjia\":\"\",\"sheshi\":\"โทรทัศน์ , ห้องซักรีด , ห้องกันเสียง , เครื่องทําความร้อน , ควันบุหรี่ , นำสัตว์เลี้ยง , บาร์ , ภาษา , ข้อมูลท่องเที่ยว , แฟกซ์ , จองตั๋ว , เช็คอินด่วนและเช็คเอาท์ , คาราโอเกะ , ร้านอาหาร , ห้องอาหารเช้า\",\"tiaokuan\":\"เวลาเช็คอิน\\n15 : 00-23 น.\\nเวลาเช็คเอาท์\\n07 : 00-23 : 30\\nยกเลิกการจองล่วงหน้า / นโยบาย\\nประเภทที่แตกต่างกันของการยกเลิกการจองห้องพักที่แตกต่างกันและก่อนการชำระเงินนโยบาย\\nเมื่อเลือกห้องพักข้างต้นโปรดดูที่เงื่อนไขของห้องพัก\\nเด็กและเตียงเสริม\\nเด็กอายุต่ำกว่า 6 ทั้งหมดในการใช้เตียงที่มีอยู่เมื่อคุณไม่ต้องจ่าย\\nทุกเพศทุกวัยในเด็กหรือผู้ใหญ่เสริมเตียงคิดค่าใช้จ่ายต่อคนต่อคืน EUR40\\nถือได้สูงสุด 1 เตียงเสริม / เตียงเด็ก\\nใดๆที่เสนอโดยเสริมเตียงหรือเปลสําหรับเด็กจะต้องได้รับการยืนยันจากโรงแรม\\nค่าใช้จ่ายเพิ่มเติมจะคำนวณโดยอัตโนมัติในราคาที่คุณต้องจ่ายเมื่อเช็คอิน\\nสัตว์เลี้ยง\\nโรงแรมที่พักอนุญาตให้นำสัตว์เลี้ยงเข้าพักแต่ต้องยื่นคำขอล่วงหน้า ไม่ต้องเสียค่าใช้จ่ายเพิ่มเติม\",\"isSc\":false,\"fenshu\":6.2,\"lat\":13.7602,\"lng\":100.49687,\"dis\":\"โรงแรมในถนนข้าวสารในช่วงกลางและสะดวกมากที่อุดมด้วยอาหารเช้าของโรงแรม โรงแรมสระว่ายน้ําบนดาดฟ้าที่เต็มไปด้วยอารมณ์ของเด็ก\",\"imageList\":[\"http://n3-q.mafengwo.net/s6/M00/A8/3D/wKgB4lMDYJqAJnRPAAHzii7sk1s03.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\",\"http://p1-q.mafengwo.net/s8/M00/9B/43/wKgBpVYXZ-eAQIOwAAJKKES9hCM14.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b3-q.mafengwo.net/s8/M00/9B/18/wKgBpVYXZ7qABt0LAAFJBWVNkf862.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n3-q.mafengwo.net/s8/M00/9B/26/wKgBpVYXZ8mAAN41AAHgXrlz3yA67.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://n1-q.mafengwo.net/s5/M00/EC/19/wKgB21BDH_mZPMbCAAEcpayrR_M06.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://p1-q.mafengwo.net/s6/M00/A8/3D/wKgB4lMDYJmAVugbAALK0mLocLI22.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\",\"http://b4-q.mafengwo.net/s8/M00/9B/1E/wKgBpVYXZ8CAFw7fAAEaICcb8CU99.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]}]}";
    
    NSDictionary *retDict = [self dictionaryWithJsonString:date];
    
    NSArray *list = retDict[@"item"];
    NSMutableArray *ma = [NSMutableArray new];
    for (NSDictionary *dic in list) {
         int y =100 +  (arc4random() % 101);
        ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
        model.ruzhu =[NSString stringWithFormat:@"PM:2:00"];
        model.lidian = @"AM:12:00";
        model.fangjian =[NSString stringWithFormat:@"%d",y];
        model.isSc = false;
        NSDictionary *dic = [model mj_JSONObject];
        [ma addObject:dic];
    }
    [[NSUserDefaults standardUserDefaults]setObject:[NSArray arrayWithArray:ma] forKey:@"data"];
}



- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

#pragma mark- JPUSHRegisterDelegate

// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)){
    if (@available(iOS 10.0, *)) {
        if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            //从通知界面直接进入应用
        }else{
            //从通知设置界面进入应用
        }
    } else {
        // Fallback on earlier versions
    }
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
}




@end
