import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List _spList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13"
  ];
  TabController? _tabController;

  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = null;
    _tabController = TabController(
        initialIndex: 0, length: _spList.length, vsync: this); // 直接传this

    print("---->${_tabController?.previousIndex}");

    if (_tabController?.indexIsChanging == true) {
      print("---->indexch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动态TabBar"),
      ),
      body: Column(
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding: EdgeInsets.only(left: 1),
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text("device"),
              ),
              RaisedButton(
                child: Text("更新TabBar个数"),
                onPressed: () {
                  setState(() {
                    _spList = ["1", "2", "3", "4", "5"];
                    _tabController = TabController(
                        initialIndex: 1, length: _spList.length, vsync: this);
                    _tabController?.animateTo(0);
                  });
                },
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _spList.map((f) {
                return Center(
                  child: new Text(
                    f,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: _spList.isEmpty
                    ? []
                    : _spList.map((f) {
                        return Center(
                          child: new Text("第$f页"),
                        );
                      }).toList()),
          ),
        ],
      ),
    );
  }
}
