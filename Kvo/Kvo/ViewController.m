//
//  ViewController.m
//  Kvo
//
//  Created by 岳靖翔 on 2019/9/18.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "ViewController.h"
#import "Peson.h"
@interface ViewController ()
@property (nonatomic,strong)Peson *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _p = [[Peson alloc]init];
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:(NSKeyValueObservingOptionNew) context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int a;
    _p.name = [NSString stringWithFormat:@"%d",a++ ];
}
- (void)dealloc {
    [_p removeObserver:self forKeyPath:@"name"];
   
}

@end
