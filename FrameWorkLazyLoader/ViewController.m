//
//  ViewController.m
//  FrameWorkLazyLoader
//
//  Created by jianglinshan on 2023/4/20.
//

#import "ViewController.h"
#import "FrameworkLoader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FrameworkLoader loadFramework:@"DynamicDemo"];
//    Worker* worker = Worker.new;
    // Do any additional setup after loading the view.
}

- (void)loadFramework {
    
}

@end
