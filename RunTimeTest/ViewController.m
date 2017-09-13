//
//  ViewController.m
//  RunTimeTest
//
//  Created by LGSC on 2017/9/7.
//  Copyright © 2017年 LGSC. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //测试上传代码
//    objc_msgSend(self, @selector(viewDidLoad));
    
//    [ViewController load];
    
//    [ViewController xz_imageName:@"123"];
}

+ (UIImage *)xz_imageName:(NSString *)imageName
{
    // 1.加载图片
    UIImage *image = [ViewController xz_imageName:imageName];
    
    // 2.判断功能
    if (image == nil) {
        NSLog(@"%@图片为空",imageName);
    }
    
    return image;
}

+ (void)load
{
    NSLog(@"%s",__func__);
    
    // 1.表示获取方法的实现
    //class_getMethodImplementation(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    // 2.获取对象方法
    //  class_getInstanceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    // 3.获取类方法
    //  class_getClassMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    
    /**
     class:获取哪个类的方法
     sel:获取方法编号，根据sel去找相应的类方法
     */
    Method imageNameMethod =  class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method xz_imageNameMethod = class_getClassMethod([UIImage class], @selector(xz_imageName:));
    
    // 交换方法实现
    method_exchangeImplementations(imageNameMethod, xz_imageNameMethod);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
