//
//  ViewController.h
//  Savi
//
//  Created by Angel Solorio on 10/16/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MRProgress/MRProgress.h>

@interface InitialViewController : UIViewController {
     MRProgressOverlayView *progressView;
}

- (IBAction)syncing:(id)sender;

@end

