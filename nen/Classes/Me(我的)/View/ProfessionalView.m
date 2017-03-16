//
//  ProfessionalView.m
//  nen
//
//  Created by nenios101 on 2017/3/2.
//  Copyright © 2017年 nen. All rights reserved.
//

#import "ProfessionalView.h"

@interface ProfessionalView ()


@end

@implementation ProfessionalView

// 开微店
- (IBAction)SmallShop:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"weidian" object:self];
}
// 做顾问
- (IBAction)consultant:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"consultant" object:self];
}
// 当老师
- (IBAction)teacher:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"doTeacher" object:self];
}
// 做师傅

- (IBAction)master:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"doMaster" object:self];
}


// 我的职业

- (IBAction)professionalBtn:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"profess" object:self];
}

@end
