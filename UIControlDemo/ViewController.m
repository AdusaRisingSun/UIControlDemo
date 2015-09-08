//
//  ViewController.m
//  UIControlDemo
//
//  Created by Adusa on 15/8/28.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "CustomSlider.h"
@interface ViewController ()
@end

@implementation ViewController
{
    CustomSlider *_slider;
    UIImageView *_arrowImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _slider=[CustomSlider slider];
    _slider.minimumTrackTintColor=[UIColor redColor];
    _slider.maximumTrackTintColor=[UIColor yellowColor];
    _slider.center=CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    [_slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    _arrowImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icotrip-bonhomme-02.png"]];
    _arrowImage.frame=CGRectMake(0, 100, 120, 90);
    UIImageView *bearImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icotrip-toyz-10.png"]];
    bearImage.frame=CGRectMake(self.view.bounds.size.width/2.0+50, 100, 120, 90);
    [self.view addSubview:_arrowImage];
    [self.view addSubview:bearImage];
    
        // Do any additional setup after loading the view, typically from a nib.
}

-(void)valueChanged:(UISlider*)slider
{
    _arrowImage.center=CGPointMake((self.view.bounds.size.width/2.0+50)*slider.value+60, 100+45);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
