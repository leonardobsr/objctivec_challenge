//
//  MainViewController.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 17/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
    
@end

@implementation MainViewController
{
    NSArray *popularMovies;
    NSArray *nowPlaying;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    nowPlaying = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", nil];
    
    popularMovies = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    self.navigationItem.title = @"Movies";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.navigationItem.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.navigationItem.searchController.searchBar.delegate = self;
    [self.navigationItem.searchController.searchBar sizeToFit];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.contentView.hidden = NO;
    self.loading.hidesWhenStopped = YES;
//    [self.loading startAnimating];
    [self.loading stopAnimating];
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
    if (section == 0) {
        return [nowPlaying count];
    }
    return [popularMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MovieListTableViewCell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil) {
        cell = (MovieListTableViewCell *)[MovieListTableViewCell cellFromNibNamed:simpleTableIdentifier];
    }
    
    NSString *movieJson = [[NSString alloc] init];
    
    movieJson = indexPath.section == 0 ? nowPlaying[indexPath.row] : popularMovies[indexPath.row];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MovieDetail"]) {
      DetailViewController *d = (DetailViewController *)segue.destinationViewController;
//      d.title = segue.identifier;
//      d.itemForDetail = item;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"MovieDetail" sender:self];
}

@end
