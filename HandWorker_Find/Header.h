

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 180, 27)];
        label.font = NORMALFONT;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}