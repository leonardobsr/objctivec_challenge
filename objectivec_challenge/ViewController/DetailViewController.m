//
//  DetailViewController.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 17/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"Movie Details";

    self.movieHeaderView.hidden = YES;
    self.textView.hidden = YES;
    
    self.overviewLabel.hidden = YES;
    [self.overviewLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightSemibold]];
    [self.textView setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]];
    self.textView.textColor = [UIColor colorWithRed:0.51 green:0.51 blue:0.51 alpha:1];
    self.overviewLabel.backgroundColor = UIColor.systemBackgroundColor;

    self.loading.hidesWhenStopped = YES;
    [self.loading startAnimating];
    [self setData:self.movie];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar.items[0] setTitle:@""];
}

- (void)setData:(TMBMovie *)movie {
    [self.movieHeaderView.movieCoverView setImage:movie.posterPath];
    [self.movieHeaderView.titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightSemibold]];
    self.movieHeaderView.titleLabel.text = movie.title;
    [self.movieHeaderView.textLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    self.movieHeaderView.textLabel.text = movie.genres;
    [self.movieHeaderView.movieRatingView setRating:[NSString stringWithFormat:@"%@", movie.voteAverage]];
    self.textView.text = movie.overview;
    
    [self.loading stopAnimating];
    self.movieHeaderView.hidden = NO;
    self.overviewLabel.hidden = NO;
    self.textView.hidden = NO;
}

@end
