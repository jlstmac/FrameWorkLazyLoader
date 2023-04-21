//
//  RouterAdapter.h
//  FrameWorkLazyLoader
//
//  Created by jianglinshan on 2023/4/21.
//

#import <Foundation/Foundation.h>
#import "DynamicDemoService.h"
NS_ASSUME_NONNULL_BEGIN

@interface RouterAdapter : NSObject
+ (instancetype)sharedInstance;

- (DynamicDemoService*)dynmaicDemoInstance;
@end

NS_ASSUME_NONNULL_END
