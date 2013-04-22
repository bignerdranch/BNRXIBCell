//
//  BNRXIBCell.m
//
//  Created by Joe Conway on 10/3/12.
//  Copyright (c) 2012 Big Nerd Ranch. All rights reserved.
//

#import "BNRXIBCell.h"
@interface BNRXIBCell ()
@property (nonatomic, weak) UITableView *currentTableView;
@property (nonatomic, weak) id actionTarget;
@end

@implementation BNRXIBCell

+ (id)cellForTableView:(UITableView *)tv target:(id)target
{
    NSString *className = NSStringFromClass([self class]);
    
    BNRXIBCell *cell = [tv dequeueReusableCellWithIdentifier:className];
    if(!cell) {
        UINib *nib = [UINib nibWithNibName:className bundle:[NSBundle mainBundle]];
        if(nib)
            [tv registerNib:nib forCellReuseIdentifier:className];
        else
            [tv registerClass:self forCellReuseIdentifier:className];
        
        cell = [tv dequeueReusableCellWithIdentifier:className];
    }
    
    [cell setActionTarget:target];
    [cell setCurrentTableView:tv];
    
    return cell;
}
/*
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    NSString *fullSelectorString = [NSStringFromSelector(selector) stringByAppendingString:@"atIndexPath:"];
    SEL fullSelector = NSSelectorFromString(fullSelectorString);
    if([[self actionTarget] respondsToSelector:@selector(fullSelector)]) {
        id sendingObject = nil;
        [anInvocation getArgument:&sendingObject atIndex:2];
        NSIndexPath *ip = [[self currentTableView] indexPathForCell:self];
        [[self actionTarget] performSelector:fullSelector withObject:sendingObject withObject:ip];
    } else {
        [self doesNotRecognizeSelector:selector];
    }
}*/

- (void)routeAction:(SEL)act fromObject:(id)obj
{
	[self dispatchMessage:act toObject:[self actionTarget] fromObject:obj];
}
- (void)dispatchMessage:(SEL)msg toObject:(id)obj fromObject:(UIControl *)ctl
{
	SEL newSel = NSSelectorFromString([NSStringFromSelector(msg) stringByAppendingFormat:@"atIndexPath:"]);
	NSIndexPath *ip = [[self currentTableView] indexPathForCell:self];
    if(ip)
        [obj performSelector:newSel withObject:ctl withObject:ip];
}


@end
