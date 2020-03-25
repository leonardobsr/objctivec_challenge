//
//  HTTPRequest.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "HTTPRequest.h"
#import "TMBResponse.h"

@implementation HTTPRequest

+ (NSString *)baseUrl { return @"https://api.themoviedb.org/3/"; }
+ (NSString *)apiKey { return @"api_key=bd376c11b6a9bcd6645d26cc74bfe7c3"; }

+ (NSDictionary *)endPointParams
{
    return @{
             @(EndPointGetGenres) : @{
                     @"language": @""
             },
             @(EndPointGetPopular) : @{
                     @"language": @"",
                     @"page": @""
             },
             @(EndPointGetNowPlaying) : @{
                     @"language": @"",
                     @"page": @""
             }
    };
}

+ (NSDictionary *)getEndPointParams:(EndPoint)endpoint {
    return [HTTPRequest endPointParams][@(endpoint)];
}

+ (NSDictionary *)endPointPath:(NSDictionary *)params
{
    return @{
        @(EndPointGetGenres) : [NSString stringWithFormat: @"genre/movie/list?%@&language=%@", HTTPRequest.apiKey, params[@"language"]],
        @(EndPointGetPopular) : [NSString stringWithFormat: @"movie/popular?%@&language=%@&page=%@", HTTPRequest.apiKey, params[@"language"], params[@"page"]],
        @(EndPointGetNowPlaying) : [NSString stringWithFormat: @"movie/now_playing?%@&language=%@&page=%@", HTTPRequest.apiKey, params[@"language"], params[@"page"]]
    };
}

+ (NSString *)getEndPointPath:(EndPoint)endPoint params:(NSDictionary *)params {
    return [HTTPRequest endPointPath:params][@(endPoint)];
}

- (void)endPoint:(EndPoint)endPoint params:(NSDictionary *)params request:(void (^)(TMBResponse *, NSError *))completion {
    NSString *path = [HTTPRequest getEndPointPath:endPoint params:params];
    NSString *urlString = [NSString stringWithFormat: @"%@%@", HTTPRequest.baseUrl, path];
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        TMBResponse *result = [TMBResponse fromData:data error:&error];
        if (err) NSLog(@"Failed %@", err);
        completion(result, error);
    }] resume];
}

@end
