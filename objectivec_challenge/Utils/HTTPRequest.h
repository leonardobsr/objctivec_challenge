//
//  HTTPRequest.h
//  objectivec_challenge
//
//  Created by Leonardo Reis on 19/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTTPRequest : NSObject

@property (readonly) NSString *baseUrl;
@property (readonly) NSString *apiKey;

@property (readonly) NSDictionary *endPoints;
@property NSDictionary *endPoint;

//
//
//@property NSString *getPath;
//@property NSString *getUrl;
//
- (id)initWithParams:(NSDictionary *)endPoint_;
//+ (void)request:(void (^)(TMBResponse *, NSError *))completion;


//
//get url () {
//    return this.getBaseUrl + this.path
//}
//
//get method () {
//    if (
//        this.endpoint === API.EndPoints.me ||
//        this.endpoint === API.EndPoints.getClub ||
//        this.endpoint === API.EndPoints.getClubs
//    ) {
//        return Vue.http.get(this.url, { params: this.params })
//    } else if (
//        (this.endpoint === API.EndPoints.editClub) ||
//        (this.endpoint === API.EndPoints.editTask)
//    ) {
//        return Vue.http.put(this.url, this.params)
//    } else if (
//        this.endpoint === API.EndPoints.deleteClub ||
//        this.endpoint === API.EndPoints.deleteInteraction ||
//        this.endpoint === API.EndPoints.deleteTask
//    ) {
//        return Vue.http.delete(this.url, this.params)
//    } else if (
//        this.endpoint === API.EndPoints.upload
//    ) {
//        return Vue.http.post(this.url, this.params, {
//            headers: {
//                'Content-Type': 'multipart/form-data'
//            }
//        })
//    }
//
//    return Vue.http.post(this.url, this.params)
//}
//
//static params = {}
//
//
//async request () {
//    return this.method


@end

NS_ASSUME_NONNULL_END
