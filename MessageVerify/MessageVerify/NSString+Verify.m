//
//  NSString+Verify.m
//  02-正则表达式实战[理解]
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)

- (BOOL) isQQ {
    NSString *pattern = @"^[1-9]\\d{5,10}$";
    return [self matchWithPattern:pattern];
}

- (BOOL) isPhone{
    NSString *pattern = @"^(0|86)?1([358][0-9]|7[678]|4[57])\\d{8}$";
    return [self matchWithPattern:pattern];
}

- (BOOL) isEmail {
    NSString *pattern = @"^[a-z0-9]+([\\._\\-]*[a-z0-9])*@([a-z0-9]+\\-*[a-z0-9]+.){1,3}[a-z0-9]+$";
    return [self matchWithPattern:pattern];
}


/**
 *  正则匹配
 *
 *  @param content 匹配的内容
 *  @param pattern 匹配模式
 */
- (BOOL)matchWithPattern:(NSString *) pattern {
    
    NSError *error = nil;
    NSRegularExpression *regx = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
//  在开发时候会崩溃
    NSAssert(error == nil, @"你的模式字符串格式有误:%@",error);

//  匹配
    NSTextCheckingResult *rs = [regx firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    if (rs) {
        return YES;
    }else{
        return NO;
    }
}


@end
