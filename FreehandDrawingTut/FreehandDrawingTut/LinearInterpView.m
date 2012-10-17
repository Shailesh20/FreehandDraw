//
//  LinearInterpView.m
//  FreehandDrawingTut
//
//  Created by David Sivocha on 17/10/2012.
//  Copyright (c) 2012 ThreeHive. All rights reserved.
//

#import "LinearInterpView.h"
@implementation LinearInterpView
{
    UIBezierPath *path; // (3)
    UISegmentedControl *segmentedControl;
}

- (IBAction)clearPath:(id)sender {
    [path removeAllPoints];
    [self setNeedsDisplay];
}
- (IBAction)setStroke:(id)sender {
    switch ([sender selectedSegmentIndex])
    {
        case 0:
        {
            [path setLineWidth:1.0];
            break;
        }
        case 1:
        {
            [path setLineWidth:2.0];
            break;
        }
        case 2:
        {
            [path setLineWidth:3.0];
            break;
        }
        case 3:
        {
            [path setLineWidth:4.0];
            break;
        }
        case 4:
        {
            [path setLineWidth:5.0];
            break;
        }
        case 5:
        {
            [path setLineWidth:6.0];
            break;
        }
        case 6:
        {
            [path setLineWidth:7.0];
            break;
        }
        case 7:
        {
            [path setLineWidth:8.0];
            break;
        }
    };
    [self setNeedsDisplay];
}

- (id)initWithCoder:(NSCoder *)aDecoder // (1)
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setMultipleTouchEnabled:NO]; // (2)
        [self setBackgroundColor:[UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
    }
    return self;
}
- (void)drawRect:(CGRect)rect // (5)
{
    [[UIColor blackColor] setStroke];
    [path stroke];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p]; // (4)
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}
@end

