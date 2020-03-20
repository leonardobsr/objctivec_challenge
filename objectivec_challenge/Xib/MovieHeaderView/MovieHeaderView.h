//
//  MovieHeaderView.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 18/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCoverView.h"
#import "MovieRatingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieHeaderView : UIView

@property(atomic) NSString *fullName;
@property (nonatomic, nullable, strong) NSString *movie;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIStackView *hStackView;
@property (weak, nonatomic) IBOutlet MovieCoverView *movieCoverView;
@property (weak, nonatomic) IBOutlet UIStackView *vStackView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet MovieRatingView *movieRatingView;

@end

NS_ASSUME_NONNULL_END
