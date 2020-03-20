//
//  Language.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMBLanguage;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TMBLanguage : NSObject
@property (nonatomic, nullable, copy) NSString *iso639_1;
@property (nonatomic, nullable, copy) NSString *englishName;
@property (nonatomic, nullable, copy) NSString *name;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

NS_ASSUME_NONNULL_END
