import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DateTimePageState();
  }
}

class DateTimePageState extends State<DateTimePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("时间控件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.parse("20181209"),
                  // 初始选中日期
                  firstDate: DateTime.parse("20181109"),
                  // 可选日期范围第一个日期
                  lastDate: DateTime.parse("20190109"),
                  // 可选日期范围最后一个日期
                  selectableDayPredicate: (dateTime) {
                    //通过此方法可以过滤掉可选范围内不可选的特定日期
                    if (dateTime.day == 10 ||
                        dateTime.day == 20 ||
                        dateTime.day == 30) {
                      //此处表示10号、20号、30号不可选
                      return false;
                    }
                    return true;
                  },
                  initialDatePickerMode:
                      DatePickerMode.day, //初始化选择模式，有day和year两种
                ).then((dateTime) {
                  //选择日期后点击OK拿到的日期结果
                  print(
                      '当前选择了：${dateTime.year}年${dateTime.month}月${dateTime.day}日');
                });
              },
              textColor: Colors.white,
              // 文本颜色
              color: Colors.blueAccent,
              // 按钮颜色
              highlightColor: Colors.lightBlue,
              //点击按钮后高亮的颜色
              elevation: 5,
              // 按钮图层高度
              highlightElevation: 8,
              // 点击按钮高亮后的图层高度
              animationDuration: Duration(milliseconds: 300),
              // 点击按钮后过渡动画时间
              child: Text('DatePicker'),
            ),
            CupertinoButton(
              child: Text(
                'TimePicker',
                textAlign: TextAlign.center,
              ),
              color: Colors.lightBlue, // 按钮颜色
              borderRadius: BorderRadius.all(Radius.circular(15.0)), // 按钮圆角设置
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(), //初始化显示时间
                ).then((timeOfDay) {
                  //选择时间后点击OK拿到的时间结果
                  if (timeOfDay == null) {
                    return;
                  }
                  print('当前选择了：${timeOfDay.hour}时${timeOfDay.minute}分');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
