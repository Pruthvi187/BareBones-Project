//
//  DHSLandingListDelegate.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSBaseTableDelegate.h"


@interface DHSBaseTableDelegate()
@end

@implementation DHSBaseTableDelegate

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

//
// Programmatically create a view to be used as the background view of the cell
// Rounded corners with a shadow
//
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cornerRadius = 10.0;
    CGFloat leftAndRightMargin = 10.0f;
    
    cell.backgroundColor = UIColor.clearColor;
    
    // create a layer for a "background view" for the cell
    CAShapeLayer *newLayer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect indentedBounds = CGRectInset(cell.bounds, leftAndRightMargin, 0.0f); // space left and right
    BOOL addSeparatorLine = NO;
    BOOL addShadow = NO;
    
    // cell rounded and indented rectangle
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) { // a section with 1 row
        CGPathAddRoundedRect(pathRef, nil, indentedBounds, cornerRadius, cornerRadius);
        addShadow = YES;
    }
    else
    if (indexPath.row == 0) { // top cell
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMaxY(indentedBounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMinY(indentedBounds), CGRectGetMidX(indentedBounds), CGRectGetMinY(indentedBounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMinY(indentedBounds), CGRectGetMaxX(indentedBounds), CGRectGetMidY(indentedBounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMaxY(indentedBounds));
        addSeparatorLine = YES;
    }
    else
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) { // bottom cell
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMinY(indentedBounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMaxY(indentedBounds), CGRectGetMidX(indentedBounds), CGRectGetMaxY(indentedBounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMaxY(indentedBounds), CGRectGetMaxX(indentedBounds), CGRectGetMidY(indentedBounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMinY(indentedBounds));
        addShadow = YES;
    }
    else { // a cell in the middle somewhere
        CGPathAddRect(pathRef, nil, indentedBounds);
        addSeparatorLine = YES;
    }
    newLayer.path = pathRef;
    CFRelease(pathRef);
    
    newLayer.fillColor = [UIColor whiteColor].CGColor;

    // cell shadow
    if (addShadow) {
        newLayer.masksToBounds = NO;
        newLayer.shadowOffset = CGSizeMake(0, 3);
        newLayer.shadowColor = [[UIColor blackColor] CGColor]; // TODO
        newLayer.shadowRadius = 2.0f;
        newLayer.shadowOpacity = 0.35f;
        newLayer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:indentedBounds cornerRadius:cornerRadius] CGPath];
    }

    if (addSeparatorLine == YES) {
        CGFloat lineHeight = (1.0f / [UIScreen mainScreen].scale);
        CGRect separatorRect = CGRectMake(CGRectGetMinX(indentedBounds)+5, indentedBounds.size.height-lineHeight, indentedBounds.size.width-5, lineHeight);
        CALayer *lineLayer = [[CALayer alloc] init];
        lineLayer.frame = separatorRect;
        lineLayer.backgroundColor = tableView.separatorColor.CGColor;
        [newLayer addSublayer:lineLayer];
    }
    
    // create a new "background view" using this programmatically created layer
    UIView *roundedShadowView = [[UIView alloc] initWithFrame:indentedBounds];
    [roundedShadowView.layer insertSublayer:newLayer atIndex:0]; // rounded rect with shadow
    roundedShadowView.backgroundColor = nil;
    
    cell.backgroundView = roundedShadowView;
    
//  // shadow: start
//  CALayer *layer = roundedShadowView.layer;
//  layer.masksToBounds = NO;
//
//  layer.shadowOffset = CGSizeMake(0, 3);
//  layer.shadowColor = [[UIColor blackColor] CGColor]; // TODO
//  layer.shadowRadius = 2.0f;
//  layer.shadowOpacity = 0.35f;
//  layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:indentedBounds cornerRadius:cornerRadius] CGPath];
//
//  CGColorRef bColor = roundedShadowView.backgroundColor.CGColor;
//  roundedShadowView.backgroundColor = [UIColor whiteColor]; // @IC nil;
//  layer.backgroundColor = bColor;
//  // shadow: end
}

@end
