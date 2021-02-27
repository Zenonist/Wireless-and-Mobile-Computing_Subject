/*Phonarnun Tatiyamaneekul 6188062 Section: 2 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Earphonedata {
  final String image_location;
  final String title;
  final String specification;
  final int price;
  Earphonedata(this.image_location, this.title, this.specification, this.price);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: earphoneScreen(
        earphones: [
          Earphonedata(
            'assets/images/Andromeda.jpg',
            'Campfire Audio Andromeda 2020',
            '5 balanced armature driver',
            4390),
          Earphonedata(
            'assets/images/Lola.jpg',
            'JH Audio Lola',
            'the Lola features dual low balanced armature drivers, dual opposed 4.9mm dynamic mid drivers and quad balanced armature highs',
            6490),
          Earphonedata(
            'assets/images/Orion.jpg',
            'Campfire Audio Orion',
            'Single Full Range Balanced Armature Driver.',
            1112),
          Earphonedata(
            'assets/images/oriveti.jpg',
            'Oriveti New Primacy',
            'Knowles Dual Armature Driver & 8mm Dynamic Driver.',
            1011),
          Earphonedata(
            'assets/images/Shure_Aonic.jpg',
            'Shure AONIC 3',
            'Single Balanced Armature.',
            799),
          Earphonedata(
            'assets/images/Solaris.jpg',
            'Campfire Audio Solaris 2020',
            'Dual Custom Balanced Armature Drivers + T.A.E.C. (High),Single Updated Custom Balanced Armature Driver (Mid),Specially Tuned 10mm Dynamic Driver (Mid + Low)',
            5090),
          Earphonedata(
            'assets/images/Star.jpg',
            'Aroma Audio Star',
            'Single Full Range Balanced Armature Driver.',
            841),
          Earphonedata(
            'assets/images/W50.jpg',
            'Westone W50',
            '5 Balanced Armature drivers.',
            2000),
          Earphonedata(
            'assets/images/WGpro.jpg',
            'Aroma Witch Girl Pro',
            '4 Balanced Armature drivers + 2 Dynamic drivers.',
            3490),
          Earphonedata(
            'assets/images/WGs.jpg',
            'Aroma Witch Girl S',
            '5 Balanced Armature drivers.',
            2990)
        ],
      ),
    ),
  );
}

class earphoneScreen extends StatelessWidget {
  final List<Earphonedata> earphones;
  int AccumulatedPrice = 0;
  earphoneScreen({Key key, @required this.earphones}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earphone Lists'),
      ),
      body: ListView.builder(
        itemCount: earphones.length + 1,
        itemBuilder: (context, index) {
          if (index >= 0 && index < earphones.length){
            return ListTile(
              title: Text(earphones[index].title),
              onTap: () {
                _navigateAndDisplaySelection(context, index);
              },
            );
          }
          else{
            return ListTile(
              title: Text('Quotation Screen'),
              onTap: () {
                _navigateAndDisplaySelection2(context);
              },
            );
          }
        },
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context, index) async {

    AccumulatedPrice = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailScreen(earphone: earphones[index], totalprice: AccumulatedPrice)),
    );
    if (AccumulatedPrice == null){
      AccumulatedPrice = 0;
    }
    Scaffold.of(context)
        .showSnackBar(new SnackBar(duration: new Duration(seconds: 1),content: new Text("Total Price:  $AccumulatedPrice Baht")));

  }
    _navigateAndDisplaySelection2(BuildContext context) async {
    AccumulatedPrice = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              quotation_screen(totalprice: AccumulatedPrice)),
    );
    if (AccumulatedPrice == null){
      AccumulatedPrice = 0;
    }
    Scaffold.of(context)
        .showSnackBar(new SnackBar(duration: new Duration(seconds: 1),content: new Text("Thank You for your purcahse")));

  }
}

class DetailScreen extends StatelessWidget {
  final Earphonedata earphone;
  int totalprice;
  DetailScreen({Key key, @required this.earphone, this.totalprice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(earphone.title),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: new Image.asset(earphone.image_location, height: 100, width: 100),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: Text(earphone.specification),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: Text("฿ " + earphone.price.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: Text("Buy " + earphone.title + "?"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      totalprice += earphone.price;
                      Navigator.pop(context, totalprice);
                      print(totalprice);
                    },
                    child: Text('Yes'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context,totalprice);
                    },
                    child: Text('No'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class quotation_screen extends StatelessWidget {
  int totalprice = 0;
  quotation_screen({Key key, @required this.totalprice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotation Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total Price:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('฿' + totalprice.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    totalprice = 0;
                    Navigator.pop(context,totalprice);
                    print(totalprice);
                  },
                  child: Text('Pay for your earphones'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,totalprice);
                  },
                  child: Text('Not Yet, I need to buy more'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
