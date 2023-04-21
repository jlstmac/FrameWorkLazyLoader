//
//  RouterAdapter.m
//  FrameWorkLazyLoader
//
//  Created by jianglinshan on 2023/4/21.
//

#import "RouterAdapter.h"
#import "SegmentHandler.h"

RegisterSection(DynamicDemoService)

@implementation RouterAdapter
+ (instancetype)sharedInstance {
    static RouterAdapter* pRet = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        pRet = RouterAdapter.new;
    });
    return pRet;
}

- (DynamicDemoService *)dynmaicDemoInstance {
    __block Class targetClass;
    [[SegmentHandler fetchConfigurationWithSectionName:SectionName] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:@"DynamicDemoService"]) {
            targetClass = NSClassFromString(@"DynamicDemoService");
            *stop = YES;
        }
    }];
    return [[targetClass alloc] init];
}
@end
