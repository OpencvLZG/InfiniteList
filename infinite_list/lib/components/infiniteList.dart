import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  List<Widget> widgtes = [];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Column(
          children: [
            Container(
              height: 400,
              child: ListView(
                controller: scrollController,
                children: AnimateList(
                    interval: 50.ms,
                    effects: [
                      ShimmerEffect(color: Colors.white),
                      FadeEffect(duration: 50.ms),
                      MoveEffect(
                          begin: Offset(-16, 0), curve: Curves.easeOutQuart)
                    ],
                    children: widgtes),
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       _loadData();
            //     },
            //     child: Text("LoadData"))
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(2, 3), blurRadius: 20)
            ]),
      ),
    );
  }

  void _listLisnter() {
    print("scroll");
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("scroll to bottom");

      setState(() {
        widgtes.add(BuildListItem());
      });
      print("add one widget to list");
    }
    if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      print("scroll to top");

      setState(() {
        widgtes.clear();
      });
      print("clear widgt");
    }
  }

  @override
  void initState() {
    for (var i = 0; i < 5; i++) {
      widgtes.add(BuildListItem());
    }
    scrollController.addListener(_listLisnter);
  }

  void _loadData() {
    // setState(() {
    //   for (var i = 0; i < 10; i++) {
    //     widgtes.add(BuildListItem());
    //   }
    // });
  }

  void _addListItem() {}
  Widget BuildListItem() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8)),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: 50,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
