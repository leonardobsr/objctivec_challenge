//
//  MovieListTableViewCell.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieHeaderView.h"
#import "TMBResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet MovieHeaderView *movieHeaderView;

+ (MovieListTableViewCell *)cellFromNibNamed:(NSString *)nibName;
- (void)setData:(TMBMovie *)movie;

@end

NS_ASSUME_NONNULL_END
