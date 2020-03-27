//
//  MovieHeaderView.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 18/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "MovieHeaderView.h"

@implementation MovieHeaderView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"MovieHeaderView" owner:self options:nil];
        self.view.frame = self.bounds;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.titleLabel.text = @"Titulo";
        self.textLabel.textColor = [UIColor colorWithRed:0.51 green:0.51 blue:0.51 alpha:1];
        self.textLabel.text = @"Texto";
        [self addSubview:self.view];
    }
    return self;
}

@end
