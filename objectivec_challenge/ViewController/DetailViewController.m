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

    self.loading.hidesWhenStopped = YES;
    [self.loading stopAnimating];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar.items[0] setTitle:@""];
}

@end
