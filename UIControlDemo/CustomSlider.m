//
//  CustomSlider.m
//  UIControlDemo
//
//  Created by Adusa on 15/8/31.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "CustomSlider.h"
#import "Thumb.h"
@implementation CustomSlider
{
    float previousValue;
    Thumb *_thumb;
}

-(void)updateThumb
{
    if ((self.value<0.98)&&(ABS(self.value-previousValue)<0.1f)) {
        return;
    }
    UIImage *customImage=[_thumb thumbWithLevel:self.value];
    [self setThumbImage:customImage forState:UIControlStateHighlighted];
    previousValue=self.value;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
        previousValue=CGFLOAT_MIN;
         _thumb=[[Thumb alloc]init];
        [self setThumbImage:[_thumb simpleThumb] forState:UIControlStateNormal];
        self.value=0.0f;
        [self addTarget:self action:@selector(updateThumb) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

+(id)slider
{
    CustomSlider *slider=[[CustomSlider alloc]initWithFrame:(CGRect){.size=CGSizeMake(200.0f, 40.0f)}];
    return slider;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
