//
// Created by Dan Xin on 2017/3/30.
// Copyright (c) 2017 DaVinci42. All rights reserved.
//

#import "UIView+DVC.h"

@implementation UIView (DVC)

- (CGFloat)getWidth {
    return self.frame.size.width;
}

- (CGFloat)getHeight {
    return self.frame.size.height;
}

- (CGFloat)getTop {
    return self.frame.origin.y;
}

- (CGFloat)getLeft {
    return self.frame.origin.x;
}

- (CGFloat)getBottom {
    return self.top + self.height;
}

- (CGFloat)getRight {
    return self.left + self.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = CGRectMake(self.getLeft, self.top, width, self.height);
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = CGRectMake(self.left, self.top, self.width, height);
    self.frame = frame;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

@end