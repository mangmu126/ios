//
//  BottomView.m
//  nen
//
//  Created by nenios101 on 2017/3/10.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "BottomView.h"

@interface BottomView()

@end

@implementation BottomView

- (IBAction)BabyManage:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"baby" object:self];
}
- (IBAction)shopIntroduceBtn:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"introfuce" object:self];
}
- (IBAction)theSellerbtn:(UIButton *)sender
{
    NSLog(@"联系卖家");
}

@end
