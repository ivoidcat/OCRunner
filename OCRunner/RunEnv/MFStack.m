//
//  ANEStack.m
//  MangoFix
//
//  Created by jerry.yong on 2018/2/28.
//  Copyright © 2018年 yongpengliang. All rights reserved.
//

#import "ORArgsStack.h"
#import <MFValue.h>
@implementation ORArgsStack{
	NSMutableArray<NSMutableArray *> *_arr;
}
+ (instancetype)argsStack{
    //每一个线程拥有一个独立的参数栈
    NSMutableDictionary *threadInfo = [[NSThread currentThread] threadDictionary];
    ORArgsStack *stack = threadInfo[@"argsStack"];
    if (!stack) {
        stack = [[ORArgsStack alloc] init];
        threadInfo[@"argsStack"] = stack;
    }
    return stack;
}
- (instancetype)init{
	if (self = [super init]) {
		_arr = [NSMutableArray array];
	}
	return self;
}

- (void)push:(NSMutableArray <MFValue *> *)value{
    NSAssert(value, @"value can not be nil");
	[_arr addObject:value];
}

- (NSMutableArray <MFValue *> *)pop{
	NSMutableArray *value = [_arr  lastObject];
    NSAssert(value, @"stack is empty");
	[_arr removeLastObject];
	return value;
}
- (BOOL)isEmpty{
    return [_arr count] == 0;
}
- (NSUInteger)size{
	return _arr.count;
}
@end

