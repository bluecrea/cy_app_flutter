import 'package:flutter/material.dart';
import 'package:chuyi/widgets/search_text_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {  
  @override
  HomePageState createState() => HomePageState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

MaterialColor myColor = MaterialColor(0xFFFB7101, color);
Map<int, Color>color = {
  50:Color.fromRGBO(251,113,1, .1),
  100:Color.fromRGBO(251,113,1, .2),
  200:Color.fromRGBO(251,113,1, .3),
  300:Color.fromRGBO(251,113,1, .4),
  400:Color.fromRGBO(251,113,1, .5),
  500:Color.fromRGBO(251,113,1, .6),
  600:Color.fromRGBO(251,113,1, .7),
  700:Color.fromRGBO(251,113,1, .8),
  800:Color.fromRGBO(251,113,1, .9),
  900:Color.fromRGBO(251,113,1, 1),
};

class HomePageState extends State<HomePage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final double _appBarHeight = 140.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  // 声明一个list，存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
    ..add(Image.network(
      'https://dimg02.c-ctrip.com/images/100v160000010paar9905_C_750_280.jpg',
      fit: BoxFit.fill,
    ))
    ..add(Image.network(
      'https://dimg04.c-ctrip.com/images/100915000000xs1l983F9_C_750_280.jpg',
      fit: BoxFit.fill,
    ))
    ..add(Image.network(
      'https://dimg04.c-ctrip.com/images/100a15000000xqymw6E71_C_750_280.jpg',
      fit: BoxFit.fill,
    ))
    ..add(Image.network(
      'https://dimg04.c-ctrip.com/images/100d15000000xlg9b4943_C_750_280.jpg',
      fit: BoxFit.fill,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: myColor,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating || _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_box,size: 38.0,),
                  onPressed: () {

                  },
                ),
              ],
              title: SearchTextFieldWidget(
                hintText: '今天吃什么？',
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Swiper(
                      itemBuilder: (BuildContext context,int index){
                        return imageList[index];
                      },
                      itemCount: 4,
                      autoplay: true,
                      autoplayDelay: 6000,
                      duration: 500,
                      pagination: new SwiperPagination(),
                    ),
                  ],
                ),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}