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
```
    注意：这里的行在Excel里是从1开始的，但是NPOI内部是从0开始的；
    列在Excel里面是用字母表示的，而NPOI中也是用从0开始的数字表示的，所以要注意转换。
    
    
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
