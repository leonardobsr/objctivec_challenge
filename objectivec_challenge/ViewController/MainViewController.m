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
    [[HTTPRequest alloc] initWithParams:@"getGenres" params:nil];
//    NSString *endpoint = HTTPRequest.endPoints[@"getGenres"];
//    NSLog(@"endpoint %@", endpoint);
//    NSDictionary *params = @{
//        @"page": @1
//    };
//    NSLog(@"params %@", params);
    

//    await new API(endpoint, params).request()
//        .then(response => {
//            this.dataTable.items = response.body.result.items
//            this.dataTable.totalItems = response.body.result.count
//            this.search.ready = true
//            this.dataTable.loading = false
//        }, (e) => {
//            this.$helpers.requestError(e)
//        })
//    [[[HTTPRequest alloc] initWithParams:@"getGenres" params:nil] ];
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_enter_Nullable(group);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        [HTTPRequest getGenres:^(NSDictionary * _Nonnull strings, NSError * _Nonnull err) {
//            NSLog(@"1 done %@", strings);
//            dispatch_group_leave(group);
//        }];
//    });
//
//    dispatch_group_enter(group);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        [HTTPRequest getNowPlaying:1 completion:^(NSDictionary * _Nonnull strings, NSError * _Nonnull err) {
//            NSLog(@"2 done %@", strings[@"results"]);
//            for (NSDictionary *movieDict in strings[@"results"]) {
//                TMBMovie *movie = TMBMovie.new;
//                [self->nowPlaying addObject:movie];
//            }
//            dispatch_group_leave(group);
//        }];
//    });
//
//    dispatch_group_enter(group);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        [HTTPRequest getPopular:1 completion:^(NSDictionary * _Nonnull strings, NSError * _Nonnull err) {
//            NSLog(@"3 done %@", strings);
//            dispatch_group_leave(group);
//        }];
//    });
//
//    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        NSLog(@"finally!");
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    });
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
