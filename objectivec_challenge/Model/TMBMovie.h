////
////  Movie.h
////  objectivec_challenge
////
////  Created by Leonardo Reis on 19/03/20.
////  Copyright © 2020 Leonardo Reis. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//#import "TMBGenre.h"
//#import "TMBCompany.h"
//#import "TMBCountry.h"
//#import "TMBLanguage.h"
//
//@class TMBMovie;
//
//NS_ASSUME_NONNULL_BEGIN
//
//#pragma mark - Object interfaces
//
//@interface TMBMovie : NSObject
//
//@property (nonatomic, nullable, strong) NSNumber *adult;
//@property (nonatomic, nullable, copy)   NSString *backdropPath;
//@property (nonatomic, nullable, copy)   id belongsToCollection;
//@property (nonatomic, nullable, strong) NSNumber *budget;
//@property (nonatomic, nullable, copy)   NSArray<TMBGenre *> *genres;
//@property (nonatomic, nullable, copy)   NSString *homepage;
//@property (nonatomic, nullable, strong) NSNumber *identifier;
//@property (nonatomic, nullable, copy)   NSString *imdbID;
//@property (nonatomic, nullable, copy)   NSString *originalLanguage;
//@property (nonatomic, nullable, copy)   NSString *originalTitle;
//@property (nonatomic, nullable, copy)   NSString *overview;
//@property (nonatomic, nullable, strong) NSNumber *popularity;
//@property (nonatomic, nullable, copy)   id posterPath;
//@property (nonatomic, nullable, copy)   NSArray<TMBCompany *> *productionCompanies;
//@property (nonatomic, nullable, copy)   NSArray<TMBCountry *> *productionCountries;
//@property (nonatomic, nullable, copy)   NSString *releaseDate;
//@property (nonatomic, nullable, strong) NSNumber *revenue;
//@property (nonatomic, nullable, strong) NSNumber *runtime;
//@property (nonatomic, nullable, copy)   NSArray<TMBLanguage *> *spokenLanguages;
//@property (nonatomic, nullable, copy)   NSString *status;
//@property (nonatomic, nullable, copy)   NSString *tagline;
//@property (nonatomic, nullable, copy)   NSString *title;
//@property (nonatomic, nullable, strong) NSNumber *video;
//@property (nonatomic, nullable, strong) NSNumber *voteAverage;
//@property (nonatomic, nullable, strong) NSNumber *voteCount;
//
//+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
//+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
//- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
//- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
//@end
//
//NS_ASSUME_NONNULL_END
