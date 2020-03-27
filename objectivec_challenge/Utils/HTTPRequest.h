//
//  HTTPRequest.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBResponse.h"

typedef NS_ENUM(NSUInteger, EndPoint) {
    EndPointGetGenres = 1,
    EndPointGetPopular = 2,
    EndPointGetNowPlaying = 3,
    EndPointSearchMovie = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface HTTPRequest : NSObject

@property (strong, nonatomic, readonly) NSString *baseUrl;
@property (strong, nonatomic, readonly) NSString *apiKey;

+ (NSDictionary *)getEndPointParams:(EndPoint)endpoint;
- (void)endPoint:(EndPoint)endPoint
        params:(NSDictionary *)params
        request:(void (^)(TMBResponse *, NSError *))completion;
+ (NSString *)getImageBaseUrl;

@end

NS_ASSUME_NONNULL_END
