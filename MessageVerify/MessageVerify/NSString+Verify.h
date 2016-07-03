//
//  NSString+Verify.h
//  02-正则表达式实战[理解]
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

- (BOOL) isQQ;

- (BOOL) isPhone;

- (BOOL) isEmail;

@end
