//
//  SegmentHandler.h
//  FrameWorkLazyLoader
//
//  Created by jianglinshan on 2023/4/21.
//

#import <Foundation/Foundation.h>

#define DATASection(sectname) __attribute((used, section("__DATA, "#sectname" ")))
 
#define SectionName @"DemoSectionName" //长度需控制在1到16个字符之间
#define RegisterSection(name) const char * kScheme##name##_mod DATASection(DemoSectionName) = ""#name"";

NS_ASSUME_NONNULL_BEGIN

@interface SegmentHandler : NSObject
+ (NSArray<NSString *> *)fetchConfigurationWithSectionName:(NSString *)sectionName;

@end

NS_ASSUME_NONNULL_END
