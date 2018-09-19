//
//  SECardView.m
//  CardSlide
//
//  Created by iMac Maxt on 2018/8/10.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#define kWeakSelf(type)     __weak typeof(type) weak##type = type;

#define kStrongSelf(type)   __strong typeof(type) type = weak##type;

#define kWidth  ([UIScreen mainScreen].bounds.size.width)

#import "UICardView.h"


static inline CGRect CGRectFromOffsetHeight(float offset, float height) {
    return CGRectMake(0.0f, offset, [UIScreen mainScreen].bounds.size.width, height);
}
@interface UICardView ()
{
    NSInteger _total;
    NSInteger _page;
}
@property (nonatomic, strong) NSMutableArray *visibleCells;  //可见的Cell
@property (nonatomic, strong) NSMutableArray *reusableCells; //可重用的Cell

@property (nonatomic, assign) CGSize          defaultsCellSize;   //默认Cell的
@property (nonatomic, assign) CGPoint         defaultsCellCenter;
@property (nonatomic, assign) CGPoint         lastCellCenter;
@property (nonatomic, assign) CGAffineTransform         lastCardTransform;

@property (nonatomic, strong) NSMutableDictionary *cellClass;


@end

static int      CARD_NUM   = 5;
static CGFloat  CARD_SCALE = 0.96;

@implementation UICardView

- (void)setCellSize:(CGSize)aSize {
    self.defaultsCellSize = aSize;
}
- (void)setCellCenter:(CGPoint)aCenter {
    self.defaultsCellCenter = aCenter;
}

- (void)setupCardViewDefaults {
    self.backgroundColor  = [UIColor whiteColor];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;

    
    
    self.visibleCells  = [NSMutableArray array];
    self.reusableCells = [NSMutableArray array];
    
    self.cellClass     = [NSMutableDictionary dictionary];
    
    [self setCellSize:CGSizeMake(self.bounds.size.width * 0.85, self.bounds.size.height*0.70)];
    [self setCellCenter:CGPointMake(self.center.x, self.center.y - (self.bounds.size.height*0.02))];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCardViewDefaults];
    }
    return self;
}

// 初始化加载完成
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self firstTimeLoad];
}

#pragma mark - 首次加载
- (void)firstTimeLoad {
    
    if ([self.delegate respondsToSelector:@selector(cardView:sizeForRowAtIndexPath:)]) {
        [self setCellSize:[self.delegate cardView:self sizeForRowAtIndexPath:[NSIndexPath indexPathWithIndex:0]]];
    }
    if ([self.delegate respondsToSelector:@selector(cardView:centerForRowAtIndexPath:)]) {
        [self setCellCenter:[self.delegate cardView:self centerForRowAtIndexPath:[NSIndexPath indexPathWithIndex:0]]];
    }
    [self reloadData];
}

#pragma mark - Todo
- (void)reloadData
{
    _index = 0;
    _page = 0;
    //1.拿到数据源的总数
    NSInteger rows = [self.dataSource numberOfSectionsInCardView:self];
    _total = rows;
    for (NSInteger idx = 0; idx < rows; idx++) {
        //2.全部添加到reusable里备用
        [self.reusableCells addObject:[UICardViewCell class]];
    }
    
    //3.然后去reload可以显示的
    kWeakSelf(self)
    [self.reusableCells enumerateObjectsUsingBlock:^(UICardViewCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
        kStrongSelf(self)
        //3.先从reusable里拿出可以显示的做初始化,并添加到可见visible中
        if (idx < 5) {
            cell = [self cellForRowAtIndex:idx];
            if (idx != 0) {
                cell.userInteractionEnabled = NO;
            }
            [self.reusableCells removeObjectAtIndex:0];
        }
    }];
    
    //4.设置reusable的默认参数
    CGPoint center = CGPointMake(self.center.x, self.center.y-(self.frame.size.height*0.02));
    [self.visibleCells enumerateObjectsUsingBlock:^(UICardViewCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"第%ld个Cell , %d, %d",idx,cell.hidden, cell.userInteractionEnabled);
        
        [UIView animateKeyframesWithDuration:0.5 delay:0.06 * idx options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            kStrongSelf(self)
            cell.center     = center;
            cell.transform  = CGAffineTransformMakeRotation(0);
            
            if (idx > 0 && idx <= 4) {
                cell.transform  = CGAffineTransformScale(cell.transform, pow(CARD_SCALE, idx), pow(CARD_SCALE, idx));
                
                
                UICardViewCell *prevCell = [self.visibleCells objectAtIndex:idx - 1];
                CGRect frame    = cell.frame;
                frame.origin.y  = prevCell.frame.origin.y + (prevCell.frame.size.height - frame.size.height)  + 10 * pow(0.7, idx);
                cell.frame      = frame;
                cell.transform = cell.transform;
                
                //保存最后一个size与动画
                self.lastCellCenter     =   prevCell.center;
                self.lastCardTransform  =   prevCell.transform;
            } else {
                
            }
        } completion:nil];
        
        cell.originalCenter     = cell.center;
        cell.originalTransform  = cell.transform;
        
    }];
}


- (UICardViewCell *)cellForRowAtIndex:(NSInteger)index
{
//    NSLog(@"tag:%ld",index);
    //通过代理提供的重用标识创建对应的Cell
    UICardViewCell *cell = [self.dataSource cardView:self cellForRowAtIndexRow:index];
    cell.tag = index;
    if (index == 0) {
        cell.userInteractionEnabled = YES;
    } else {
        cell.userInteractionEnabled = NO;
    }
    //添加滑动行为
    [self setupCardViewActionWithCell:cell];
    [self addSubview:cell];
    [self sendSubviewToBack:cell];
    [self.visibleCells addObject:cell];
    return cell;
}

