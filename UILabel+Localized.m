//
//  UILabel+Localized.m
//  postmark
//
//  Created by Apple on 17/5/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "UILabel+Localized.h"

@implementation UILabel (Localized)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (void)initialize{
//    [super initialize];
    [[self class] method_exchange];
}
+(void)method_exchange{
    static BOOL isExchange = NO;
    if (isExchange == NO) {
        
 
    //UIlable
    /** 获取原始setBackgroundColor方法 */
    Method originalMUIlable = class_getInstanceMethod([self class], @selector(setText:));
    /** 获取自定义的pb_setBackgroundColor方法 */
    Method exchangeMUIlable = class_getInstanceMethod([self class], @selector(Localized_setText:));
    
    /** 交换方法 */
    method_exchangeImplementations(originalMUIlable, exchangeMUIlable);
    isExchange= true;
        
    
    }
}


-(void)Localized_setText:(NSString *)text{
    self.adjustsFontSizeToFitWidth = true;
    [self Localized_setText:ASLocalizedString(text)];
}
- (void)Localized_setTitle:(nullable NSString *)title forState:(UIControlState)state{
    [self Localized_setTitle:ASLocalizedString(title) forState:state];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [[self class] method_exchange];
     self.text = self.text;
    
}
- (void)prepareForInterfaceBuilder{
        self.text = self.text;
}
 @end
