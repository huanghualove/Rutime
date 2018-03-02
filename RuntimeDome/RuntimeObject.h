//
//  RuntimeObject.h
//  RuntimeDome
//
//  Created by 黄华 on 2018/3/2.
//  Copyright © 2018年 huanghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeObject : NSObject

@property (nonatomic, copy) NSString *publicProperty;

- (void)publicMethod;

+ (void)classMethod;

@end
