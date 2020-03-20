//
//  MovieCoverView.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 18/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "MovieCoverView.h"

@implementation MovieCoverView

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
        [[NSBundle mainBundle] loadNibNamed:@"MovieCoverView" owner:self options:nil];
        self.view.frame = self.bounds;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.view];
    }
    return self;
}

@end