//注册重用标识
- (void)registerClass:(nullable Class )cellClass forCellReuseIdentifier:(NSString *)identifier
{
    [self.cellClass setObject:cellClass forKey:identifier];
}

// 处理重用对象返给代理
// 这里应该处理UICardViewCell 的默认配置
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    CGRect frame = CGRectMake(0, 0, self.bounds.size.width * 0.85, self.bounds.size.height*0.70);
    UICardViewCell *cell = [[[[self.cellClass objectForKey:identifier] class] alloc] initWithFrame:frame];
    [cell setSize:frame.size center:self.defaultsCellCenter];
    cell.transform = CGAffineTransformMakeScale(0, 0);
    return cell;
}
- (UICardViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier index:(NSInteger)index
{
    UICardViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
}


#pragma mark - 左右滑动动画完成后的操作(最后被调用的)
- (void)slideCell:(UICardViewCell *)cardView
{
    [self.visibleCells removeObject:cardView];
    cardView.transform  = self.lastCardTransform;
    cardView.center     = self.lastCellCenter;
    cardView.userInteractionEnabled     = NO;
    [self insertSubview:cardView belowSubview:[self.visibleCells lastObject]];
    [self.visibleCells addObject:cardView];

    
    [self.visibleCells enumerateObjectsUsingBlock:^(UICardViewCell *draggableView, NSUInteger idx, BOOL * _Nonnull stop) {
        
        draggableView.originalCenter    =   draggableView.center;
        draggableView.originalTransform =   draggableView.transform;
        if (idx == 0) {
            draggableView.userInteractionEnabled    =   YES;
        }
    }];
    
    [self.visibleCells removeObject:cardView];
    [cardView removeFromSuperview];

    
    if (self.reusableCells.count) {
        UICardViewCell *cell2  =   [self.reusableCells firstObject];
        cell2 = [self cellForRowAtIndex:self.visibleCells.count+self.index];
//        NSLog(@"tag:%ld - %d", cell2.tag, cell2.userInteractionEnabled);
        if (cell2) {
            UICardViewCell *cell1  =   [self.visibleCells lastObject];
            cell2.transform        =   cell1.originalTransform;
            cell2.center           =   cell1.originalCenter;
            cell2.hidden = NO;
//            [self.visibleCells insertObject:cell2 atIndex:self.visibleCells.count];
//            [self sendSubviewToBack:cell2];
            if (self.reusableCells.count != 0) {
                [self.reusableCells removeObjectAtIndex:0];
                
//                NSLog(@"%ld", _total - self.reusableCells.count);
            }
        }
    }
    
    
    
//    NSLog(@"index:%ld - visible:%ld - reusable:%ld",self.index, self.visibleCells.count, self.reusableCells.count);

}

#pragma mark - (左/右滑动完成才调用)
- (void)cardViewCellStatusComplete
{
    _index++;
    kWeakSelf(self)
    for (int i = 0; i < self.visibleCells.count; i++) {
    
        [UIView animateWithDuration:0.2 animations:^{
            kStrongSelf(self)
            if (self.visibleCells.count > (i+1)) {
                UICardViewCell *cell2  =   self.visibleCells[i+1];
                UICardViewCell *cell1  =   [self.visibleCells objectAtIndex:i];
                cell2.transform        =   cell1.originalTransform;
                cell2.center           =   cell1.originalCenter;
            }
        } completion:nil];
    }

}


#define RESET_ANIMATION_TIME 0.3
#pragma mark - 卡片回到中心时
- (void)cardViewCellActionCenter
{
    for (int i = 1; i < self.visibleCells.count-1; i++) {
        UICardViewCell *draggableView = self.visibleCells[i];
        [UIView animateWithDuration:RESET_ANIMATION_TIME animations:^{
            draggableView.transform =   draggableView.originalTransform;
            draggableView.center    =   draggableView.originalCenter;
        }];
    }
}


- (void)setupCardViewActionWithCell:(UICardViewCell *)aCell
{
    [aCell setCardViewCellSlideActionBlock:^(UICardViewCell *slideCell, UICardViewCellAction direction) {
        switch (direction) {
            case UICardViewCellActionLeft:
                [self slideCell:slideCell];
                break;
            case UICardViewCellActionRight:
                [self slideCell:slideCell];
                break;
            case UICardViewCellActionCenter:
                [self cardViewCellActionCenter];
                break;
            default:
                break;
        }
    }];
    [aCell setCardViewCellSlideStatusBlock:^(UICardViewCell *slideCell, UICardViewCellStatus status) {
        switch (status) {
            case UICardViewCellStatusWill:
                break;
            case UICardViewCellStatusBegin:
                break;
            case UICardViewCellStatusComplete:
                [self cardViewCellStatusComplete];
                break;
            default:
                break;
        }
    }];
}

//清空Cell
- (void)clearAllCells
{
    [self reloadData];
}

- (void)invalidate
{
    if (!self.userInteractionEnabled) {
        return;
    }
    CGPoint finishPoint = CGPointMake(-(kWidth*0.8)*2/3, 2*120 + self.frame.origin.y);
    [UIView animateWithDuration:0.5
                     animations:^{
                         
                         self.center = finishPoint;
                         self.transform = CGAffineTransformMakeRotation(-ROTATION_ANGLE);
                     } completion:^(BOOL finished) {
                         UICardViewCell *cell = [self cellForRowAtIndex:_page];
                         
                         cell.cardViewCellSlideActionBlock(cell, UICardViewCellActionLeft);
                        
                     }];
    
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}



@end
