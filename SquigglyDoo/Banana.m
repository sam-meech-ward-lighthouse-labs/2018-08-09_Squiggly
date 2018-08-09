//
//  Banana.m
//  SquigglyDoo
//
//  Created by Sam Meech-Ward on 2018-08-09.
//  Copyright © 2018 meech-ward. All rights reserved.
//

#import "Banana.h"

@interface Banana()

@property (nonatomic) NSTimer *timer;

@end

@implementation Banana

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
      self.ripeness++;
    }];
  }
  return self;
}


@end
