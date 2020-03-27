//
//  TMBViewModel.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 26/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "HTTPRequest.h"
#import "TMBResponse.h"
#import "TMBViewModel.h"

@implementation TMBViewModel

- (void)getFeed:(void (^)(NSMutableDictionary *, NSError *))completion {
    NSLog(@"Feed");
    NSError *err;
    NSMutableArray *genres = [[NSMutableArray alloc] init];
    NSMutableDictionary *feed = [[NSMutableDictionary alloc] init];
    [feed setObject:[[NSMutableArray alloc] init] forKey:@"popular"];
    [feed setObject:[[NSMutableArray alloc] init] forKey:@"nowPlaying"];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetGenres]];
        endpointParams[@"language"] = @"en-US";
        [[HTTPRequest alloc] endPoint:EndPointGetGenres params:endpointParams request:^(TMBResponse * _Nonnull response, NSError * _Nonnull err) {
            [genres setArray:response.genres];
            dispatch_group_leave(group);
        }];
    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetPopular]];
        endpointParams[@"language"] = @"en-US";
        endpointParams[@"page"] = @1;
        [[HTTPRequest alloc] endPoint:EndPointGetPopular params:endpointParams request:^(TMBResponse * _Nonnull response, NSError * _Nonnull err) {
            for (TMBMovie *movie in response.results) {
                [feed[@"popular"] addObject:movie];
            }
            dispatch_group_leave(group);
        }];
    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetNowPlaying]];
        endpointParams[@"language"] = @"en-US";
        endpointParams[@"page"] = @1;
        [[HTTPRequest alloc] endPoint:EndPointGetNowPlaying params:endpointParams request:^(TMBResponse * _Nonnull response, NSError * _Nonnull err) {
            for (TMBMovie *movie in response.results) {
                [feed[@"nowPlaying"] addObject:movie];
            }
            dispatch_group_leave(group);
        }];
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"finally!");
        dispatch_async(dispatch_get_main_queue(), ^{
            for (TMBMovie *movie in feed[@"popular"]) {
                movie.posterPath = [self getImageUrl:movie.posterPath];
                movie.genres = [self formatGenres:movie.genreIDS genres:genres];
            }
            for (TMBMovie *movie in feed[@"nowPlaying"]) {
                movie.posterPath = [self getImageUrl:movie.posterPath];
                movie.genres = [self formatGenres:movie.genreIDS genres:genres];
            }
            completion(feed, err);
        });
    });
}
- (void)getGenres {
//    NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetPopular]];
//    endpointParams[@"language"] = @"en-US";
//    endpointParams[@"page"] = @1;
//    [[HTTPRequest alloc] endPoint:EndPointGetPopular params:endpointParams request:^(TMBResponse * response, NSError * _Nonnull err) {
//        NSLog(@"1 done %@", response.results);
//    }];
}
- (void)params:(NSDictionary *)params getPopular:(void (^)(NSMutableArray *, NSError *))completion {
//    NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetPopular]];
//   endpointParams[@"language"] = @"en-US";
//   endpointParams[@"page"] = @1;
//   [[HTTPRequest alloc] endPoint:EndPointGetPopular params:endpointParams request:^(TMBResponse * response, NSError * _Nonnull err) {
//       NSLog(@"1 done %@", response.results);
//   }];
}
- (void)params:(NSDictionary *)params getNowPlaying:(void (^)(NSMutableArray *, NSError *))completion {
//    NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointGetPopular]];
//    endpointParams[@"language"] = @"en-US";
//    endpointParams[@"page"] = @1;
//    [[HTTPRequest alloc] endPoint:EndPointGetPopular params:endpointParams request:^(TMBResponse * response, NSError * _Nonnull err) {
//        NSLog(@"1 done %@", response.results);
//    }];
}

- (void)query:(NSString *)query_ searchMovie:(void (^)(NSMutableDictionary *, NSError *))completion {
//    NSMutableDictionary *endpointParams = [[NSMutableDictionary alloc] initWithDictionary:[HTTPRequest getEndPointParams:EndPointSearchMovie]];
//    endpointParams[@"language"] = @"en-US";
//    [[HTTPRequest alloc] endPoint:EndPointSearchMovie params:endpointParams request:^(TMBResponse * _Nonnull response, NSError * _Nonnull err) {
//        for (TMBMovie *movie in response.results) {
//            [feed[@"nowPlaying"] addObject:movie];
//        }
//    }];
}

- (NSString *)getImageUrl:(NSString *)imageUrl {
    return [NSString stringWithFormat: @"%@%@", [HTTPRequest getImageBaseUrl], imageUrl];
}

- (NSString *)formatGenres:(NSArray *)genresIds genres:(NSMutableArray *)genres {
    NSMutableString *genresString = [[NSMutableString alloc] init];
    for (NSNumber *genreid in genresIds) {
        for (TMBGenre *genre in genres) {
            if (genre.identifier == genreid) {
                if ([genresIds indexOfObject:genreid] == 0) {
                    genresString = [NSMutableString stringWithFormat: @"%@%@", genresString, genre.name];
                } else {
                    genresString = [NSMutableString stringWithFormat: @"%@%@ %@", genresString, @",", genre.name];
                }
            }
        }
    }
    return genresString;
}

@end
