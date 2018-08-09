//
//  ViewController.m
//  SquigglyDoo
//
//  Created by Sam Meech-Ward on 2018-08-09.
//  Copyright © 2018 meech-ward. All rights reserved.
//

#import "ViewController.h"
#import "Banana.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) NSDate *closedDate;

@property (nonatomic) Banana *banana;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(squigglyClosed) name:@"hey SquigglyDoo _ We're entring the background" object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(squigglyOpened) name:@"hey SquigglyDoo _ We're entring the foreground" object:nil];
  
  self.banana = [[Banana alloc] init];
  
  [self.banana addObserver:self forKeyPath:@"ripeness" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  // Do not call super here:  [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
  
  if ([keyPath isEqualToString:@"ripeness"]) {
    if (self.banana.ripeness < 10) {
      NSLog(@"not ripe enough yet");
    }
    else if (self.banana.ripeness == 10) {
      NSLog(@"yummy, time to eat");
    } else {
      NSLog(@"time for smoothies, too ripe: %i", self.banana.ripeness);
    }
  }
}

- (void)squigglyOpened {
  NSLog(@"opened");
  NSTimeInterval seconds = [[NSDate date] timeIntervalSinceDate:self.closedDate];
  if (seconds < 2) {
    self.label.text = [NSString stringWithFormat:@"You were gone for %f seconds", seconds];
  } else {
    self.label.text = [NSString stringWithFormat:@"Don't leave me 💩. You were gone for %f seconds", seconds];
  }
}

- (void)squigglyClosed {
  NSLog(@"Closed");
  self.closedDate = [NSDate date];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
