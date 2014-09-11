//
//  ViewController.m
//  QBImagePickerControllerDemo
//
//  Created by Cao JianRong on 14-8-25.
//  Copyright (c) 2014年 Cao JianRong. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
}

/**
 *  多选照片的代理方法。在这里进行选择，上传等一系列操作
 */
#pragma mark - QBImagePickerControllerDelegate

- (void)imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingMediaWithInfo:(id)info
{
    
    if(imagePickerController.allowsMultipleSelection) {
        NSArray *mediaInfoArray = (NSArray *)info;
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        NSLog(@"Selected %d photos and mediaInfoArray==%@", mediaInfoArray.count,mediaInfoArray);
    } else {
        NSDictionary *mediaInfo = (NSDictionary *)info;
        NSLog(@"Selected: %@", mediaInfo);
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)];
        img.clipsToBounds = YES;
        img.contentMode = UIViewContentModeScaleAspectFill;
        [img setImage:[mediaInfo objectForKey:@"UIImagePickerControllerOriginalImage"]];
        [self.view addSubview:img];
        [img release];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController
{
    NSLog(@"取消选择");
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (NSString *)descriptionForSelectingAllAssets:(QBImagePickerController *)imagePickerController
{
    return @"";
}

- (NSString *)descriptionForDeselectingAllAssets:(QBImagePickerController *)imagePickerController
{
    return @"";
}

- (NSString *)imagePickerController:(QBImagePickerController *)imagePickerController descriptionForNumberOfPhotos:(NSUInteger)numberOfPhotos
{
    return [NSString stringWithFormat:@"图片%d张", numberOfPhotos];
}

- (NSString *)imagePickerController:(QBImagePickerController *)imagePickerController descriptionForNumberOfVideos:(NSUInteger)numberOfVideos
{
    return [NSString stringWithFormat:@"视频%d", numberOfVideos];
}

- (NSString *)imagePickerController:(QBImagePickerController *)imagePickerController descriptionForNumberOfPhotos:(NSUInteger)numberOfPhotos numberOfVideos:(NSUInteger)numberOfVideos
{
    return [NSString stringWithFormat:@"图片%d 视频%d", numberOfPhotos, numberOfVideos];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];
    imagePickerController.delegate = self;
    
    imagePickerController.allowsMultipleSelection = NO;
    imagePickerController.allowsEdit = YES;
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
    //Navigation Title Color and FontStyle
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"STHeitiK-Medium" size:20],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    navi.navigationBar.titleTextAttributes = dict;
    //origination from (0,20,width,height) not (0,0,width,height)
    navi.navigationBar.translucent = NO;
    //navigation background Color
    navi.navigationBar.barTintColor = [UIColor colorWithRed:151/255.0 green:217/255.0 blue:204/255.0 alpha:0.5];
    //navigation letf or right nafigationItem Color
    navi.navigationBar.tintColor = [UIColor whiteColor];
    [self presentViewController:navi animated:YES completion:NULL];
    [imagePickerController release];
    [navi release];
    return ;
    
    ViewController *vController = [[ViewController alloc] init];
    vController.title = @"详情";
    [self.navigationController pushViewController:vController animated:YES];
    [vController release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
