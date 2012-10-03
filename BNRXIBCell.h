//
//  BNRXIBCell.h
//
//  Created by Joe Conway on 10/3/12.
//  Copyright (c) 2012 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ROUTE(x) [self routeAction:_cmd fromObject:x]

@interface BNRXIBCell : UITableViewCell

+ (id)cellForTableView:(UITableView *)tv target:(id)target;

- (void)routeAction:(SEL)act fromObject:(id)obj;

- (void)dispatchMessage:(SEL)msg toObject:(id)obj fromObject:(UIControl *)ctl;
@end
