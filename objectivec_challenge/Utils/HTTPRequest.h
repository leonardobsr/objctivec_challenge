//
//  HTTPRequest.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBMovie.h"
#import "TMBGenre.h"
#import "TMBCompany.h"
#import "TMBCountry.h"
#import "TMBLanguage.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTTPRequest : NSObject

+ (void)getGenres:(void (^)(NSArray *, NSError *))completion;
+ (void)getNowPlaying:(NSInteger) page completion:(void (^)(NSArray *, NSError *))completion;
+ (void)getPopular:(NSInteger) page completion:(void (^)(NSArray *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
