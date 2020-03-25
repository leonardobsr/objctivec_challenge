////
////  Genre.m
////  objectivec_challenge
////
////  Created by Leonardo Reis on 19/03/20.
////  Copyright © 2020 Leonardo Reis. All rights reserved.
////
//
//#import "TMBGenre.h"
//
//// Shorthand for simple blocks
//#define λ(decl, expr) (^(decl) { return (expr); })
//
//NS_ASSUME_NONNULL_BEGIN
//
//#pragma mark - Private model interfaces
//
//@interface TMBGenre (JSONConversion)
//+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
//- (NSDictionary *)JSONDictionary;
//@end
//
//#pragma mark - JSON serialization
//
//TMBGenre *_Nullable TMBGenreFromData(NSData *data, NSError **error)
//{
//    @try {
//        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
//        return *error ? nil : [TMBGenre fromJSONDictionary:json];
//    } @catch (NSException *exception) {
//        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
//        return nil;
//    }
//}
//
//TMBGenre *_Nullable TMBGenreFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
//{
//    return TMBGenreFromData([json dataUsingEncoding:encoding], error);
//}
//
//NSData *_Nullable TMBGenreToData(TMBGenre *genre, NSError **error)
//{
//    @try {
//        id json = [genre JSONDictionary];
//        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
//        return *error ? nil : data;
//    } @catch (NSException *exception) {
//        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
//        return nil;
//    }
//}
//
//NSString *_Nullable TMBGenreToJSON(TMBGenre *genre, NSStringEncoding encoding, NSError **error)
//{
//    NSData *data = TMBGenreToData(genre, error);
//    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
//}
//
//@implementation TMBGenre
//+ (NSDictionary<NSString *, NSString *> *)properties
//{
//    static NSDictionary<NSString *, NSString *> *properties;
//    return properties = properties ? properties : @{
//        @"id": @"identifier",
//        @"name": @"name",
//    };
//}
//
//+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
//{
//    return TMBGenreFromData(data, error);
//}
//
//+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
//{
//    return TMBGenreFromJSON(json, encoding, error);
//}
//
//+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
//{
//    return dict ? [[TMBGenre alloc] initWithJSONDictionary:dict] : nil;
//}
//
//- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
//{
//    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
//    }
//    return self;
//}
//
//- (void)setValue:(nullable id)value forKey:(NSString *)key
//{
//    id resolved = TMBGenre.properties[key];
//    if (resolved) [super setValue:value forKey:resolved];
//}
//
//- (NSDictionary *)JSONDictionary
//{
//    id dict = [[self dictionaryWithValuesForKeys:TMBGenre.properties.allValues] mutableCopy];
//
//    // Rewrite property names that differ in JSON
//    for (id jsonName in TMBGenre.properties) {
//        id propertyName = TMBGenre.properties[jsonName];
//        if (![jsonName isEqualToString:propertyName]) {
//            dict[jsonName] = dict[propertyName];
//            [dict removeObjectForKey:propertyName];
//        }
//    }
//
//    return dict;
//}
//
//- (NSData *_Nullable)toData:(NSError *_Nullable *)error
//{
//    return TMBGenreToData(self, error);
//}
//
//- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
//{
//    return TMBGenreToJSON(self, encoding, error);
//}
//@end
//
//NS_ASSUME_NONNULL_END
