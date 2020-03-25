//
//  MainViewController.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 17/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "HTTPRequest.h"
#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
    
@end

@implementation MainViewController
{
//    NSMutableArray<TMBMovie *> *popularMovies;
//    NSMutableArray<TMBMovie *> *nowPlaying;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    nowPlaying = NSMutableArray.new;
//    popularMovies = NSMutableArray.new;
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;

    self.navigationItem.title = @"Movies";

    self.navigationItem.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.navigationItem.searchController.searchBar.delegate = self;
    [self.navigationItem.searchController.searchBar sizeToFit];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.contentView.hidden = NO;
    self.loading.hidesWhenStopped = YES;
//    [self.loading startAnimating];
    [self.loading stopAnimating];
    [self fetchMoviesUsingJSON];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar.items[0] setTitle:@"Movies"];
}

- (void)fetchMoviesUsingJSON {
    NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetPopular]];
    endpointParams[@"language"] = @"en-US";
    endpointParams[@"page"] = @1;
    [[HTTPRequest alloc] endPoint:EndPointGetPopular params:endpointParams request:^(TMBResponse * response, NSError * _Nonnull err) {
        NSLog(@"1 done %@", response.results);
    }];
//    NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetGenres]];
//    endpointParams[@"language"] = @"en-US";
//    [[[HTTPRequest alloc] initWithEndpoint:EndPointGetGenres withParams:endpointParams] request:^(TMBResponse * response, NSError * _Nonnull err) {
//        NSLog(@"1 done %@", response.results);
//    }];
//    
//    endpoint = [[NSMutableDictionary alloc] initWithDictionary:HTTPRequest.endPoints[@"getPopular"]];
//    endpoint[@"language"] = @"en-US";
//    endpoint[@"page"] = @1;
//    [[[HTTPRequest alloc] initWithEndpoint:endpoint] request:^(TMBResponse * response, NSError * _Nonnull err) {
//        NSLog(@"2 done %@", response.results);
//    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIFont* boldFont = [UIFont boldSystemFontOfSize:17];
    UILabel *label = [[UILabel alloc] init];
    [label setFont:boldFont];
    label.text = @"Popular Movies";
    label.backgroundColor = UIColor.systemBackgroundColor;
    if (section == 0) {
        label.text = @"Now Playing";
        
    }
    return label;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0) {
//        return [nowPlaying count];
//    }
//    return [popularMovies count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MovieListTableViewCell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil) {
        cell = (MovieListTableViewCell *)[MovieListTableViewCell cellFromNibNamed:simpleTableIdentifier];
    }
    
//    NSString *movieJson = [[NSString alloc] init];
//
//    movieJson = indexPath.section == 0 ? nowPlaying[indexPath.row] : popularMovies[indexPath.row];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MovieDetail"]) {
//      DetailViewController *d = (DetailViewController *)segue.destinationViewController;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"MovieDetail" sender:self];
}

@end
