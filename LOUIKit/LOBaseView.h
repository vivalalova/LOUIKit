//
//  LOBaseView.h
//  LOUIKit
//
//  Created by Kuo-HsunShih on 2016/1/7.
//  Copyright © 2016年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef IBDesignableBlock (^TypeName)(parameterTypes);
typedef void (^DesignableBlock)();


@interface LOBaseView : UIView

@property (strong,nonatomic) DesignableBlock block;


+(DesignableBlock)block;

@end
