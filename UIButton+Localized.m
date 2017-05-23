//
//  UIButton+Localized.m
//  postmark
//
//  Created by Apple on 17/5/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "UIButton+Localized.h"

@implementation   UIButton (Localized)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (void)initialize{
    [[self class] method_exchange];
}
+(void)method_exchange{
        static BOOL isExchange = NO;
       if (isExchange == NO) {
    //UIButton
    /** 获取原始setBackgroundColor方法 */
    Method originalMUIButton = class_getInstanceMethod([self class], @selector(setTitle:forState:));
    /** 获取自定义的pb_setBackgroundColor方法 */
    Method exchangeMUIButton = class_getInstanceMethod([self class], @selector(Localized_setTitle:forState:));
    
    /** 交换方法 */
    method_exchangeImplementations(originalMUIButton, exchangeMUIButton);
           isExchange= true;
       }
}
- (void)Localized_setTitle:(nullable NSString *)title forState:(UIControlState)state{
     self.titleLabel.adjustsFontSizeToFitWidth = true;
    [self Localized_setTitle:ASLocalizedString(title) forState:state];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [[self class] method_exchange];
    
    [self setTitle:[self titleForState:UIControlStateNormal] forState:UIControlStateNormal];
    NSLog(@"%s%@",__func__,[self titleForState:UIControlStateNormal]);
}
- (void)prepareForInterfaceBuilder{
    [self setTitle:[self titleForState:UIControlStateNormal] forState:UIControlStateNormal];
}
@end
