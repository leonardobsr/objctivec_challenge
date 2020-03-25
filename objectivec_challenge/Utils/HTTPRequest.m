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

- (NSString *)baseUrl { return @"https://api.themoviedb.org/3/"; }
- (NSString *)apiKey { return @"api_key=bd376c11b6a9bcd6645d26cc74bfe7c3"; }

//@dynamic endPoints;
//
//@dynamic baseUrl;
//@dynamic apiKey;
//@dynamic getPath;
//@dynamic getUrl;
//
//@dynamic endPoint;
//@dynamic params;
//
//static NSDictionary *_endPoints = nil;
//
//+ (NSDictionary *)endPoints {
//  if (_endPoints == nil) {
//    _endPoints = [[NSDictionary alloc] init];
//    _endPoints = @{
//        @"getGenres": @{
//                @"language": @""
//        }
//    };
//  }
//  return _endPoints;
//}
//
//
- (id)initWithParams:(NSDictionary *)endPoint_
{
     self = [super init];
     if (self) {
         self.endPoint = endPoint_;
         NSLog(@"%@", self.baseUrl);
         NSLog(@"%@", self.apiKey);
     }
     return self;
}
//
//- (NSString *)getPath {
//    NSString *path = [NSString alloc];
//    
//    switch (HTTPRequest.endPoint) {
//        case HTTPRequest.endPoints[@"getGenres"]:
//            path = [NSString stringWithFormat: @"genre/movie/list?%@&language = %@", HTTPRequest.apiKey, HTTPRequest.endPoint[@"language"]];
//            break;
//            
//        default:
//            path = @"";
//            break;
//    }
//    
//    return @"";
//}
//
//- (NSString *)getUrl {
//    return [NSString stringWithFormat: @"%@%@", HTTPRequest.baseUrl, HTTPRequest.getPath];
//}
//
//+ (void)request:(void (^)(TMBResponse *, NSError *))completion {
//    
//    NSString *urlString = HTTPRequest.baseUrl;
//    NSURL *url = [NSURL URLWithString:urlString];
//
//    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSError *err;
//        TMBResponse *result = [TMBResponse fromData:data error:&error];
//        
//        if (err) {
//            NSLog(@"Failed %@", err);
//        }
//        
//        completion(result, error);
//    }] resume];
//}

@end
