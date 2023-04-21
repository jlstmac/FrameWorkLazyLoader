//
//  SegmentHandler.m
//  FrameWorkLazyLoader
//
//  Created by jianglinshan on 2023/4/21.
//

#import "SegmentHandler.h"
#include <dlfcn.h>
#include <mach-o/getsect.h>

@implementation SegmentHandler

static NSArray<NSString *>* ReadSectionConfiguration(const char *section)
{
    NSMutableArray *configs = [NSMutableArray array];
    
    Dl_info info;
    dladdr(ReadSectionConfiguration, &info);
    
#ifndef __LP64__ ///32位，结构体定义不一样，需要单独读取
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    unsigned long size = 0;
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, "__DATA", section, &size);
#else /* defined(__LP64__) */ ///64位
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    unsigned long size = 0;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, "__DATA", section, &size);
#endif /* defined(__LP64__) */
    
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        char *string = (char*)memory[idx];
        
        NSString *str = [NSString stringWithUTF8String:string];
        if(!str)continue;
        
        NSLog(@"config = %@", str);
        if(str) [configs addObject:str];
    }
    
    return configs;
}

+ (NSArray<NSString *> *)fetchConfigurationWithSectionName:(NSString *)sectionName {
    return ReadSectionConfiguration(sectionName.UTF8String);
}


@end
