import 'package:flutter/material.dart';
import './listController.dart';
import './bannerSwiper.dart';
import './gridViewCollection.dart';
import './normalController.dart';
import './rowController.dart';
import './cardController.dart';
import 'package:myapp/AppBar/appbar.dart';
import './expandController.dart';
import './stackController.dart';
import './indexedStackController.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0, ///去掉底部阴影
        centerTitle: true,
        title: new Text(
          'UI界面布局',
          style: new TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _right_navgation_action,
          )
        ],
      ),
      body: new TableListView(),
    );
  }
}

///导航右侧按钮事件
void _right_navgation_action() {
  print('action');
}

class TableListView extends StatefulWidget {
  @override
  _TableListViewState createState() => _TableListViewState();
}

class _TableListViewState extends State<TableListView> {
  var lists = new List();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    ///初始化数据
    lists = [
      {
        'title': 'AppBar 导航视图',
         'class': appbarView(),
         },
      {
        'title': 'Ordinary 普通视图',
        'class': normalContrller(),
      },
      {
        'title': 'Swiper 轮播视图',
        'class': bannerSwiperView(),
      },
      {
        'title': 'GridView 瀑布流视图', 
        'class': gridViewCollection(),
        },
      {
        'title': 'ListView 简单视图', 
        'class': listController(),
        },
      {
        'title': 'Row 视图', 
        'class': rowController(),
        },
      {
        'title': 'Card 卡片视图', 
        'class': cardController(),
        },
       {
        'title': 'Expand 视图', 
        'class': expandController(),
        },
        {
        'title': 'Stack ,Positioned 视图', 
        'class': stackCpntroller(),
        },
        {
        'title': 'IndexStack 视图', 
        'class': indexedStackController(),
        },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: new Text(
            lists[index]['title'],
            style: _biggerFont,
          ),
          trailing: new Icon(Icons.keyboard_arrow_right),
          onTap: () {
            setState(() {
              print('Tap:$index');
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return lists[index]['class'];
                  },
                ),
              );
            });
          },
        );
      },
      itemCount: lists.length,
      separatorBuilder: (BuildContext context, int index) =>
          new Divider(), //创建分割线
    );
  }
}
