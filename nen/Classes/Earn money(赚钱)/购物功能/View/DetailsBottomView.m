//
//  DetailsBottomView.m
//  nen
//
//  Created by nenios101 on 2017/3/7.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "DetailsBottomView.h"

@implementation DetailsBottomView

- (IBAction)btnClick:(UIButton *)sender
{
   [[NSNotificationCenter defaultCenter] postNotificationName:@"modalView" object:self userInfo:nil];

   
    
    
}


@end
