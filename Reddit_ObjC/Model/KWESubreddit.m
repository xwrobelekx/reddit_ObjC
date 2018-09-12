//
//  KWESubreddit.m
//  Reddit_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import "KWESubreddit.h"


@implementation KWESubreddit

//this init should take us from json data to subdeddit - the dictionaryies that are held in the array
-(instancetype)initWithDictionary: (NSDictionary*)postDictionary
{
    //2 seteps
    //#1 pull all the values out of the json dictionsry
    //use dictionary subscriptiong to get to the dictionary that holds the redit, and then get to title
    NSString *title = postDictionary[@"data"][@"title"];
    NSNumber *likeCount = postDictionary[@"data"][@"ups"];
    NSNumber *commentCount = postDictionary[@"data"][@"num_comments"];
    NSString *imageURLString = postDictionary[@"data"][@"thumbnail"];
    

    //#1.5  make sure they are the right type
    //title must be of type string, and it myst be there
    if (![title isKindOfClass: [NSString class]] || !(title) || ![likeCount isKindOfClass:[NSNumber class]] || ![commentCount isKindOfClass:[NSNumber class]]){
        return nil;
        
    }
    
    //#2 initialize  a Model Object from the values you pulled out of the json dictionary
    self = [super init];
    if (self){
        _title = title;
        _likeCount = likeCount;
        _commentCount = commentCount;
        _imageUrlString = imageURLString;
    }
    return self;
}
@end
