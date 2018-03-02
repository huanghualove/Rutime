//
//  UIImage+swizImage.m
//  RuntimeDome
//
//  Created by 黄华 on 2018/3/2.
//  Copyright © 2018年 huanghua. All rights reserved.
//

#import "UIImage+swizImage.h"
#import "NSObject+Runtime.h"

@implementation UIImage (swizImage)


+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //写上方法交换···
        [self SwizzlingInstanceMethodWithOldMethod:@selector(imageNamed:) newMethod:@selector(hh_imageNamed:)];
        
    });
}



+ (nullable UIImage *)hh_imageNamed:(NSString *)name {
    NSLog(@"调用了被交换的方法hh_imageNamed\n\n\n");
    //如果图片存在，就显示
    if ([self hh_imageNamed:name]) {
        return [self hh_imageNamed:name];
    }else {
        //如果图片不存在，就显示占位图片
        return [self hh_imageNamed:@"test"];
    }
}

@end
