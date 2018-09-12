//
//  KWESubredditClient.m
//  Reddit_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import "KWESubredditClient.h"


@implementation KWESubredditClient

// fetch all the posts
+(void)fetchAllSubRedditsForTitle: (NSString *)title withBlock:(void(^)(NSArray<KWESubreddit *> * _Nullable post))block
{
    //base url - construct your url
    NSURL *baseURL = [NSURL URLWithString:@"https://www.reddit.com/r/"];
    NSURL *url = [baseURL URLByAppendingPathComponent : title];
    url = [url URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", [url absoluteString]);
    
    //#2 dataTask - serializing json - completion - resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL : url completionHandler : ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching all subreddits for the title %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"No data returned");
            block(nil);
            return;
        }
        
        //this serializes the data coming in in bites into a top level JSON dictionary:
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData : data options : NSJSONReadingAllowFragments error : &error];
        //this take us one level deeper into the json file - from toplevel to data dictionary
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        //this takes another level down to the childernArray
        NSArray *childernArray = dataDictionary[@"children"];
        //create empty array to hold subreddits
        NSMutableArray *subreddidts = [[NSMutableArray alloc] init];
        
        for (NSDictionary * postDictionary in childernArray){
            
            KWESubreddit *post = [[KWESubreddit alloc] initWithDictionary : postDictionary];
            [subreddidts addObject : post];
        }
        
        block(subreddidts);
        
    }] resume];
    
}



//fetch all the images
// static func fetchImageData( for url: String, completion: @escaping (Data?)-> ()

+(void)fetchImageDataForURL: (NSString *)imageUrlString withBlock:(void(^)(NSData * _Nullable imageData))block
{
    //#1 construct url
    NSURL *url = [NSURL URLWithString : imageUrlString];
    
    //example querry item
    /*
    NSURLQueryItem *querryItem = [[NSURLQueryItem alloc] initWithName : @"sol" value : @"45"];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:true];
    components.queryItems = [[NSArray alloc] initWithObjects : querryItem, nil];
    NSURL *urlWithQuerryItems = components.URL;
    
    */
    
    
    NSLog(@"❌%@", [url absoluteString] );
    
    //#2 data task  - serialize - complete - resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL : url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching all subreddits for the title %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data) {
            NSLog(@"NO data avaliable");
            block(nil);
            return;
        }
        
        block(data);

    }]resume];

    
}




@end
