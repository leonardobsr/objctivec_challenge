//
//  MovieListTableViewCell.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "MovieListTableViewCell.h"

@implementation MovieListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MovieListTableViewCell *)cellFromNibNamed:(NSString *)nibName {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    MovieListTableViewCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[MovieListTableViewCell class]]) {
            customCell = (MovieListTableViewCell *)nibItem;
            break;
        }
    }
    return customCell;
}

- (void)setData:(TMBMovie *)movie {
    [self.movieHeaderView.movieCoverView setImage:movie.posterPath];
    [self.movieHeaderView.titleLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightSemibold]];
    [self.movieHeaderView.textLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightRegular]];
    self.movieHeaderView.titleLabel.text = movie.title;
    self.movieHeaderView.textLabel.text = [NSString stringWithFormat:@"%@%@", [movie.overview substringWithRange:NSMakeRange(0, MIN([movie.overview length], 122))], @"..."];
    [self.movieHeaderView.movieRatingView setRating:[NSString stringWithFormat:@"%@", movie.voteAverage]];
}

@end
