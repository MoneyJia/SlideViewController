//
//  UILabel+extension.m
//  PhotoAlbum
//
//  Created by 孙培杰 on 16/9/5.
//  Copyright © 2016年 sancaigongsi. All rights reserved.
//

#import "UILabel+extension.h"

@implementation UILabel (extension)

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
