## 检测代码执行时间 
(Benchmark)[http://ruby-doc.org/stdlib-2.0.0/libdoc/benchmark/rdoc/Benchmark.html#method-c-benchmark]
```ruby
arr = (1..10**6).to_a
#打印代码块执行用时
pp Benchmark.measure{ arr.each do |i|; i ; end}

#比较多个代码块执行用时,bm直接比较，bmbm，精确比较
Benchmark.bmbm(7) do |b|
  b.report('time_each:'){ arr.each do |i|; i; end }
  b.report('time_forin'){for i in arr; i; end}
end
```
## Byebug's commands

Command     | Aliases         | Subcommands									| 说明
-------     | -------         | -----------									| -----------
`backtrace` | `bt` `w` `where`|															|
`break`     | `b`             | 														|	设置或询问断点，b 2
`catch`     | `cat`           |															|
`condition` | `cond`          |															|
`continue`  | `c` `cont`      |															|	继续运行
`debug`     |                 |															|
`delete`    | `del`           |															|	删掉断点
`disable`   | `dis`           | `breakpoints` `display` 		|	显示变量的值
`display`   | `disp`          |															|
`down`      |                 |															|	去更深处
`edit`      | `ed`            |															|
`enable`    | `en`            | `breakpoints` `display`			|
`finish`    | `fin`           |															|	去外面一层
`frame`     | `f`             |															|
`help`      | `h`             |															|
`history`   | `hist`          |															|
`info`      | `i`             | `args` `breakpoints` `catch` `display` `file` `line` `program`	|
`interrupt` | `int`           |															|
`irb`       |                 |															|
`kill`      |                 |															|
`list`      | `l`             |															|	询问、浏览代码，通过 l= 指定要浏览的位置 
`method`    | `m`             | `instance`									|
`next`      | `n`             |															|	跳到下一行
`pry`       |                 |															| pry 模式，需要增加 gem 'pry'
`quit`      | `q`             |															| 退出debug
`restart`   |                 |															|
`save`      | `sa`            |															|
`set`       |                 | `autoirb` `autolist` `autopry` `autosave` `basename` `callstyle` `fullpath` `histfile` `histsize` `linetrace` `listsize` `post_mortem` `savefile` `stack_on_error` `width`																		|
`show`      |                 | `autoirb` `autolist` `autopry` `autosave` `basename` `callstyle` `fullpath` `histfile` `histsize` `linetrace` `listsize` `post_mortem` `savefile` `stack_on_error` `width`																		|
`skip`      | `sk`            |															|
`source`    | `so`            |															|
`step`      | `s`             |															|	进入方法
`thread`    | `th`            | `current` `list` `resume` `stop` `switch`	| 查看线程 l th, 停止指定线程 th stop 2
`tracevar`  | `tr`            |																						|
`undisplay` | `undisp`        |																						|
`untracevar`| `untr`          |																						|
`up`        |                 |															|	去更外面
`var`       | `v`             | `all` `constant` `global` `instance` `local`	|
