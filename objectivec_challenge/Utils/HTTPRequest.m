//
//  HTTPRequest.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

+ (void)getGenres:(void (^)(NSArray *, NSError *))completion {
    
    NSString *urlString =  @"https://api.themoviedb.org/3/genre/movie/list?api_key=bd376c11b6a9bcd6645d26cc74bfe7c3&language=en-US";
    NSURL *url = [NSURL URLWithString:urlString];

    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        NSArray *resultJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"Failed %@", err);
        }
        
        completion(resultJSON, error);
    }] resume];
}

+ (void)getNowPlaying:(NSInteger) page completion:(void (^)(NSArray *, NSError *))completion {

    NSString *urlString = @"https://api.themoviedb.org/3/movie/now_playing?api_key=bd376c11b6a9bcd6645d26cc74bfe7c3&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString:urlString];

    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSError *err;
        NSArray *resultJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];

        if (err) {
            NSLog(@"Failed %@", err);
        }

        completion(resultJSON, error);
    }] resume];
}

+ (void)getPopular:(NSInteger) page completion:(void (^)(NSArray *, NSError *))completion {

    NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=bd376c11b6a9bcd6645d26cc74bfe7c3&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString:urlString];

    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSError *err;
        NSArray *resultJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];

        if (err) {
            NSLog(@"Failed %@", err);
        }

        completion(resultJSON, error);
    }] resume];
}

@end
