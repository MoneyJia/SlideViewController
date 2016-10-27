//
//  UILabel+extension.h
//  PhotoAlbum
//
//  Created by 孙培杰 on 16/9/5.
//  Copyright © 2016年 sancaigongsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (extension)

+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title bold:(int)index textAlignment:(int)textAlignment;

+(UILabel *)labelWithFram:(CGRect)frame font:(NSInteger)font tintColor:(UIColor *)color andTitle:(NSString *)title bold:(int)index textAlignment:(int)textAlignment isBorder:(int)isBorder cornerRadius:(int)cornerRadius;

@end
