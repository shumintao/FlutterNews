import 'package:flutter/material.dart';
import './listController.dart';
import './bannerSwiper.dart';
import './gridViewCollection.dart';

import 'package:myapp/AppBar/appbar.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
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
        'title': 'AppBar 基础',
        'class': appbarView(),
      },
      {
        'title': 'Swiper 轮播视图',
        'class': bannerSwiperView(),
      },
      {
        'title': 'GridView 瀑布流视图', 
        'class': gridViewCollection()
        },
      {
        'title': 'UI界面高难度布局', 
        'class': listController()
        },
      {
        'title': 'ListView基础布局',
         'class': listController()
         },
      {
        'title': 'CollectionView基础布局', 
        'class': listController()
        }
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
