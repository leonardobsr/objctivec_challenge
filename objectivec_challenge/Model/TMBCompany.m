////
////  Company.m
////  objectivec_challenge
////
////  Created by Leonardo Reis on 19/03/20.
////  Copyright © 2020 Leonardo Reis. All rights reserved.
////
//
//#import "TMBCompany.h"
//
//// Shorthand for simple blocks
//#define λ(decl, expr) (^(decl) { return (expr); })
//
//NS_ASSUME_NONNULL_BEGIN
//
//#pragma mark - Private model interfaces
//
//@interface TMBCompany (JSONConversion)
//+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
//- (NSDictionary *)JSONDictionary;
//@end
//
//#pragma mark - JSON serialization
//
//TMBCompany *_Nullable TMBCompanyFromData(NSData *data, NSError **error)
//{
//    @try {
//        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
//        return *error ? nil : [TMBCompany fromJSONDictionary:json];
//    } @catch (NSException *exception) {
//        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
//        return nil;
//    }
//}
//
//TMBCompany *_Nullable TMBCompanyFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
//{
//    return TMBCompanyFromData([json dataUsingEncoding:encoding], error);
//}
//
//NSData *_Nullable TMBCompanyToData(TMBCompany *company, NSError **error)
//{
//    @try {
//        id json = [company JSONDictionary];
//        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
//        return *error ? nil : data;
//    } @catch (NSException *exception) {
//        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
//        return nil;
//    }
//}
//
//NSString *_Nullable TMBCompanyToJSON(TMBCompany *company, NSStringEncoding encoding, NSError **error)
//{
//    NSData *data = TMBCompanyToData(company, error);
//    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
//}
//
//@implementation TMBCompany
//+ (NSDictionary<NSString *, NSString *> *)properties
//{
//    static NSDictionary<NSString *, NSString *> *properties;
//    return properties = properties ? properties : @{
//        @"description": @"theDescription",
//        @"headquarters": @"headquarters",
//        @"homepage": @"homepage",
//        @"id": @"identifier",
//        @"logo_path": @"logoPath",
//        @"name": @"name",
//        @"origin_country": @"originCountry",
//        @"parent_company": @"parentCompany",
//    };
//}
//
//+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
//{
//    return TMBCompanyFromData(data, error);
//}
//
//+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
//{
//    return TMBCompanyFromJSON(json, encoding, error);
//}
//
//+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
//{
//    return dict ? [[TMBCompany alloc] initWithJSONDictionary:dict] : nil;
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
//    id resolved = TMBCompany.properties[key];
//    if (resolved) [super setValue:value forKey:resolved];
//}
//
//- (NSDictionary *)JSONDictionary
//{
//    id dict = [[self dictionaryWithValuesForKeys:TMBCompany.properties.allValues] mutableCopy];
//
//    // Rewrite property names that differ in JSON
//    for (id jsonName in TMBCompany.properties) {
//        id propertyName = TMBCompany.properties[jsonName];
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
//    return TMBCompanyToData(self, error);
//}
//
//- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
//{
//    return TMBCompanyToJSON(self, encoding, error);
//}
//@end
//
//NS_ASSUME_NONNULL_END
