//
//  StarView.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGRect bounds = self.bounds;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] setStroke];
    [[UIColor lightGrayColor] setFill];
    CGContextSetLineWidth(context, 1.0);
    
    CGRect baseRect = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.height, bounds.size.height);
    CGPoint center = CGPointMake(bounds.size.height/2, bounds.size.height/2);
    
    for (int i = 0; i < 5; i++) {
                
        CGRect localRect = CGRectOffset(baseRect, i * bounds.size.height, 0);
        
        CGContextFillRect(context, localRect);
        CGContextStrokeRect(context, localRect);
        
        CGFloat shorterSide = MIN(localRect.size.width, localRect.size.height);
        CGFloat radius = shorterSide / 2.5;
        
        UIColor *starColor;
        
        if (self.rating > i) {
            starColor = [UIColor redColor];
        } else {
            starColor = [UIColor whiteColor];
        }

        [self drawStarAtPoint:center withRadius:radius withColor:starColor inContext:context];
        center.x += bounds.size.height;
    }
}

- (void)drawStarAtPoint:(CGPoint)center withRadius:(CGFloat)radius withColor:(UIColor *)color inContext:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    CGContextBeginPath(context);
    
    [color setFill];
    
    CGFloat theta = 2 * M_PI / 20;
    CGContextMoveToPoint(context,
                         center.x + radius * cosf(theta),
                         center.y - radius * sinf(theta)
                         );
    
    theta += 2 * M_PI * 2 / 5;
    CGContextAddLineToPoint(context,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
    theta += 2 * M_PI * 2 / 5;
    CGContextAddLineToPoint(context,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
    theta += 2 * M_PI * 2 / 5;
    CGContextAddLineToPoint(context,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
    theta += 2 * M_PI * 2 / 5;
    CGContextAddLineToPoint(context,
                            center.x + radius * cosf(theta),
                            center.y - radius * sinf(theta)
                            );
    
    
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
}


@end
