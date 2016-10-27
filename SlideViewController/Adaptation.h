//
//  Adaptation.h
//  PhotoAlbum
//
//  Created by 朱前进 on 15/9/21.
//  Copyright (c) 2015年 sancaigongsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Adaptation : NSObject

+ (CGRect) initWithNewFrame:(CGRect )rect;
+ (CGFloat) initWithNewCGfloatX:(CGFloat )f;
+ (CGFloat) initWithNewCGfloatY:(CGFloat )f;
+ (NSString *)exchangeGetNewStr:(NSString *)flyleaf_str;

@end
