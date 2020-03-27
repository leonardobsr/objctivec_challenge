//
//  DetailViewController.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 17/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieHeaderView.h"
#import "TMBResponse.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) TMBMovie *movie;

@property (weak, nonatomic) IBOutlet MovieHeaderView *movieHeaderView;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@end
