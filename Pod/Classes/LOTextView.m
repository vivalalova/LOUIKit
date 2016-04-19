//
//  LOTextView.m
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/2.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LOTextView.h"
#import "LOPrefixHeader.h"

@interface LOTextView ()

//@property (strong, nonatomic) UILabel *placeHolderLabel;
@end

@implementation LOTextView {
    //	IBInspectable NSString *placeHolder;
    //	IBInspectable UIColor *placeHolderColor;
    IBInspectable CGRect padding;
}

//@synthesize placeHolderLabel;

//from code
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

////from storyboard?
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
    if (self.cornerRadius) {
        self.layer.cornerRadius = self.cornerRadius;
    }
    
    self.contentInset = UIEdgeInsetsMake(padding.origin.x, padding.origin.y, padding.size.width, padding.size.height);
    
    //    place holder
    /*
     * placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(0 + padding.origin.x,
     *                                                          0 + padding.origin.y,
     *                                                          self.bounds.size.width - padding.size.width,
     *                                                          21)];
     *
     * if (self.holderFontName) {
     *  NSDictionary* dict = @{ NSForegroundColorAttributeName: kFontColor,
     *                          NSFontAttributeName: [UIFont fontWithName:self.holderFontName size:self.font.pointSize]};
     *  placeHolderLabel.attributedText = [[NSAttributedString alloc]initWithString:placeHolder attributes:dict];
     * }
     *
     * placeHolderLabel.textColor = placeHolderColor ? placeHolderColor : [UIColor lightGrayColor];
     * placeHolderLabel.text = placeHolder;
     *
     * [self addSubview:placeHolderLabel];
     */
}

//- (void)textChanged:(NSNotification *)notification {
//
//	[UIView animateWithDuration:0.1 animations: ^{
//	    placeHolderLabel.hidden = self.text.length;
//	}];
//}

#pragma mark - getter and setter

-(NSUInteger)numberOfLine{
    
    float rows = (self.contentSize.height - self.textContainerInset.top - self.textContainerInset.bottom) / self.font.lineHeight;

    return rows;
}

//-(UILabel *)placeholder{
//
//        placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(0 + padding.origin.x,
//                                                                    0 + padding.origin.y,
//                                                                    self.bounds.size.width - padding.size.width,
//                                                                    21)];
//
//        if (self.holderFontName) {
//            NSLog(@"%@",self.holderFontName);
//            NSDictionary* dict = @{ NSForegroundColorAttributeName: kFontColor,
//                                    NSFontAttributeName: [UIFont fontWithName:self.holderFontName size:self.font.pointSize]};
//            placeHolderLabel.attributedText = [[NSAttributedString alloc]initWithString:placeHolder attributes:dict];
//        }
//
//        placeHolderLabel.textColor = placeHolderColor ? placeHolderColor : [UIColor lightGrayColor];
//        placeHolderLabel.text = placeHolder;
//        return placeHolderLabel;
//}

@end
