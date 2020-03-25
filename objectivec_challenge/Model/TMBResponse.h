//
//  TMBResponse.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 24/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//
//  To parse this JSON:
//
//  NSError *error;
//  TMBResponse *response = [TMBResponse fromJSON:json encoding:NSUTF8Encoding error:&error];
//

#import <Foundation/Foundation.h>

@class TMBResponse;
@class TMBDates;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TMBResponse : NSObject

@property (nonatomic, nullable, copy)   NSArray *results;
@property (nonatomic, nullable, strong) NSNumber *page;
@property (nonatomic, nullable, strong) NSNumber *totalResults;
@property (nonatomic, nullable, strong) TMBDates *dates;
@property (nonatomic, nullable, strong) NSNumber *totalPages;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;

@end

@interface TMBDates : NSObject

@property (nonatomic, nullable, copy) NSString *maximum;
@property (nonatomic, nullable, copy) NSString *minimum;

@end

NS_ASSUME_NONNULL_END
