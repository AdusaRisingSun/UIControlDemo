//
//  Thumb.m
//  UIControlDemo
//
//  Created by Adusa on 15/8/28.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "Thumb.h"

@implementation Thumb
-(UIImage *)thumbWithLevel:(float)aLevel
{
    float INSERT_AMT=1.5f;
    CGRect baseRect=CGRectMake(0, 0, 40, 100);
    CGRect thumbRect=CGRectMake(0, 40, 40, 20);
    
    UIGraphicsBeginImageContext(baseRect.size);
    //设置上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //Create a filled rect for the thumb
    //set the fill color
    [[UIColor darkGrayColor]setFill];
    //画方框
    CGContextAddRect(context, CGRectInset(thumbRect, INSERT_AMT, INSERT_AMT));
    //填充形状内的颜色
    CGContextFillPath(context);
    
    // Outline the thumb
    [[UIColor whiteColor]setStroke];
    //设置线宽度
    CGContextSetLineWidth(context, 2.0f);
    //画方框,相对于thumbRect偏移2倍的INSERT_AMT
    CGContextAddRect(context, CGRectInset(thumbRect, 2.0f * INSERT_AMT, 2.0f * INSERT_AMT));
    //填充边框颜色
    CGContextStrokePath(context);
    
    // Create a filled ellipse for the indicator
    CGRect ellipseRect=CGRectMake(0, 0, 40, 40);
    [[UIColor colorWithWhite:aLevel alpha:1.0f]setFill];
    CGContextAddEllipseInRect(context, ellipseRect);
    CGContextFillPath(context);
    
    // Label with a number
    NSString *numstring=[NSString stringWithFormat:@"%0.1f",aLevel];
    UIColor *textColor=(aLevel>0.5f)?[UIColor blackColor]:[UIColor whiteColor];
    UIFont *font=[UIFont fontWithName:@"Georgia" size:20.0f];
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init];
    style.lineBreakMode=NSLineBreakByCharWrapping;
    style.alignment=NSTextAlignmentCenter;
    NSDictionary *attr=[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,style,NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName,nil];
    [numstring drawInRect:CGRectInset(ellipseRect, 0.0f, 6.0f) withAttributes:attr];
    
    // Outline the indicator circle
    [[UIColor grayColor]setStroke];
    CGContextSetLineWidth(context, 3.0f);
    CGContextAddEllipseInRect(context, CGRectInset(ellipseRect, 2.0f, 2.0f));
    CGContextStrokePath(context);
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
-(UIImage *)simpleThumb
{
    float INSERT_AMT=1.5f;
    CGRect baseRect=CGRectMake(0, 0, 40, 100);
    CGRect thumbRect=CGRectMake(0, 40, 40, 20);
    
    UIGraphicsBeginImageContext(baseRect.size);
    //设置上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //Create a filled rect for the thumb
    //set the fill color
    [[UIColor darkGrayColor]setFill];
    //画方框
    CGContextAddRect(context, CGRectInset(thumbRect, INSERT_AMT, INSERT_AMT));
    //填充形状内的颜色
    CGContextFillPath(context);
    
    // Outline the thumb
    [[UIColor whiteColor]setStroke];
    //设置线宽度
    CGContextSetLineWidth(context, 2.0f);
    //画方框,相对于thumbRect偏移2倍的INSERT_AMT
    CGContextAddRect(context, CGRectInset(thumbRect, 2.0f * INSERT_AMT, 2.0f * INSERT_AMT));
    //填充边框颜色
    CGContextStrokePath(context);
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
