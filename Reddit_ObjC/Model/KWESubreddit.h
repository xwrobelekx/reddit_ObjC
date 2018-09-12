//
//  KWESubreddit.h
//  Reddit_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KWESubreddit : NSObject

//#1 define you properties you maay need from your json
//copy - this property is gone behave as like struct
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic) NSNumber *likeCount;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, readonly, copy) NSString *imageUrlString;
@property (nonatomic, readwrite, nullable) UIImage *photo;


//instance type- lets us use the initializer in any subclass
//this is init for single post which is a dictionary of posts which are held in the childerns array
-(instancetype)initWithDictionary: (NSDictionary*)postDictionary;


@end
