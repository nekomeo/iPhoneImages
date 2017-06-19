//
//  ViewController.m
//  iPhoneImages
//
//  Created by Elle Ti on 2017-06-19.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://i.imgur.com/bktnImE.png"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url
                                                        completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        // error check
        if (error)
        {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        // convert data into uiimage
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        // show image in image view
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iPhoneImageView.image = image;
        }];
    }];
    
    [downloadTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
