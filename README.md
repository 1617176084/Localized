# Localized
ios语言全球化，本地化工具

只编辑了ASLocalized.strings文件，没有更改任何代码，就能实现一键语言翻译。
使用方法：

1 定义：

> 语言跟随系统
> #define ASLocalizedString(key)  [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] localizedStringForKey:(key) value:nil table:@"ASLocalized"]]

2 增加全球化文件ASLocalized.strings，编写内容

> 下为效果图：

<img width='300px' src = 'https://github.com/1617176084/Localized/blob/master/Simulator%20Screen%20Shot%202017%E5%B9%B45%E6%9C%8822%E6%97%A5%20%E4%B8%8B%E5%8D%885.49.23.png'>
