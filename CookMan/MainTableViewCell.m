//
//  MainTableViewCell.m
//  CookMan
//
//  Created by 尹晓明 on 16/1/19.
//  Copyright © 2016年 尹晓明. All rights reserved.
//

#import "MainTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _dishImgV.image=[UIImage imageNamed:@"icon"];

}
//给model赋值
-(void)setModel:(MainModel *)model{
    _model=model;
  //  [_dishImgV setImageWithURL:[NSURL URLWithString:_model.albums[0]]];
 //   _name.text=_model.title;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
