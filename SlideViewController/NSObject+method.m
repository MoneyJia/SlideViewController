//
//  NSObject+method.m
//  
//
//  Created by yyd on 15/8/6.
//  Copyright (c) 2015年 YangAnDong. All rights reserved.
//

#import "NSObject+method.h"

@implementation UIView (newView)

+ (UIView *)viewWithFram:(CGRect)frame cornerRadius:(int)cornerRadius bacgoudColor:(int)bacgroudColor
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    if (bacgroudColor==0) {
        view.backgroundColor = [UIColor whiteColor];
    }else if (bacgroudColor == 1){
//        view.backgroundColor = kREDCOLOR;
    }else if (bacgroudColor == 2){
//        view.backgroundColor = KNAVBARCOLOR;
    }
    if (cornerRadius>0) {
        view.layer.cornerRadius = cornerRadius;
    }
    
    return view;
}

@end


@implementation UILabel (newLabel)
+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title bold:(int)index textAlignment:(int)textAlignment{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.userInteractionEnabled = YES;
    label.text = title;
    label.textColor = color;
    if (index == 1) {
        label.font = [UIFont boldSystemFontOfSize:font];
    }else{
        label.font = [UIFont systemFontOfSize:font];

    }
    
    if (textAlignment == 0) {
        label.textAlignment = NSTextAlignmentLeft;

    }else if (textAlignment == 1){
        label.textAlignment = NSTextAlignmentCenter;

    }else if (textAlignment == 2){
        label.textAlignment = NSTextAlignmentRight;

    }else{
        label.textAlignment = NSTextAlignmentLeft;

    }
    
    
    return label;
}

+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title bold:(int)index textAlignment:(int)textAlignment isBorder:(int)isBorder cornerRadius:(int)cornerRadius{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.userInteractionEnabled = YES;
    label.text = title;
    label.textColor = color;
    if (index == 1) {
        label.font = [UIFont boldSystemFontOfSize:font];
    }else{
        label.font = [UIFont systemFontOfSize:font];
        
    }
    
    if (textAlignment == 0) {
        label.textAlignment = NSTextAlignmentLeft;
        
    }else if (textAlignment == 1){
        label.textAlignment = NSTextAlignmentCenter;
        
    }else if (textAlignment == 2){
        label.textAlignment = NSTextAlignmentRight;
        
    }else{
        label.textAlignment = NSTextAlignmentLeft;
        
    }
    
    if (isBorder==1) {
        
        label.layer.borderColor = [[UIColor grayColor]CGColor];
        label.layer.borderWidth = 0.5f;
        
    }else{
        
    }
    
    if (cornerRadius>0) {
        
        label.layer.cornerRadius = cornerRadius;
        
    }
    
    
    return label;
}

@end

@implementation UITextField (newTextField)
//borderStyle如果是0没有边框否则有边框
+(UITextField *)textFiledWithFrame:(CGRect)frame font:(NSInteger)font borderStyle:(NSInteger)borderStyle andPlaceholder:(NSString *)placeholder{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.clearButtonMode = UITextFieldViewModeNever;
//    textField.clearsOnBeginEditing = YES;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    if (borderStyle == 0) {
        textField.borderStyle = UITextBorderStyleNone;
    }else{
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }
    
    textField.font = [UIFont systemFontOfSize:font];
    
    return textField;
}
@end

@implementation UIImageView (newUIImageView)

+(UIImageView *)imageViewWithFrame:(CGRect)frame addImage:(NSString *)image{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

//头像
+(UIImageView *)imageViewWithFrame:(CGRect)frame{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    [imageView.layer setCornerRadius:(imageView.frame.size.height/2)];
    [imageView.layer setMasksToBounds:YES];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setClipsToBounds:YES];
    
    imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    imageView.layer.borderWidth = 0.1f;
    
    return imageView;
}

//圆角图片
+(UIImageView *)imageViewWithFrame:(CGRect)frame cornerRadius:(int)cornerRadius addImage:(NSString *)image userInteractionEnabled:(BOOL)userInteractionEnabled{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    if (cornerRadius>0) {
        imageView.layer.cornerRadius = cornerRadius;
        imageView.clipsToBounds = YES;
    }
    
    if (userInteractionEnabled) {
        imageView.userInteractionEnabled = YES;
    }else{
        imageView.userInteractionEnabled = NO;
    }
    
    
    return imageView;
}

@end

@implementation UIResponder(newUIResponder)

//frame适配
//宽高相同
-(CGRect)getRectWithX:(CGFloat)x RectWithY:(CGFloat)y RectWithWidth:(CGFloat)width andRectWithWidth:(CGFloat)height{
    CGRect rect = CGRectZero;
//    CGFloat sub = 64.0+49.0;
//    if (kIPHONE4 || kIPHONE5) {
//        rect = CGRectMake(x, y, width, height);
//    }else if (kIPHONE6){//6
//        rect = CGRectMake(x, y, width*(375/320.0), height*(375/320.0));
//    }else{//6P
//        rect = CGRectMake(x, y, width*((414-sub)/(320.0-sub)), height*((414-sub)/(320.0-sub)));
//    }
    
    return rect;
}
//宽高不同
-(CGRect)getRectWithX:(CGFloat)x RectWithY:(CGFloat)y RectWithWidth:(CGFloat)width andRectWithHeight:(CGFloat)height{
    CGRect rect = CGRectZero;
//    CGFloat sub = 64.0+49.0;
//    if (kIPHONE4 || kIPHONE5) {
//        rect = CGRectMake(x, y, width, height);
//    }else if (kIPHONE6){//6
//        rect = CGRectMake(x, y, width*(375/320.0), height*(667/480.0));
//    }else{//6P
//        rect = CGRectMake(x, y, width*((414-sub)/(320.0-sub)), height*((736-sub)/(480.0-sub)));
//    }
    
    return rect;
}
//宽度适配
-(CGFloat)width:(CGFloat)oldWidth{
    CGFloat newWidth;
//    if (kIPHONE4 || kIPHONE5){
//        newWidth = oldWidth*320/375;
//    }else if (kIPHONE6){
//        newWidth = oldWidth;
//    }else{
//        newWidth = oldWidth*414/375;
//    }
    return newWidth;
}
//高度适配
-(CGFloat)height:(CGFloat)oldHeight{
    CGFloat newheight;
//    if (kIPHONE4 || kIPHONE5){
//        newheight = oldHeight;
//    }else if (kIPHONE6){
//        newheight = oldHeight*667/480;
//    }else{
//        newheight = oldHeight*736/480;
//    }
    return newheight;
}

//颜色
#define DEFAULT_VOID_COLOR [UIColor whiteColor]
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
@end
