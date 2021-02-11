//Phonarnun Tatiyamaneekul 6188062 Section 2
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ListViews',
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text('Earphone Store [Munkong Gadget]')),
      body: BodyLayout(),
    ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  int AccumulatedPrice = 0;
  Widget build(BuildContext context) {
    return _myListView(context,AccumulatedPrice);
  }
}

Widget _myListView(BuildContext context,int accumulated_price) {
  
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Andromeda.jpg'),
        ),
        title: Text('Campfire Audio Andromeda 2020'),
        subtitle: Text('Price: \฿4390'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 4390;
          print('Campfire Audio Andromeda 2020 | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Lola.jpg'),
        ),
        title: Text('JH Audio Lola'),
        subtitle: Text('Price: \฿6490'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 6490;
          print('JH Audio Lola | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Orion.jpg'),
        ),
        title: Text('Campfire Audio Orion'),
        subtitle: Text('Price: \฿1112'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 1112;
          print('Campfire Audio Orion | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/oriveti.jpg'),
        ),
        title: Text('Oriveti New Primacy'),
        subtitle: Text('Price: \฿1011'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 1011;
          print('Oriveti New Primacy | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Shure_Aonic.jpg'),
        ),
        title: Text('Shure AONIC 3'),
        subtitle: Text('Price: \฿799'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 799;
          print('Shure AONIC 3 | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Solaris.jpg'),
        ),
        title: Text('Campfire Audio Solaris 2020'),
        subtitle: Text('Price: \฿5090'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 5090;
          print('Campfire Audio Solaris 2020 | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Star.jpg'),
        ),
        title: Text('Aroma Audio Star'),
        subtitle: Text('Price: \฿841'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 841;
          print('Aroma Audio Star | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/W50.jpg'),
        ),
        title: Text('Westone W50'),
        subtitle: Text('Price: \฿2000'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 2000;
          print('Westone W50 | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/WGpro.jpg'),
        ),
        title: Text('Aroma Witch Girl Pro'),
        subtitle: Text('Price: \฿3490'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 3490;
          print('Aroma Witch Girl Pro | accumulated price: $accumulated_price Baht');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/WGs.jpg'),
        ),
        title: Text('Aroma Witch Girl S'),
        subtitle: Text('Price: \฿2990'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          accumulated_price += 2990;
          print('Aroma Witch Girl S | accumulated price: $accumulated_price Baht');
        },
      ),
    ],
  );
}
