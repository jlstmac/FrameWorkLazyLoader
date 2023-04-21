//
//  DynamicDemoService.m
//  DynamicDemo
//
//  Created by jianglinshan on 2023/4/21.
//

#import "DynamicDemoService.h"
#import "Worker.h"
#import "SegmentHandler.h"

RegisterSection(DynamicDemoService)

@implementation DynamicDemoService
- (id)genWorker {
    return Worker.new;
}

@end
