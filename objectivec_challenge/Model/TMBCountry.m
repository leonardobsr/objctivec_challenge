//
//  Country.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "TMBCountry.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
//static id NSNullify(id _Nullable x) {
//    return (x == nil || x == NSNull.null) ? NSNull.null : x;
//}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface TMBCountry (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

#pragma mark - JSON serialization

TMBCountry *_Nullable TMBCountryFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [TMBCountry fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

TMBCountry *_Nullable TMBCountryFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return TMBCountryFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable TMBCountryToData(TMBCountry *country, NSError **error)
{
    @try {
        id json = [country JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable TMBCountryToJSON(TMBCountry *country, NSStringEncoding encoding, NSError **error)
{
    NSData *data = TMBCountryToData(country, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation TMBCountry
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"iso_3166_1": @"iso3166_1",
        @"english_name": @"englishName",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return TMBCountryFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return TMBCountryFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[TMBCountry alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = TMBCountry.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:TMBCountry.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in TMBCountry.properties) {
        id propertyName = TMBCountry.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return TMBCountryToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return TMBCountryToJSON(self, encoding, error);
}
@end

NS_ASSUME_NONNULL_END
