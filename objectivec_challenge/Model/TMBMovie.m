//
//  Movie.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

//#import "TMBMovie.h"
//#import "TMBGenre.m"
//#import "TMBCompany.m"
//#import "TMBCountry.m"
//#import "TMBLanguage.m"
//
//// Shorthand for simple blocks
//#define λ(decl, expr) (^(decl) { return (expr); })
//
//// nil → NSNull conversion for JSON dictionaries
////static id NSNullify(id _Nullable x) {
////    return (x == nil || x == NSNull.null) ? NSNull.null : x;
////}
//
//NS_ASSUME_NONNULL_BEGIN
//
//#pragma mark - Private model interfaces
//
//@interface TMBMovie (JSONConversion)
//+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
//- (NSDictionary *)JSONDictionary;
//@end
//
//static id map(id collection, id (^f)(id value)) {
//    id result = nil;
//    if ([collection isKindOfClass:NSArray.class]) {
//        result = [NSMutableArray arrayWithCapacity:[collection count]];
//        for (id x in collection) [result addObject:f(x)];
//    } else if ([collection isKindOfClass:NSDictionary.class]) {
//        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
//        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
//    }
//    return result;
//}
//
//#pragma mark - JSON serialization
//
//TMBMovie *_Nullable TMBMovieFromData(NSData *data, NSError **error)
//{
//    @try {
//        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
//        return *error ? nil : [TMBMovie fromJSONDictionary:json];
//    } @catch (NSException *exception) {
//        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
//        return nil;
//    }
//}
//
//TMBMovie *_Nullable TMBMovieFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
//{
//    return TMBMovieFromData([json dataUsingEncoding:encoding], error);
//}
//
//NSData *_Nullable TMBMovieToData(TMBMovie *movie, NSError **error)
//{
//    @try {
//        id json = [movie JSONDictionary];
//        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
//        return *error ? nil : data;
//    } @catch (NSException *exception) {
//        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
//        return nil;
//    }
//}
//
//NSString *_Nullable TMBMovieToJSON(TMBMovie *movie, NSStringEncoding encoding, NSError **error)
//{
//    NSData *data = TMBMovieToData(movie, error);
//    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
//}
//
//@implementation TMBMovie
//+ (NSDictionary<NSString *, NSString *> *)properties
//{
//    static NSDictionary<NSString *, NSString *> *properties;
//    return properties = properties ? properties : @{
//        @"adult": @"adult",
//        @"backdrop_path": @"backdropPath",
//        @"belongs_to_collection": @"belongsToCollection",
//        @"budget": @"budget",
//        @"genres": @"genres",
//        @"homepage": @"homepage",
//        @"id": @"identifier",
//        @"imdb_id": @"imdbID",
//        @"original_language": @"originalLanguage",
//        @"original_title": @"originalTitle",
//        @"overview": @"overview",
//        @"popularity": @"popularity",
//        @"poster_path": @"posterPath",
//        @"production_companies": @"productionCompanies",
//        @"production_countries": @"productionCountries",
//        @"release_date": @"releaseDate",
//        @"revenue": @"revenue",
//        @"runtime": @"runtime",
//        @"spoken_languages": @"spokenLanguages",
//        @"status": @"status",
//        @"tagline": @"tagline",
//        @"title": @"title",
//        @"video": @"video",
//        @"vote_average": @"voteAverage",
//        @"vote_count": @"voteCount",
//    };
//}
//
//+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
//{
//    return TMBMovieFromData(data, error);
//}
//
//+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
//{
//    return TMBMovieFromJSON(json, encoding, error);
//}
//
//+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
//{
//    return dict ? [[TMBMovie alloc] initWithJSONDictionary:dict] : nil;
//}
//
//- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
//{
//    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
//        _genres = map(_genres, λ(id x, [TMBGenre fromJSONDictionary:x]));
//        _productionCompanies = map(_productionCompanies, λ(id x, [TMBCompany fromJSONDictionary:x]));
//        _productionCountries = map(_productionCountries, λ(id x, [TMBCountry fromJSONDictionary:x]));
//        _spokenLanguages = map(_spokenLanguages, λ(id x, [TMBLanguage fromJSONDictionary:x]));
//    }
//    return self;
//}
//
//- (void)setValue:(nullable id)value forKey:(NSString *)key
//{
//    id resolved = TMBMovie.properties[key];
//    if (resolved) [super setValue:value forKey:resolved];
//}
//
//- (NSDictionary *)JSONDictionary
//{
//    id dict = [[self dictionaryWithValuesForKeys:TMBMovie.properties.allValues] mutableCopy];
//
//    // Rewrite property names that differ in JSON
//    for (id jsonName in TMBMovie.properties) {
//        id propertyName = TMBMovie.properties[jsonName];
//        if (![jsonName isEqualToString:propertyName]) {
//            dict[jsonName] = dict[propertyName];
//            [dict removeObjectForKey:propertyName];
//        }
//    }
//
//    // Map values that need translation
//    [dict addEntriesFromDictionary:@{
//        @"genres": NSNullify(map(_genres, λ(id x, [x JSONDictionary]))),
//        @"production_companies": NSNullify(map(_productionCompanies, λ(id x, [x JSONDictionary]))),
//        @"production_countries": NSNullify(map(_productionCountries, λ(id x, [x JSONDictionary]))),
//        @"spoken_languages": NSNullify(map(_spokenLanguages, λ(id x, [x JSONDictionary]))),
//    }];
//
//    return dict;
//}
//
//- (NSData *_Nullable)toData:(NSError *_Nullable *)error
//{
//    return TMBMovieToData(self, error);
//}
//
//- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
//{
//    return TMBMovieToJSON(self, encoding, error);
//}
//@end
//
//NS_ASSUME_NONNULL_END
