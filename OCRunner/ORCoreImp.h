//
//  ORImp.h
//  OCRunner
//
//  Created by Jiang on 2020/6/8.
//  Copyright © 2020 SilverFruity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFBlock.h"
@class MFValue;
extern void blockInter(struct MFSimulateBlock *block);
extern void methodIMP(void);
extern void getterImp(id target, SEL sel);
extern void setterImp(id target, SEL sel, void *newValue);
extern MFValue *invoke_sueper_values(id instance, SEL sel, NSArray<MFValue *> *argValues);
extern void invoke_functionPointer(void *funptr, NSArray<MFValue *> *argValues, MFValue * returnValue);