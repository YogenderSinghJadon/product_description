import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// image row and its properties
class image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/notebooks.jpg'),
          fit: BoxFit.fill,
        ),
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(
          color: Colors.black,
          width: 6.0,
        ),
      ),
    );
  }
}

Widget decorate(Widget input) {
  return Material(
    color: Colors.grey[900],
    child: InkWell(
      onTap: (){
        print('Tapped');
      },
      child: Container(
        height: 75,
        padding: EdgeInsets.only(left: 15, right: 15),
        //color: Colors.lightBlueAccent,
        //padding: EdgeInsets.all(5),
        child: input,
      ),
    ),
  );
}

class ItemName extends StatelessWidget {
  String itemname = 'Item_Name';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Text(itemname,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent)));
  }
}

List<List<String>> getShop() {
  var items = List<List<String>>.generate(50,
      (counter) => ['Shop_$counter', 'Distance_$counter', 'Price_$counter']);
  return items;
}

Widget getListView() {
  var listItems = getShop();
  var listview = ListView.separated(
      itemCount: listItems.length + 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            title: image(),
          );
        } else if (index == 1) {
          //separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey,);
          return ListTile(
            title: decorate(ItemName()),
          );

        } else if (index == 2) {
          return ListTile(
            title: decorate(tableHead()),
          );
        } else {
          return ListTile(
            title: decorate(
              listTileItem(listItems[index - 3][0], listItems[index - 3][1],
                  listItems[index - 3][2]),
            ),
          );
        }
      },
    separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey,),
      );
  return listview;
}

Widget listTileItem(item, distance, price) {
  return Row(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Center(
          child: Text(
            item,
            style: TextStyle(fontSize: 20, color: Colors.lightGreenAccent),
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Text(
            distance,
            style: TextStyle(fontSize: 20, color: Colors.lightGreenAccent),
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Text(
            price,
            style: TextStyle(fontSize: 20, color: Colors.lightGreenAccent),
          ),
        ),
      ),
    ],
  );
}

class tableHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'ShopName',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreenAccent),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Distance',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreenAccent),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Price',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreenAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// scaffold for the whole app level column
class myScaffold extends StatelessWidget {
  int product_id;
  String Product_name;
  myScaffold(this.product_id,this.Product_name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Product Description',
          style:
              TextStyle(fontFamily: 'futura', color: Colors.lightGreenAccent),
        ),
      ),
      body: getListView(),
      backgroundColor: Colors.grey[900],
    );
  }
}
