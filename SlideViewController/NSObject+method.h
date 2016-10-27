//
//  NSObject+method.h
//  
//
//  Created by yyd on 15/8/6.
//  Copyright (c) 2015年 YangAnDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (newView)
//UIView封装
+ (UIView *)viewWithFram:(CGRect)frame cornerRadius:(int)cornerRadius bacgoudColor:(int)bacgroudColor;

@end

@interface UILabel (newLabel)
//UILabel封装
+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title bold:(int)index textAlignment:(int)textAlignment;
+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title bold:(int)index textAlignment:(int)textAlignment isBorder:(int)isBorder cornerRadius:(int)cornerRadius;
@end

//UITextField封装
@interface UITextField (newTextField)

+(UITextField *)textFiledWithFrame:(CGRect)frame font:(NSInteger)font borderStyle:(NSInteger)borderStyle andPlaceholder:(NSString *)placeholder;
@end

//UIImageView封装
@interface UIImageView (newUIImageView)

+(UIImageView *)imageViewWithFrame:(CGRect)frame addImage:(NSString *)image;

//头像
+(UIImageView *)imageViewWithFrame:(CGRect)frame;
//圆角图片
+(UIImageView *)imageViewWithFrame:(CGRect)frame cornerRadius:(int)cornerRadius addImage:(NSString *)image userInteractionEnabled:(BOOL)userInteractionEnabled;

@end

//适配封装
@interface UIResponder (newUIResponder)

//frame适配
//宽高相同
-(CGRect)getRectWithX:(CGFloat)x RectWithY:(CGFloat)y RectWithWidth:(CGFloat)width andRectWithWidth:(CGFloat)height;
//宽高不同
-(CGRect)getRectWithX:(CGFloat)x RectWithY:(CGFloat)y RectWithWidth:(CGFloat)width andRectWithHeight:(CGFloat)height;
//宽度适配
-(CGFloat)width:(CGFloat)oldWidth;
//高度适配
-(CGFloat)height:(CGFloat)oldHeight;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end