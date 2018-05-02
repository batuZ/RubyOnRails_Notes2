# NPOI
[参考资料](https://www.cnblogs.com/ICE-SKY/p/5856257.html) | [git](https://github.com/dotnetcore/NPOI)


目录

---

### [1.认识NPOI](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/Documents/NPOI.md#1%E8%AE%A4%E8%AF%86npoi-1)

  #### 1.1 什么是NPOI

  #### 1.2 版权说明

  #### 1.3 相关资源

  #### 1.4 团队介绍

  #### 1.5 回顾与展望

  #### 1.6 NPOI 1.2中各Assembly的作用

---

### 2. 使用NPOI生成xls文件

#### 2.1 创建基本内容

##### 2.1.1 创建Workbook和Sheet

##### 2.1.2 创建DocumentSummaryInformation和SummaryInformation

##### 2.1.3 创建单元格

##### 2.1.5 创建批注

##### 2.1.6 创建页眉和页脚

<br/>

#### 2.2 单元格操作

##### 2.2.1 设置格式

##### 2.2.2 合并单元格

##### 2.2.3 对齐相关设置

##### 2.2.4 使用边框

##### 2.2.5 字体设置

##### 2.2.6 背景和纹理

##### 2.2.7 设置宽度和高度

<br/>

#### 2.3 使用Excel公式

##### 2.3.1 基本计算

##### 2.3.2 SUM函数

##### 2.3.3 日期函数

##### 2.3.4 字符串相关函数

##### 2.3.5 IF函数

##### 2.3.6 CountIf和SumIf函数

##### 2.3.7 Lookup函数

##### 2.3.8 随机数函数

##### 2.3.9 通过NPOI获得公式的返回值

<br/>

#### 2.4 创建图形

##### 2.4.1 画线

##### 2.4.2 画矩形

##### 2.4.3 画圆形

##### 2.4.4 画Grid

##### 2.4.5 插入图片

<br/>

#### 2.5 打印相关设置

<br/>

#### 2.6 高级功能

##### 2.6.1 调整表单显示比例

##### 2.6.2 设置密码

##### 2.6.3 组合行、列

##### 2.6.4 锁定列

##### 2.6.5 显示/隐藏网格线

##### 2.6.6 设置初始视图的行、列

##### 2.6.7 数据有效性

##### 2.6.8 生成下拉式菜单

---

### 3. 项目实践

#### 3.1 基于.xls模板生成Excel文件

#### 3.2 生成九九乘法表

#### 3.3 生成一张工资单

#### 3.4 从xls文件中抽取文本

#### 3.5 巧妙使用ExcelChart

#### 3.6 导入Excel文件

---

### 1.认识NPOI

#### 1.1 什么是NPOI
    NPOI，顾名思义，就是POI的.NET版本。
    
    那POI又是什么呢？
    POI是一套用Java写成的库，能够帮助开发者在没有安装微软Office的情况下读写Office 97-2003的文件，
    支持的文件格式包括xls, doc, ppt等。在本文发布时，POI的最新版本是3.5 beta 6。

    NPOI 1.x是基于POI 3.x版本开发的，与poi 3.2对应的版本是NPOI 1.2，
    目前最新发布的版本是1.2.1，在该版本中仅支持读写Excel文件和Drawing格式，
    其他文件格式将在以后的版本中得到支持。

#### 1.2 版权说明
    NPOI采用的是Apache 2.0许可证（poi也是采用这个许可证），
    这意味着它可以被用于任何商业或非商业项目，你不用担心因为使用它而必须开放你自己的源代码，
    所以它对于很多从事业务系统开发的公司来说绝对是很不错的选择。

    当然作为一个开源许可证，肯定也是有一些义务的，例如如果你在系统中使用NPOI，
    你必须保留NPOI中的所有声明信息。对于源代码的任何修改，必须做出明确的标识。

    完整的apache 2.0许可证请见http://www.phpx.com/man/Apache-2/license.html
    
#### 1.3 相关资源
    官方网站：http://npoi.codeplex.com/
    POIFS Browser 1.2
    下载地址：http://npoi.codeplex.com/Release/ProjectReleases.aspx?ReleaseId=24305
    QQ交流群:
    
#### 1.4 团队介绍
      Tony Qu来自于中国上海，是这个项目的发起人和开发人员，时区是GMT+8，
      2008年9月开始了NPOI的开发，负责NPOI所有底层库的开发、测试和bug修复。
      个人blog地址为http://tonyqus.cnblogs.com/
      
      HüseyinTüfekçilerli来自于土耳其的伊斯坦布尔，也是这个项目的开发人员，时区是GMT+2，
      2008年11月参与了NPOI的开发，主要负责POIFS Browser 1.0的开发工作。
      个人blog地址为http://huseyint.com/
      
      aTao.Xiang，来自中国，2009年8月开始参与该项目，主要参与了NPOI 1.2中文版的撰写工作和推广工作
      个人blog地址为http://www.cnblogs.com/atao/
      
#### 1.5 回顾与展望
    目前POI版本中的HWPF（用于Word的读写库）还不是很稳定，并非正式发布版本，且负责HWPF的关键开发人员已经离开，
    所以NPOI可能考虑自己重新开发HWPF。另外，目前微软正在开发Open XML Format SDK，NPOI可能会放弃对ooxml的支持，
    当然这取决于用户的需求和Open XML Format SDK的稳定性和速度。从目前而言，NPOI有几大优势

    第一，完全基于.NET 2.0，而非.NET 3.0/3.5。

    第二，读写速度快（有个国外的兄弟回复说，他原来用ExcelPackage生成用了4-5个小时，现在只需要4-5分钟）

    第三，稳定性好（相对于用Office OIA而言，毕竟那东西是基于Automation做的，在Server上跑个Automation的东西，
    想想都觉得可怕），跑过了将近1000个测试用例（来自于POI的testcase目录）

    第四，API简单易用，当然这得感谢POI的设计师们

    第五，完美支持Excel 2003格式（据说myxls无法正确读取xls模板，但NPOI可以），以后也许是所有Office 2003格式

    希望NPOI把这些优势继续发扬下去，这样NPOI才会更有竞争力。
    
#### 1.6 NPOI 1.2中各Assembly的作用

    NPOI目前有好几个assembly，每个的作用各有不同，开发人员可以按需加载相应的assembly。在这里大概罗列一下：
    NPOI.Util     基础辅助库
    NPOI.POIFS    OLE2格式读写库
    NPOI.DDF      Microsoft Drawing格式读写库
    NPOI.SS       Excel公式计算库
    NPOI.HPSF     OLE2的Summary Information和Document Summary Information属性读写库
    NPOI.HSSF     Excel BIFF格式读写库

---

### 2. 使用NPOI生成xls文件

#### 2.1 创建基本内容

##### 2.1.1 创建Workbook和Sheet

作者：Tony Qu | [NPOI官方网站：http://npoi.codeplex.com/](http://npoi.codeplex.com/)

    创建Workbook说白了就是创建一个Excel文件，当然在NPOI中更准确的表示是在内存中创建一个Workbook对象流。

    本节作为第2章的开篇章节，将做较为详细的讲解，以帮助NPOI的学习者更好的理解NPOI的组成和使用。

    NPOI.HSSF是专门负责Excel BIFF格式的命名空间，
    供开发者使用的对象主要位于NPOI.HSSF.UserModel和NPOI.HSSF.Util命名空间下，
    下面我们要讲到的Workbook的创建用的就是NPOI.HSSF.UserModel.HSSFWorkbook类，这个类负责创建.xls文档。

    在开始创建Workbook之前，我们先要在项目中引用一些必要的NPOI assembly，如下所示：
    
    NPOI.dll

    NPOI.POIFS.dll

    NPOI.HSSF.dll

    NPOI.Util.dll
    
    
    要创建一个新的xls文件其实很简单，只要我们初始化一个新的`HSSFWorkbook`实例就行了，如下所示：
    
```c#
using NPOI.HSSF.UserModel;

...

HSSFWorkbook hssfworkbook = new HSSFWorkbook();
```
    是不是很方便啊，没有任何参数或设置，但这么创建有一些限制，
    这样创建出来的Workbook在Excel中打开是会报错的，
    因为Excel规定一个Workbook必须至少带1个Sheet，
    这也是为什么在Excel界面中，新建一个Workbook默认都会新建3个Sheet。
    所以必须加入下面的创建Sheet的代码才能保证生成的文件正常：
    
```c#
HSSFSheet sheet = hssfworkbook.CreateSheet("newsheet");

// 如果要创建标准的Excel文件，即拥有3个Sheet，可以用下面的代码：

hssfworkbook.CreateSheet("Sheet1");

hssfworkbook.CreateSheet("Sheet2");

hssfworkbook.CreateSheet("Sheet3");

// 最后就是把这个HSSFWorkbook实例写入文件了，代码也很简单，如下所示：

FileStream file = new FileStream(@"test.xls", FileMode.Create);

hssfworkbook.Write(file);

file.Close();
```
    这里假设文件名是test.xls，，在创建完FileStream之后，直接调用HSSFWorkbook类的Write方法就可以了。

    最后你可以打开test.xls文件确认一下，是不是有3个空的Sheet。

    相关范例请见NPOI 1.2正式版中的CreateEmptyExcelFile项目。
    
##### 2.1.2 创建DocumentSummaryInformation和SummaryInformation
作者：Tony Qu | [NPOI官方网站：http://npoi.codeplex.com/](http://npoi.codeplex.com/)

     DocummentSummaryInformation和SummaryInformation并不是Office文件的专利，
     只要是OLE2格式，都可以拥有这两个头信息，主要目的就是为了在没有完整读取文件数据的情况下获得文件的摘要信息，
     同时也可用作桌面搜素的依据。
     
     要了解DocummentSummaryInformation的全部属性请见http://msdn.microsoft.com/en-us/library/aa380374(VS.85).aspx；
     要了解SummaryInformation的全部属性请见http://msdn.microsoft.com/en-us/library/aa369794(VS.85).aspx。
     
```c#
using NPOI.HSSF.UserModel;

using NPOI.HPSF;

using NPOI.POIFS.FileSystem;

// 其中与DocummentSummaryInformation和SummaryInformation密切相关的是HPSF命名空间。

// 首先创建Workbook

HSSFWorkbook hssfworkbook = new HSSFWorkbook();

// 然后创建DocumentSummaryInformation

DocumentSummaryInformation dsi = PropertySetFactory.CreateDocumentSummaryInformation();

dsi.Company ="NPOI Team";

// 再创建SummaryInformation

SummaryInformation si = PropertySetFactory.CreateSummaryInformation();

si.Subject ="NPOI SDK Example";

// 因为是范例，这里仅各设置了一个属性，其他都没有设置。

// 现在我们把创建好的对象赋给Workbook，这样才能保证这些信息被写入文件。

hssfworkbook.DocumentSummaryInformation= dsi;

hssfworkbook.SummaryInformation= si;
```

    最后和2.1.1节一样，我们把Workbook通过FileStream写入文件。
    相关范例请见NPOI 1.2正式版中的CreatePOIFSFileWithProperties
##### 2.1.3 创建单元格
    用过Excel的人都知道，单元格是Excel最有意义的东西，我们做任何操作恐怕都要和单元格打交道。
    在Excel中我们要添加一个单元格只需要点击任何一个单元格，然后输入内容就是了，
    但是Excel底层其实没有这么简单，不同的单元格是有不同的类型的，
    比如说数值单元格是用NumberRecord表示，文本单元格是用LabelSSTRecord表示，
    空单元格是用BlankRecord表示。这也就意味着，在设置单元格时，
    你必须告诉NPOI你需要创建哪种类型的单元格。
    要创建单元格首先要创建单元格所在的行，比如，下面的代码创建了第0行：
```c#
HSSFSheet sheet1 = hssfworkbook.CreateSheet("Sheet1");
HSSFRow row1=sheet1.CreateRow(0);
// 行建好了，就可以建单元格了，比如创建A1位置的单元格：
row1.CreateCell(0).SetCellValue(1);
```
    这里要说明一下，SetCellValue有好几种重载，
    你可以设置单元格为bool、double、DateTime、string和HSSFRichTextString类型。
    其中对于string类型的重载调用的就是HSSFRichTextString类型的重载，
    所以是一样的，HSSFRichTextString可用于有字体或者Unicode的文本。

    如果你觉得每一行要声明一个HSSFRow很麻烦，可以用下面的方式：
```c#
sheet1.CreateRow(0).CreateCell(0).SetCellValue("This is a Sample");
// 这么用有个前提，那就是第0行还没创建过，否则得这么用：
sheet1.GetRow(0).CreateCell(0).SetCellValue("This is a Sample");

如果你要获得某一个已经创建的单元格对象，可以用下面的代码：
sheet1.GetRow(row_index).GetCell(column_index);
```
    注意：这里的行在Excel里是从1开始的，但是NPOI内部是从0开始的；
    列在Excel里面是用字母表示的，而NPOI中也是用从0开始的数字表示的，所以要注意转换。
    
    
##### 2.1.5 创建批注
    在过去，我们恐怕没有办法实现这一功能，
    因为无论是cvs法、html法、oledb法都没有提供这样的接口，当然Office PIA法可以做到，
    但是性能实在太差，而且稳定性不好，经常莫名其妙crash（这是某某兄弟给我的反馈，我引用了下，呵呵）。
    在以后的教程中，你将看到更多在过去无法通过传统方法实现的东西，好戏才刚刚开始。

    批注主要有三个属性需要设置，一个是批注的位置和大小、一个是批注的文本、还有一个是批注的作者。

    批注的位置和大小，在Excel中是与单元格密切相关的，NPOI中通过HSSFClientAnchor的实例来表示，
    它的构造函数比较复杂，有8个参数，它们分别是

参数 | 说明|
---|---|
dx1 |第1个单元格中x轴的偏移量|
dy1 |第1个单元格中y轴的偏移量|
dx2 |第2个单元格中x轴的偏移量|
dy2 |第2个单元格中y轴的偏移量
col1 |第1个单元格的列号
row1 |第1个单元格的行号
col2 |第2个单元格的列号
row2 |第2个单元格的行号

```c#
// 如果我们打算让注释显示在B3和E5之间，就应该这么写：

HSSFPatriarch patr = sheet.CreateDrawingPatriarch();

HSSFComment comment1 = patr.CreateComment(new HSSFClientAnchor(0, 0, 0, 0, 1, 2 , 4, 4));

//下面我们设置这个批注的内容和作者，这个比较简单：

comment1.String=new HSSFRichTextString("Hello World");

comment1.Author="NPOI Team";

//最后一步就是把批注赋给某个单元格：

HSSFCell cell= sheet.CreateRow(1).CreateCell(1);

cell.CellComment= comment1;
```
    对于批注，你有两种选择，一种是隐藏（默认），一种是显示（即表单一打开就显示该批注），
    可以通过comment1.Visible属性来控制。
    
##### 2.1.6 创建页眉和页脚
    很多人并不知道Excel的页眉和页脚功能，因为在界面上是显示不了页眉和页脚的，
    必须在打印页面中才能看到，这也直接导致了其设置界面也显得更隐秘，
    你必须进入页面设置 –>页眉和页脚才能设置。以下是Office 2007中的设置界面。

    当你按“自定义页眉”或“自定义页脚”时，你会看到以下界面，Excel把页眉、页脚分成了左中右三部分，
    这一点绝非单纯体现在界面上，在底层的存储中也是如此。
    如果你设置的是“左”的内容，底层的存储字符串就会在开头加上&L，如果是“右”的内容则会加上&R，
    所以HeaderRecord中的字符串看上去是这样的："&C&LFooter A&R”，
    这个字符串的意思是仅设置了“左”的内容，内容是Footer A。

    看了这些我想你应该对页眉和页脚有所了解了，回过头来说NPOI，
    NPOI中主要是靠HSSFSheet.Header和HSSFSheet.Footer来设置的，
    这两个属性分别是HSSFHeader和HSSFFooter类型的。

    参考代码如下：
    
```c#
HSSFSheet s1= hssfworkbook.CreateSheet("Sheet1");
s1.CreateRow(0).CreateCell(1).SetCellValue(123);

//set headertext
s1.Header.Center="This is a test sheet";

//set footertext
s1.Footer.Left="Copyright NPOI Team";
s1.Footer.Right="created by Tony Qu（瞿杰）";
```
    至于一些Excel特殊字符，比如说页码可以用&P，当前日期可以用&D，其他的东西你就自己研究吧。
    
<br/>

#### 2.2 单元格操作

##### 2.2.1 设置格式
    在Excel中我们经常要设置格式，比如说日期格式（yyyymmdd）、小数点格式（1.20）、货币格式（$2000）、
    百分比格式（99.99%）等等，这些东西在过去我们恐怕只能在服务器端生成好，不但增加了服务器端的代码量，
    还造成了不必要的字符串替换操作，如今NPOI将让服务器从这种完全没有必要的操作中解放出来，
    一切都将由Excel在客户端处理。

    使用NPOI时要注意，所有的格式都是通过CellStyle.DataFormat赋给单元格的，而不是直接赋给单元格。
    
```c#
/// 案例一 日期格式
/// 假设我们现在需要显示的日期的格式为2008年5月5日，可以用下面的代码生成：

HSSFSheetsheet = hssfworkbook.CreateSheet("newsheet");

HSSFCell cell= sheet.CreateRow(0).CreateCell(0);

cell.SetCellValue(newDateTime(2008,5,5));

//set dateformat

HSSFCellStylecellStyle = hssfworkbook.CreateCellStyle();

HSSFDataFormatformat = hssfworkbook.CreateDataFormat();

cellStyle.DataFormat= format.GetFormat("yyyy年m月d日");

cell.CellStyle=cellStyle;
```
    由于这里的“yyyy年m月d日”属于自定义格式（区别于Excel内嵌的格式），
    所以必须用hssfworkbook.CreateDataFormat()创建一个HSSFDataFormat实例，
    然后使用format.GetFormat来获取相应的格式，只要是Excel支持的格式表示方式，
    这种方式都能够实现。
    
```c#
/// 案例二保留2位小数
/// 假设我们有个单元格的值为1.2，怎么显示成1.20呢？在Excel中可以用“0.00”来表示，所以下面的代码就能完成：

// Create arow and put some cells in it. Rows are 0 based.

HSSFCell cell= sheet.CreateRow(0).CreateCell(0);

//set valuefor the cell

cell.SetCellValue(1.2);

//numberformat with 2 digits after the decimal point - "1.20"

HSSFCellStylecellStyle = hssfworkbook.CreateCellStyle();

cellStyle.DataFormat= HSSFDataFormat.GetBuiltinFormat("0.00");

cell.CellStyle= cellStyle;
```
    这里与上面有所不同，用的是HSSFDataFormat.GetBuiltinFormat()方法，之所以用这个，是因为0.00是Excel内嵌的格式

```c#
///案例三货币格式
///货币格式在金融的项目中经常用到，比如说人民币符号¥，美元符号$等，这里可以用下面的代码表示：

HSSFCellcell2 = sheet.CreateRow(1).CreateCell(0);

cell2.SetCellValue(20000);

HSSFCellStylecellStyle2 = hssfworkbook.CreateCellStyle();

HSSFDataFormatformat = hssfworkbook.CreateDataFormat();

cellStyle2.DataFormat= format.GetFormat("¥#,##0");

cell2.CellStyle= cellStyle2;
```
    注意，这里还加入了千分位分隔符，所以是#,##，至于为什么这么写，你得去问微软，呵呵。
    
```c#
///案例四百分比
///百分比在报表中也很常用，其实基本上和上面一样，只是格式表示是0.00%，代码如下：

cellStyle4.DataFormat= HSSFDataFormat.GetBuiltinFormat("0.00%");
```
    由于这里是内嵌格式，所以直接用HSSFDataFormat.GetBuiltinFormat即可。

```c#
/// 案例五中文大写
/// 在表示金额时，我们时常会用到，我也见过不少兄弟实现了数字转中文大小写的工具类，
/// 以后你可以尝试让Excel去处理这一切，代码和刚才差不多，也是改格式的表示：

HSSFDataFormatformat = hssfworkbook.CreateDataFormat();

cellStyle6.DataFormat= format.GetFormat("[DbNum2][$-804]0");
```
    由于是自定义格式，所以用了HSSFDataFormat.GetFormat，相信你对这两种获取格式的形式的区别越来越熟悉了。
    
```c#
/// 案例六科学计数法
/// 这东西数学课上我们都学过，虽然用的不多，但是既然Excel支持，这里也提一下：

cellStyle3.DataFormat= HSSFDataFormat.GetBuiltinFormat("0.00E+00");
```
    最后总结一下HSSFDataFormat.GetFormat和HSSFDataFormat.GetBuiltinFormat的区别：

    当使用Excel内嵌的（或者说预定义）的格式时，直接用HSSFDataFormat.GetBuiltinFormat静态方法即可。

    当使用自己定义的格式时，必须先调用HSSFWorkbook.CreateDataFormat()，
    因为这时在底层会先找有没有匹配的内嵌FormatRecord，如果没有就会新建一个FormatRecord，
    所以必须先调用这个方法，然后你就可以用获得的HSSFDataFormat实例的GetFormat方法了，
    当然相对而言这种方式比较麻烦，所以内嵌格式还是用HSSFDataFormat.GetBuiltinFormat静态方法更加直接一些。
    不过自定义的格式也不是天马行空随便定义，还是要参照Excel的格式表示来定义，具体请看相关的Excel教程。

    注意：自定义的FormatRecord是嵌入xls文件内部的，所以不用担心对方Excel中有没有定义过这种格式，都是能够正常使用的。
    
##### 2.2.2 合并单元格
    合并单元格在制作表格时很有用，比如说表格的标题就经常是把第一行的单元格合并居中。
    那么在NPOI中应该如何实现单元格的合并呢？

    为了实现这一功能，NPOI引入了新的概念，即Region，因为合并单元格，其实就是设定一个区域。
    下面说一下Region类的参数，Region总共有4个参数，如下所示:
    

Region的参数|说明|
---|---|
FirstRow|区域中第一个单元格的行号|
FirstColumn|区域中第一个单元格的列号|
LastRow|区域中最后一个单元格的行号|
LastColumn|区域中最后一个单元格的列号|

由于单元格的合并都是在表的基础上建立的，所以我们得先建Sheet：
```c#
HSSFWorkbook hssfworkbook =new HSSFWorkbook();
HSSFSheet sheet = hssfworkbook.CreateSheet("newsheet");
```
接下来我们根据实际场景来做一些演示。
```c#
/// 场景一标题行的合并
/// 这种场景是最常见的，比如说我们要建立一张销售情况表，英文叫Sales Report
/// 我们先设置居中和字体样式，这里我们采用20号字体，代码如下：

HSSFRow row =sheet.CreateRow(0);

HSSFCell cell= row.CreateCell(0);

cell.SetCellValue("Sales Report");

HSSFCellStyle style = hssfworkbook.CreateCellStyle();

style.Alignment= HSSFCellStyle.ALIGN_CENTER;

HSSFFont font= hssfworkbook.CreateFont();

font.FontHeight= 20*20;

style.SetFont(font);

cell.CellStyle= style;

/// 要产生图中的效果，即把A1:F1这6个单元格合并，然后添加合并区域：

sheet.AddMergedRegion(new Region(0, 0, 0,5));
```
```c#
/// 场景二多行合并
/// 看完场景一，你可不要认为多行合并就需要一行一行做，其实也只需要一行代码，
/// 比如说我们要把C3:E5合并为一个单元格，那么就可以用下面的代码：

sheet.AddMergedRegion(new Region(2, 2, 4,4));

/// 提示即使你没有用CreateRow和CreateCell创建过行或单元格，也完全可以直接创建区域然后把这一区域合并，
/// Excel的区域合并信息是单独存储的，和RowRecord、ColumnInfoRecord不存在直接关系。
```

##### 2.2.3 对齐相关设置
    本节将围绕“对齐”选项卡中的设置展开，虽然实际上你会发现该选项卡中的很多设置和对齐没有什么关系。 
    合并单元格已经在2.2.2节讲过了，这里就不提了。 
    
    首先我们用代码创建必要的单元格，代码如下：
    
```csharp
HSSFWorkbookhssfworkbook =new HSSFWorkbook();

HSSFSheetsheet1 = hssfworkbook.CreateSheet("Sheet1");

HSSFRow row =sheet1.CreateRow(0);

//这里我们假设在A0单元格中加入了文本Test
row.CreateCell(0).SetCellValue("Test");

//请注意接下来我们要做的所有操作都是在CellStyle的基础上完成的，所以我们创建一个HSSFCellStyle：
HSSFCellStylestyle=hssfworkbook.CreateCellStyle();
```

```c#
/// 水平对齐
/// 这里用的是HSSFCellStyle.Alignment，默认值自然是常规，即HSSFCellStyle.ALIGN_GENERAL。

//如果是左侧对齐就是

style.Alignment= HSSFCellStyle.ALIGN_LEFT;

//如果是居中对齐就是

style.Alignment= HSSFCellStyle.ALIGN_CENTER;

//如果是右侧对齐就是

style.Alignment= HSSFCellStyle.ALIGN_RIGHT;

//如果是跨列举中就是

style.Alignment= HSSFCellStyle.ALIGN_CENTER_SELECTION;

//如果是两端对齐就是

style.Alignment= HSSFCellStyle.ALIGN_JUSTIFY;

//如果是填充就是

style.Alignment= HSSFCellStyle.ALIGN_FILL;
```
注意：以上选项仅当有足够的宽度时才能产生效果，不设置宽度恐怕看不出区别。
```c#
///垂直对齐
///这里用的是HSSFCellStyle.VerticalAlignment，默认值为居中，即HSSFCellStyle.VERTICAL_CENTER

//如果是靠上就是

style.VerticalAlignment=HSSFCellStyle.VERTICAL_TOP

//如果是居中就是

style.VerticalAlignment=HSSFCellStyle.VERTICAL_CENTER

//如果是靠下就是

style.VerticalAlignment=HSSFCellStyle.VERTICAL_BOTTOM

//如果是两端对齐就是

style.VerticalAlignment=HSSFCellStyle.VERTICAL_JUSTIFY
```
注意：以上选项仅当有足够的高度时才能产生效果，不设置高度恐怕看不出区别。
```c#
///自动换行
///自动换行翻译成英文其实就是Wrap的意思，所以这里我们应该用WrapText属性，这是一个布尔属性

style.WrapText=true;

///文本缩进
///这是一个不太引人注意的选项，所以这里给张图出来，让大家知道是什么，
///缩进说白了就是文本前面的空白，我们同样可以用属性来设置，这个属性叫做Indention。

style.Indention= 3;

///文本旋转
///文本方向大家一定在Excel中设置过，上图中就是调整界面，主要参数是度数，那么我们如何在NPOI中设置呢？

style.Rotation=(short)90;
//请注意，这里的Rotation取值是从-90到90，而不是0-180度。
```
    以上的一些功能，比如文本旋转和自动换行，使用传统的cvs和html法恐怕是无法实现的。
    随着学习的不断深入，你将越来越意识到使用NPOI生成Excel其实如此简单。
    
最后别忘了把样式变量style赋给HSSFCellStyle.CellStyle，否则就前功尽弃了，呵呵！


##### 2.2.4 使用边框

##### 2.2.5 字体设置

##### 2.2.6 背景和纹理

##### 2.2.7 设置宽度和高度

<br/>

#### 2.3 使用Excel公式

##### 2.3.1 基本计算

##### 2.3.2 SUM函数

##### 2.3.3 日期函数

##### 2.3.4 字符串相关函数

##### 2.3.5 IF函数

##### 2.3.6 CountIf和SumIf函数

##### 2.3.7 Lookup函数

##### 2.3.8 随机数函数

##### 2.3.9 通过NPOI获得公式的返回值

<br/>

#### 2.4 创建图形

##### 2.4.1 画线

##### 2.4.2 画矩形

##### 2.4.3 画圆形

##### 2.4.4 画Grid

##### 2.4.5 插入图片

<br/>

#### 2.5 打印相关设置

<br/>

#### 2.6 高级功能

##### 2.6.1 调整表单显示比例

##### 2.6.2 设置密码

##### 2.6.3 组合行、列

##### 2.6.4 锁定列

##### 2.6.5 显示/隐藏网格线

##### 2.6.6 设置初始视图的行、列

##### 2.6.7 数据有效性

##### 2.6.8 生成下拉式菜单

---

### 3. 项目实践

#### 3.1 基于.xls模板生成Excel文件

#### 3.2 生成九九乘法表

#### 3.3 生成一张工资单

#### 3.4 从xls文件中抽取文本

#### 3.5 巧妙使用ExcelChart

#### 3.6 导入Excel文件
