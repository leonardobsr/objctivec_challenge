//
//  MovieListTableViewCell.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListTableViewCell : UITableViewCell

@property (atomic) NSString *fullName;
@property (nonatomic, nullable, strong) NSString *movie;
@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet MovieHeaderView *movieHeaderView;

+ (MovieListTableViewCell *)cellFromNibNamed:(NSString *)nibName;
//+ (void)setTheName:(NSString *)fullName;
//+ (NSString *)theName;
+ (void)printStuff:(NSString *)stuff;
@end

NS_ASSUME_NONNULL_END
