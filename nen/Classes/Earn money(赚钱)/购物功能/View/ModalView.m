//
//  ModalView.m
//  nen
//
//  Created by nenios101 on 2017/3/7.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "ModalView.h"

@implementation ModalView
- (IBAction)closeBtn:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"close" object:self];
}
- (IBAction)confirmBtn:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"confirm" object:self];
}

@end
