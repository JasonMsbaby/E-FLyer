//
//  ImageChangeController.m
//  E-flyer
//
//  Created by 苗爽 on 16/4/23.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <PhotosUI/PhotosUI.h>
#import "ImageChangeController.h"
#import "ToolUtils.h"
@interface ImageChangeController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ImageChangeController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.currentUser.barImg != nil) {
        [self.img imagedWithAVFile:self.currentUser.barImg];
    }
    self.img.userInteractionEnabled = YES;
    [self.img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)tapAction{
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    pickVC.delegate = self;
    pickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickVC.mediaTypes = @[@"public.image"];
    [self presentViewController:pickVC animated:YES completion:nil];
}


- (IBAction)btnSubmitAction:(id)sender {
    AVFile *img = [ToolUtils dataWithImage:self.img.image VideoPath:nil];
    self.currentUser.barImg = img;
    [SVProgressHUD showWithStatus:@"正在上传店铺图片，请稍后..."];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [SVProgressHUD showSuccessWithStatus:@"上传成功"];
        }else{
            [self toastWithError:error];
        }
    }];
}

#pragma mark - 选取图片回调

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    WeakObj(self)
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
        selfWeak.img.image = img;
    }];
}

@end
