//
//  MainTableViewCell.h
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *dishImgV;
@property (weak, nonatomic) IBOutlet UILabel *good;
@property (weak, nonatomic) IBOutlet UIImageView *goodImg;
@property (weak, nonatomic) IBOutlet UIImageView *commentImg;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImg;
@property (weak, nonatomic) IBOutlet UILabel *picture;

@end
