//
//  MainViewController.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 17/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "TMBViewModel.h"
#import "TMBResponse.h"
#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
    
@end

@implementation MainViewController
{
    NSMutableArray<TMBMovie *> *popular;
    NSMutableArray<TMBMovie *> *nowPlaying;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    popular = NSMutableArray.new;
    nowPlaying = NSMutableArray.new;
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;

    self.navigationItem.title = @"Movies";

    self.navigationItem.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.navigationItem.searchController.searchBar.delegate = self;
    [self.navigationItem.searchController.searchBar sizeToFit];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.contentView.hidden = YES;
    self.loading.hidesWhenStopped = YES;
    [self.loading startAnimating];
    [[TMBViewModel alloc] getFeed:^(NSMutableDictionary * _Nonnull feed, NSError * _Nonnull error) {
        self->popular = feed[@"popular"];
        self->nowPlaying = feed[@"nowPlaying"];
        [self.tableView reloadData];
        [self.loading stopAnimating];
        self.contentView.hidden = NO;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar.items[0] setTitle:@"Movies"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *viewLabel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 346, 21)];
    viewLabel.backgroundColor = UIColor.systemBackgroundColor;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 346, 21)];
    [label setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightSemibold]];
    label.text = (section == 0) ? @"Popular Movies" : @"Now Playing";
    [viewLabel addSubview:label];
    return viewLabel;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [nowPlaying count];
    }
    return [popular count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MovieListTableViewCell";
 
    MovieListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil) {
        cell = (MovieListTableViewCell *)[MovieListTableViewCell cellFromNibNamed:simpleTableIdentifier];
    }
    
    TMBMovie *movie = TMBMovie.new;
    movie = indexPath.section == 0 ? nowPlaying[indexPath.row] : popular[indexPath.row];
    
    [cell setData:movie];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(TMBMovie *)sender {
    if ([segue.identifier isEqualToString:@"MovieDetail"]) {
        DetailViewController *d = (DetailViewController *)segue.destinationViewController;
        d.movie = sender;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TMBMovie *movie = TMBMovie.new;
    movie = indexPath.section == 0 ? nowPlaying[indexPath.row] : popular[indexPath.row];
    [self performSegueWithIdentifier:@"MovieDetail" sender:movie];
}

@end
