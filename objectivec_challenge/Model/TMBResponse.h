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
//
//#import <Foundation/Foundation.h>
//
//@class TMBResponse;
//@class TMBDates;
//
//NS_ASSUME_NONNULL_BEGIN
//
//#pragma mark - Object interfaces
//
//@interface TMBResponse : NSObject
//
//@property (nonatomic, nullable, copy)   NSArray *results;
//@property (nonatomic, nullable, strong) NSNumber *page;
//@property (nonatomic, nullable, strong) NSNumber *totalResults;
//@property (nonatomic, nullable, strong) TMBDates *dates;
//@property (nonatomic, nullable, strong) NSNumber *totalPages;
//
//+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
//+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
//- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
//- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
//
//@end
//
//@interface TMBDates : NSObject
//
//@property (nonatomic, nullable, copy) NSString *maximum;
//@property (nonatomic, nullable, copy) NSString *minimum;
//
//@end
//
//NS_ASSUME_NONNULL_END

// To parse this JSON:
//
//   NSError *error;
//   TMBResponse *response = [TMBResponse fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class TMBResponse;
@class TMBDates;
@class TMBMovie;
@class TMBGenre;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TMBResponse : NSObject

@property (nonatomic, nullable, copy) NSArray<TMBGenre *> *genres;
@property (nonatomic, nullable, strong) NSNumber *page;
@property (nonatomic, nullable, copy)   NSArray<TMBMovie *> *results;
@property (nonatomic, nullable, strong) TMBDates *dates;
@property (nonatomic, nullable, strong) NSNumber *totalPages;
@property (nonatomic, nullable, strong) NSNumber *totalResults;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface TMBDates : NSObject
@property (nonatomic, nullable, copy) NSString *maximum;
@property (nonatomic, nullable, copy) NSString *minimum;
@end

@interface TMBMovie : NSObject
@property (nonatomic, nullable, copy)   NSString *posterPath;
@property (nonatomic, nullable, strong) NSNumber *adult;
@property (nonatomic, nullable, copy)   NSString *overview;
@property (nonatomic, nullable, copy)   NSString *releaseDate;
@property (nonatomic, nullable, copy)   NSArray<NSNumber *> *genreIDS;
@property (nonatomic, nullable, copy)   NSString *genres;
@property (nonatomic, nullable, strong) NSNumber *identifier;
@property (nonatomic, nullable, copy)   NSString *originalTitle;
@property (nonatomic, nullable, copy)   NSString *originalLanguage;
@property (nonatomic, nullable, copy)   NSString *title;
@property (nonatomic, nullable, copy)   NSString *backdropPath;
@property (nonatomic, nullable, strong) NSNumber *popularity;
@property (nonatomic, nullable, strong) NSNumber *voteCount;
@property (nonatomic, nullable, strong) NSNumber *video;
@property (nonatomic, nullable, strong) NSNumber *voteAverage;
@end

@interface TMBGenre : NSObject
@property (nonatomic, nullable, strong) NSNumber *identifier;
@property (nonatomic, nullable, copy)   NSString *name;
@end

NS_ASSUME_NONNULL_END
