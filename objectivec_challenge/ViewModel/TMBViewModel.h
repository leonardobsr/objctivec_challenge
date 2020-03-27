//
//  TMBViewModel.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 26/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMBViewModel : NSObject

- (void)getFeed:(void (^)(NSMutableDictionary *, NSError *))completion;
- (void)getGenres;
- (void)params:(NSDictionary *)params
        getPopular:(void (^)(NSMutableArray *, NSError *))completion;
- (void)params:(NSDictionary *)params
        getNowPlaying:(void (^)(NSMutableArray *, NSError *))completion;
- (void)query:(NSString *)query_ searchMovie:(void (^)(NSMutableDictionary *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
