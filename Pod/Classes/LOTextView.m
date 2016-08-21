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
@property (strong, nonatomic) UILabel *placeHolderLabel;
@property (strong, nonatomic) UITextField *placeholderTextField;
@end

@implementation LOTextView {
    IBInspectable CGRect padding;
}

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
    if (self.cornerRadius) {
        self.layer.cornerRadius = self.cornerRadius;
    }

    self.contentInset = UIEdgeInsetsMake(padding.origin.x, padding.origin.y, padding.size.width, padding.size.height);

    self.placeHolderLabel.text = self.placeHolder;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)dealloc {
    @try {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    }
    @catch (NSException *exception)
    {
    }
}

#pragma mark - KVO

- (void)textDidChange:(NSNotification *)noti {
    if (self.placeHolder) {
        self.placeHolderLabel.hidden = self.text.length;
        self.placeholderTextField.hidden = self.text.length;
    }
}

#pragma mark - getter and setter

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange:nil];
}

- (NSUInteger)numberOfLine {
    float rows = (self.contentSize.height - self.textContainerInset.top - self.textContainerInset.bottom) / self.font.lineHeight;

    return rows;
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = placeHolder;
    self.placeHolderLabel.text = _placeHolder;

    self.placeholderTextField.placeholder = _placeHolder;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (UILabel *)placeHolderLabel {
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[UILabel alloc] init];
        _placeHolderLabel.translatesAutoresizingMaskIntoConstraints = NO;

        _placeHolderLabel.textColor = [UIColor lightGrayColor];
        _placeHolderLabel.backgroundColor = [UIColor clearColor];

        //        [self addSubview:_placeHolderLabel];

        //        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_placeHolderLabel]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeHolderLabel)]];
        //        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_placeHolderLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeHolderLabel)]];
        //        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_placeHolderLabel(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeHolderLabel)]];

        [self layoutIfNeeded];
    }

    return _placeHolderLabel;
}

- (UITextField *)placeholderTextField {
    if (_placeholderTextField == nil) {
        _placeholderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
        //        _placeholderTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _placeholderTextField.userInteractionEnabled = NO;
        [self addSubview:_placeholderTextField];

        //        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_placeholderTextField]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeholderTextField)]];
        //        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_placeholderTextField]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeholderTextField)]];
        //        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_placeholderTextField(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_placeholderTextField)]];
    }
    return _placeholderTextField;
}

@end
