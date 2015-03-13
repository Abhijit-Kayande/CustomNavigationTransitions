//
//  ViewController.m
//  AnimatedTransioning
//
//  Created by ABS on 11/12/14.
//  Copyright (c) 2014 ABS. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "AbhiAnimatedTransitioning.h"

@interface ViewController ()<UINavigationControllerDelegate>
{

    UIView *SelectedView;
    
    IBOutlet UIView *View1,*View2,*View3,*View4;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //[self.navigationController.navigationBar setHidden:YES];
    
    self.navigationController.delegate=self;
    
    
    UITapGestureRecognizer *Tap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tapped:)];
    
    UITapGestureRecognizer *Tap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tapped:)];
    
    UITapGestureRecognizer *Tap3=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tapped:)];
    
    UITapGestureRecognizer *Tap4=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tapped:)];
    
    
    
    [View1 addGestureRecognizer:Tap1];
    
    [View2 addGestureRecognizer:Tap2];
    
    [View3 addGestureRecognizer:Tap3];
    
    [View4 addGestureRecognizer:Tap4];
    
    
    
    
    
}


-(void)Tapped:(UITapGestureRecognizer *)tap
{
    
   
    
    [tap.view setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    SelectedView=tap.view;

    [self performSegueWithIdentifier:@"ShowIt" sender:self];

}


-(IBAction)SwipeRecognizer:(id)sender
{

   
    
    
    [self performSegueWithIdentifier:@"ShowIt" sender:self];


}




- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{




    AbhiAnimatedTransitioning *anim=[[AbhiAnimatedTransitioning alloc] init];
    
    [anim setTransitionView:SelectedView];
    
    
    [anim setType:6];   //1 to 7;
    
    if (operation==UINavigationControllerOperationPush) {
        
        anim.reverse=NO;
        
        
    }
    else if (operation==UINavigationControllerOperationPop) {
        
        anim.reverse=YES;
        
        
    }
    
    
    
    
    return anim;



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
