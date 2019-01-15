//
//  setting.h
//  albowen
//
//  Created by 关云秀 on 2019/1/12.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#ifndef Header_h
#define Header_h


#ifdef DEBUG
#define XLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define XLog(FORMAT, ...) nil;
#endif

#define MapKey @"BmO2TIxUn7rjiMsorsYVDFae9gVpVqtF"

#define ErrorMessage @"数据请求失败,请检查您的网络"

#define KWeakSelf __weak __typeof(self)weakSelf = self

//向上取整
#define UP_Int(float)  ceilf(float)

//向下取整
#define Down_Int(float)  floorf(float)

//四舍五入
#define K_Int(float)  roundf(float)

#define MCOLOR 0xFF4C2A

#define KCOLOR(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define KBGCOLOR [UIColor colorWithRed:224/255.0 green:14/255.0 blue:72/255.0 alpha:1]

#define K_TEXTCOLOR KCOLOR(156, 157, 158)

#define K_H_TextCOLOR KCOLOR(162, 164, 161)

// 灰色字体
#define K_HColor [UIColor colorWithRed:193/255.0 green:192/255.0 blue:191/255.0 alpha:1]

#define K_View_BGColor [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]

#define KSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define KFONT(font)  [UIFont systemFontOfSize:font]

#define TabBarHeight  ((KSCREEN_HEIGHT == 812 || KSCREEN_HEIGHT == 896) ? 83.0 : 49)
#define NavHeight  ((KSCREEN_HEIGHT == 812 || KSCREEN_HEIGHT == 896) ? 88.0 : 64)
#define ToolBarHeight ((KSCREEN_HEIGHT == 812 || KSCREEN_HEIGHT == 896 ) ? 44 : 20)
#define bottomBarHeight ((KSCREEN_HEIGHT == 812 || KSCREEN_HEIGHT == 896) ? 34 : 0)

#define KImage(string) [[UIImage imageNamed:string]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)


#if !__has_feature(objc_arc)

/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
CFRelease(__REF); \
__REF = nil;\
}\
}

//view安全释放
#undef TTVIEW_RELEASE_SAFELY
#define TTVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
CFRelease(__REF);\
__REF = nil;\
}\
}

//释放定时器
#undef TT_INVALIDATE_TIMER
#define TT_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
[__TIMER release];\
__TIMER = nil;\
}

#else

/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}

//view安全释放
#define TTVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
__REF = nil;\
}\
}

//释放定时器
#define TT_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
__TIMER = nil;\
}

#endif

#endif /* Header_h */

