//
//  Adaptation.m
//  PhotoAlbum
//
//  Created by 朱前进 on 15/9/21.
//  Copyright (c) 2015年 sancaigongsi. All rights reserved.
//

#import "Adaptation.h"
#import "AppDelegate.h"

@implementation Adaptation

+ (CGRect) initWithNewFrame:(CGRect )rect
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGRect newRect;
    
    newRect.origin.x = x * myDelegate.autoSizeScaleX;
    newRect.origin.y = y * myDelegate.autoSizeScaleY;
    
    newRect.size.width = width * myDelegate.autoSizeScaleX;
    newRect.size.height = height * myDelegate.autoSizeScaleY;
    
    return newRect;
}
+ (CGFloat) initWithNewCGfloatX:(CGFloat )f
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    f = f * myDelegate.autoSizeScaleX;
    return f;
}
+ (CGFloat) initWithNewCGfloatY:(CGFloat )f
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    f = f * myDelegate.autoSizeScaleY;
    return f;
}

@end
