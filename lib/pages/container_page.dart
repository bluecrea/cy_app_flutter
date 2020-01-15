// App启动页容器
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chuyi/pages/home/home_page.dart';
import 'package:chuyi/pages/listpage/list_page.dart';
import 'package:chuyi/pages/favorite/favorite_page.dart';
import 'package:chuyi/pages/person/person_center_page.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _BottomTabBarItem {
  var name, activeIcon;
  _BottomTabBarItem(this.name, this.activeIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> pages;

  final itemNames = [
    _BottomTabBarItem(
      '精选',Icons.home
    ),
    _BottomTabBarItem(
      '分类',Icons.view_list
    ),
    _BottomTabBarItem(
      '收藏',Icons.inbox
    ),
    _BottomTabBarItem(
      '我的',Icons.person
    )
  ];

  List<BottomNavigationBarItem> itemList;
  @override
  void initState() {
    super.initState();
    if(pages == null) {
      pages = [
        HomePage(),
        ListPage(),
        FavoritePage(),
        PersonCenterPage()
      ];
    }
    if(itemList == null) {
      itemList = itemNames.map((item) => BottomNavigationBarItem(
        title: Text(
          item.name,
          style: TextStyle(fontSize: 10.0)
        ),
        icon: Icon(
          item.activeIcon,
          size: 30.0,      
        )
      )).toList();
    }
  }
  int _selectIndex = 0;

  //Stack + Offstage 组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3)
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: CupertinoTabBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: _selectIndex, // 当前选中索引
        activeColor: Color.fromARGB(255, 251, 113, 1),
        inactiveColor: Colors.grey,
        // fixedColor: Color.fromARGB(255, 251, 113, 1),
        // type: BottomNavigationBarType.fixed,
      ),
    );
  }
}