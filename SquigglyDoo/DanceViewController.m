//
//  DanceViewController.m
//  SquigglyDoo
//
//  Created by Sam Meech-Ward on 2018-08-09.
//  Copyright © 2018 meech-ward. All rights reserved.
//

#import "DanceViewController.h"

@interface DanceViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *pickleImageView;

@end

@implementation DanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
  [tapGesture setNumberOfTouchesRequired:2];
  [self.pickleImageView addGestureRecognizer:tapGesture];
  
}

- (void)tapped:(UITapGestureRecognizer *)gesture {
  NSLog(@"Tapped");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeUp:(id)sender {
  self.view.backgroundColor = [UIColor brownColor];
}

- (IBAction)swipeDown:(id)sender {
  self.view.backgroundColor = [UIColor magentaColor];
}

- (IBAction)panAround:(UIPanGestureRecognizer *)gesture {
  if (gesture.state == UIGestureRecognizerStateBegan) {
    
  } else if (gesture.state == UIGestureRecognizerStateChanged) {
    CGPoint translation = [gesture translationInView:self.pickleImageView];
//
    self.pickleImageView.center = CGPointMake(self.pickleImageView.center.x + translation.x, self.pickleImageView.center.y + translation.y);
    
    
//    self.pickleImageView.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    
    [gesture setTranslation:CGPointZero inView:self.pickleImageView];
//
  } else if (gesture.state == UIGestureRecognizerStateEnded) {
    
    [self someBadCode];
    
  }
  
  
}

- (void)someBadCode {
  [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAutoreverse animations:^{
    self.pickleImageView.alpha = 0;
  } completion:^(BOOL finished) {
    self.pickleImageView.center = self.view.center;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      self.pickleImageView.alpha = 1;
    });
    
  }];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//  NSLog(@"touches began");
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//  NSLog(@"Moved");
//}
//
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//  NSLog(@"ended");
//}

@end
