//
//  MovieCoverView.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 18/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCoverView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

- (void)setImage:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
