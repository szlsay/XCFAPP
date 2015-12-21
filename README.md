# XCFAPP
高仿下厨房APP
# 2015-12-21 
添加大神讲的教程RAC，详细教程找码神吴彦祖
最常用的几招：（死记硬背都能会的）
target-action：
	文本框事件：
	UITextField * textField = [[UITextField alloc]init];
    @weakify(self); //  __weak __typeof__(self) self_weak_ = self;
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);   //  __strong __typeof__(self) self = self_weak_;
        make.size.mas_equalTo(CGSizeMake(180, 40));
        make.center.equalTo(self.view);
    }];

    [[textField rac_signalForControlEvents:UIControlEventEditingChanged]
    subscribeNext:^(id x) { LxDBAnyVar(x); }];

    [textField.rac_textSignal subscribeNext:^(id x) { LxDBAnyVar(x);}];
    
	Tip: id x -> NSString * text

	手势：(不待演示老式的写法了)
  self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    [[tap rac_gestureSignal] subscribeNext:^(UITapGestureRecognizer * tap) {
       
        LxDBAnyVar(tap);
    }];
    [self.view addGestureRecognizer:tap];
# 2015-12-20 
添加北京四中网校的大神 Developer.Lx的打印
