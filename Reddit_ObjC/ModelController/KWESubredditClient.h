//
//  KWESubredditClient.h
//  Reddit_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWESubreddit.h"

@interface KWESubredditClient : NSObject


//ststic func that return void  - withBlock - completion - returns nothing - ^ - block definition of what it takes in- "block" is the internal name
+(void)fetchAllSubRedditsForTitle: (NSString *)title withBlock:(void(^)(NSArray<KWESubreddit *> * _Nullable post))block;
// static func fetchAllSubReditd( for title: String, completion: @escaping ([KWESubReddit]?) -> (void)){}

//^ carrot separetes what goes in into the block, and what returns from copletion
+(void)fetchImageDataForURL: (NSString *)imageUrlString withBlock:(void(^)(NSData * _Nullable imageData))block;
// static func fetchImageData( for url: String, completion: @escaping (Data?)-> ()











@end
