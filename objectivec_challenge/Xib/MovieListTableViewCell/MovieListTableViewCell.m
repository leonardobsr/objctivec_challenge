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

//+(void)setTheName:(NSString *)fullName{
//    self.fullName = fullName;
//}
//
//+(NSString *)theName{
//    return self.fullName;
//}

+ (void)printStuff:(NSString *)stuff
{
    [self printStuff:stuff];
}

@end
