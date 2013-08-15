//
//  ImageViewController.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "ImageViewController.h"
#import "Recipe.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIActionSheet *actionSheet;

@end

@implementation ImageViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.imageView.image = [UIImage imageWithData:self.recipe.recipeImage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
}


- (IBAction)takePicture:(UIBarButtonItem *)sender
{    
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose a picture source:"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:@"Photo Library",
                                                            @"Camera",
                                                            @"Saved Photos Album",
                                                            nil];
    
    [self.actionSheet showInView: self.view];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *newImage = info[UIImagePickerControllerOriginalImage];
    
    self.recipe.recipeImage = [NSData dataWithData:UIImageJPEGRepresentation(newImage, 1.0)];
    self.imageView.image = [UIImage imageWithData:self.recipe.recipeImage];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark proptocol UIActionSheetDelegate

- (void) actionSheet: (UIActionSheet *) actionSheet
clickedButtonAtIndex: (NSInteger) buttonIndex {
	
	
	static const UIImagePickerControllerSourceType a[] = {
		UIImagePickerControllerSourceTypePhotoLibrary,
		UIImagePickerControllerSourceTypeCamera,
		UIImagePickerControllerSourceTypeSavedPhotosAlbum
	};
	static const size_t n = sizeof a / sizeof a[0];
	
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
	if (buttonIndex < 0 || buttonIndex >= n) {
		NSLog(@"buttonIndex == %d", buttonIndex);
	}
	
	else if ([UIImagePickerController isSourceTypeAvailable: a[buttonIndex]]) {
		imagePicker = [[UIImagePickerController alloc] init];
		imagePicker.sourceType = a[buttonIndex];
		imagePicker.delegate = self;
		imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
	}
	
	else {
		NSLog(@"Source type %d is not available.", a[buttonIndex]);
	}
}

@end
