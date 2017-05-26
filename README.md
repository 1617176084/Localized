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

# 参考文献：
1 读取项目中的所有中文，并且将这些中文按照国际化格式写入文件中，可以直接拿来实现国际化 
https://github.com/ashen-zhao/ReadChinese

2 项目中的中文字符串一键替换。
既然要替换项目中使用到的中文字符串，那么前提就必须要先找到这些个字符串，然后将这些字符串，替换成我们定义的宏， 为了替换方便，可将这些字符串自身作为key， 这里不理解的不要紧，下面我还会讲到。 

既然是辨别中文字符串，那也就是说在项目文件中进行匹配查找，说到匹配，那就需要正则表达式了，用正则表达式匹配Xcode中的使用的中文字符串，使用

(@"[^"]*[\u4E00-\u9FA5]+[^"\n]*?")\s* 

即可， 打开你的Xcode 试试看，切记find 后面的选项要选择 Regular Expression, 默认选中的是Text。

替换成ASLocalizedString\($1\)

参考文献：http://www.devashen.com/blog/2016/01/18/localized03/
 
