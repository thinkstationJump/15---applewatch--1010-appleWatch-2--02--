//
//  InterfaceController.m
//  02-计算器 WatchKit 1 Extension
//
//  Created by xiaomage on 15/10/10.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "InterfaceController.h"

typedef enum : NSUInteger {
    WKCalculatTypeUnknown,
    
    WKCalculatTypePlus,
    WKCalculatTypeMinus,
    WKCalculatTypeMulti,
    WKCalculatTypeDivide
} WKCalculatType;


@interface InterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *resLab;

/** 运算符前的字符串 */
@property (nonatomic, copy) NSMutableString *perStr;
/** 当前要拼接的字符串 */
@property (nonatomic, copy) NSMutableString *curStr;

/** 记录当前的计算方式 */
@property (nonatomic, assign) WKCalculatType curCalType;

@end


@implementation InterfaceController

// lazy
- (NSMutableString *)perStr
{
    if (!_perStr) {
        _perStr = [NSMutableString string];
    }
    return _perStr;
}

- (NSMutableString *)curStr
{
    if (!_curStr) {
        _curStr = [NSMutableString string];
    }
    return _curStr;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - 按钮点击
- (IBAction)chu {
    [self touchWithCalType:WKCalculatTypeDivide];
}
- (IBAction)cheng {
    [self touchWithCalType:WKCalculatTypeMulti];
}
- (IBAction)jian {
    [self touchWithCalType:WKCalculatTypeMinus];
}
- (IBAction)jia {
    [self touchWithCalType:WKCalculatTypePlus];
}




- (IBAction)equal {
    // 1.先计算结果
    
    // 2.展示
    switch (self.curCalType) {
        case WKCalculatTypePlus:
            //
            [self.resLab setText: [NSString stringWithFormat:@"%.f", (self.perStr.doubleValue + self.curStr.doubleValue)]];
            break;
        case WKCalculatTypeMinus:
            //
            [self.resLab setText: [NSString stringWithFormat:@"%.f", (self.perStr.doubleValue - self.curStr.doubleValue)]];
            break;
        case WKCalculatTypeMulti:
            //
            [self.resLab setText: [NSString stringWithFormat:@"%.f", (self.perStr.doubleValue * self.curStr.doubleValue )]];
            break;
        case WKCalculatTypeDivide:
            //
            [self.resLab setText: [NSString stringWithFormat:@"%.f", (self.perStr.doubleValue / self.curStr.doubleValue)]];
            break;
            
        default:
            break;
    }
    
}


- (IBAction)point {
    [self touchWithNumStr:@"."];
}
- (IBAction)touch0 {
    if (!self.curStr.integerValue) {
        return;
    }
    [self touchWithNumStr:@"0"];
}
- (IBAction)touch1 {
    [self touchWithNumStr:@"1"];
}
- (IBAction)touch2 {
    [self touchWithNumStr:@"2"];
}
- (IBAction)touch3 {
    [self touchWithNumStr:@"3"];
}
- (IBAction)touch4 {
    [self touchWithNumStr:@"4"];
}
- (IBAction)touch5 {
    [self touchWithNumStr:@"5"];
}
- (IBAction)touch6 {
    [self touchWithNumStr:@"6"];
}
- (IBAction)touch7 {
    [self touchWithNumStr:@"7"];
}
- (IBAction)touch8 {
    [self touchWithNumStr:@"8"];
}
- (IBAction)touch9 {
    [self touchWithNumStr:@"9"];
}

#pragma mark - 自定义方法
// 点击数字的时候要实现的几部
- (void)touchWithNumStr:(NSString *)str
{
    // 1.拼接当前的数字
    [self.curStr appendString:str];
    
    // 2.让lab展示当前的数字
    [self.resLab setText:self.curStr];
}
// 点击运算符的时候调用的方法
- (void)touchWithCalType:(WKCalculatType)type {
    // 让当前的数字变成前面的数字
    self.perStr = self.curStr;
    // 让当前的数字重置
    self.curStr = nil;
    // 记录计算方式是+/-/×/÷
    self.curCalType = type;
}

@end



