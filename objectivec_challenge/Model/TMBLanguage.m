//
//  Language.m
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import "TMBLanguage.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
//static id NSNullify(id _Nullable x) {
//    return (x == nil || x == NSNull.null) ? NSNull.null : x;
//}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface TMBLanguage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

#pragma mark - JSON serialization

TMBLanguage *_Nullable TMBLanguageFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [TMBLanguage fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

TMBLanguage *_Nullable TMBLanguageFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return TMBLanguageFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable TMBLanguageToData(TMBLanguage *language, NSError **error)
{
    @try {
        id json = [language JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable TMBLanguageToJSON(TMBLanguage *language, NSStringEncoding encoding, NSError **error)
{
    NSData *data = TMBLanguageToData(language, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation TMBLanguage
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"iso_639_1": @"iso639_1",
        @"english_name": @"englishName",
        @"name": @"name",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return TMBLanguageFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return TMBLanguageFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[TMBLanguage alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = TMBLanguage.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:TMBLanguage.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in TMBLanguage.properties) {
        id propertyName = TMBLanguage.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return TMBLanguageToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return TMBLanguageToJSON(self, encoding, error);
}
@end

NS_ASSUME_NONNULL_END
