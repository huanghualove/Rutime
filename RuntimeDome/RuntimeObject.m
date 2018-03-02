//
//  RuntimeObject.m
//  RuntimeDome
//
//  Created by 黄华 on 2018/3/2.
//  Copyright © 2018年 huanghua. All rights reserved.
//

#import "RuntimeObject.h"
#import "UIImage+swizImage.h"
#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@interface RuntimeObject () <NSFileManagerDelegate>

@property (nonatomic, strong) NSDictionary *privateProperty;

@end


@implementation RuntimeObject{
    NSArray *_variA;
    NSInteger _variB;
}


+(void)classMethod {
    
}

-(void)publicMethod {
    
}

- (void)privateMethod {
    NSLog(@"私有方法，用runtime调用了！\n\n\n");
}


/** 消息转发 没有找到SEL时会执行 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    // 1. 如果方法名是hh_addMethod，就添加一个MethodOne方法来执行
    if (sel == NSSelectorFromString(@"hh_addMethod")) {
        class_addMethod(self, sel, (IMP)MethodOne, "v@:");
        return YES;
    }
    // 2. 如果找不到方法，就添加一个addMethod来执行
    [self addMethodWithSEL:sel methodIMP:@selector(addMethod)];
    return YES;
}

void MethodOne(id self, SEL _cmd) {
    
    NSLog(@"接收到名字是hh_addMethod的方法,就会来到这个添加的方法里\n\n\n");
}


- (void)addMethod {
    NSLog(@"接收到未知的消息,就会来到这个添加的方法里\n\n\n");
}


@end
