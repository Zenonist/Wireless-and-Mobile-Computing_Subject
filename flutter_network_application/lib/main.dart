import 'package:flutter/material.dart'; 
import 'dart:async'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http; 
import 'Product.dart'; 


class quotation_data {
  int price;
  //set as 1 to avoid null
  var amountdata = [1,1,1,1,1,1,1,1,1,1];
  quotation_data(this.price);
}

void main() => runApp(MyApp(products: fetchProducts())); 

List<Product> parseProducts(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Product>((json) => Product.fromMap(json)).toList(); 
} 
Future<List<Product>> fetchProducts() async { 
   final response = await http.get('http://192.168.0.102:8000/products.json'); 
   if (response.statusCode == 200) { 
      return parseProducts(response.body); 
   } else { 
      throw Exception('Unable to fetch products from the REST API'); 
   } 
}
class MyApp extends StatelessWidget {
   final Future<List<Product>> products; 
   MyApp({Key key, this.products}) : super(key: key); 
   
   // This widget is the root of your application. 
   @override 
   Widget build(BuildContext context) {
      return MaterialApp(
         title: 'Flutter Demo', 
         theme: ThemeData( 
            primarySwatch: Colors.blue, 
         ), 
         home: MyHomePage(title: 'Earphone Lists', products: products), 
      ); 
   }
}
class MyHomePage extends StatelessWidget { 
   final String title; 
   final Future<List<Product>> products; 
   MyHomePage({Key key, this.title, this.products}) : super(key: key); 
   
   // final items = Product.getProducts();
   @override 
   Widget build(BuildContext context) { 
      return Scaffold(
         appBar: AppBar(title: Text(this.title)), 
         body: Center(
            child: FutureBuilder<List<Product>>(
               future: products, builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error); 
                  return snapshot.hasData ? ProductBoxList(items: snapshot.data) 
                  
                  // return the ListView widget : 
                  : Center(child: CircularProgressIndicator()); 
               },
            ),
         )
      );
   }
}
class ProductBoxList extends StatelessWidget {
   final List<Product> items; 
   quotation_data purchased_data = new quotation_data(0);
   
   int AccumulatedPrice = 0;
   ProductBoxList({Key key, this.items}); 
   
   @override 
   Widget build(BuildContext context) {
      return ListView.builder(
         itemCount: items.length + 1, 
         itemBuilder: (context, index) { 
        if (index >= 0 && index < items.length){
         return ListTile(
              title: Text(items[index].title),
              onTap: () {
                _navigateAndDisplaySelection(context, index);
              },
            );
         }else{
          return ListTile(
            title: Text('Quotation Screen'),
            onTap: () {
              _navigateAndDisplaySelection2(context);
            },
            );
          }
        },
      );
   }
   _navigateAndDisplaySelection(BuildContext context, index) async {

    purchased_data = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ProductPage(item: items[index], temp_purchased_data: purchased_data,index: index)),
    );
    if (purchased_data.price == null){
      purchased_data.price = 0;
    }
    int tempprice = purchased_data.price;
    Scaffold.of(context)
        .showSnackBar(new SnackBar(duration: new Duration(seconds: 1),content: new Text("Total Price:  $tempprice Baht")));

  }
    _navigateAndDisplaySelection2(BuildContext context) async {
    purchased_data = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              quotation_screen(Data: purchased_data,itemdata: items)),
    );
    if (purchased_data.price == null){
      purchased_data.price = 0;
    }
    Scaffold.of(context)
        .showSnackBar(new SnackBar(duration: new Duration(seconds: 1),content: new Text("Thank You for your purcahse")));

  }
  }
class ProductPage extends StatelessWidget { 
   ProductPage({Key key, @required this.item, this.temp_purchased_data, this.index}) : super(key: key); 
   final int index;
   final Product item;
   quotation_data temp_purchased_data;
   @override 
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text(this.item.title),), 
         body: Center( 
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: new Image.asset("assets/product_rest_app/" + item.image, height: 100, width: 100),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: Text(item.specification),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: Text("฿ " + item.price.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    child: Text("Buy " + item.title + "?"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      temp_purchased_data.price += item.price;
                      print(temp_purchased_data.price);
                        temp_purchased_data.amountdata[index] += 1;
                      Navigator.pop(context, temp_purchased_data);
                    },
                    child: Text('Yes'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, temp_purchased_data);
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
  quotation_data Data;
  List<Product> itemdata;
  quotation_screen({Key key, @required this.Data, this.itemdata}) : super(key: key);
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
                child: Text(itemdata[0].title + " " + (Data.amountdata[0]-1).toString() + " units\n" + 
                            itemdata[1].title + " " + (Data.amountdata[1]-1).toString() + " units\n" +
                            itemdata[2].title + " " + (Data.amountdata[2]-1).toString() + " units\n" +
                            itemdata[3].title + " " + (Data.amountdata[3]-1).toString() + " units\n" +
                            itemdata[4].title + " " + (Data.amountdata[4]-1).toString() + " units\n" +
                            itemdata[5].title + " " + (Data.amountdata[5]-1).toString() + " units\n" +
                            itemdata[6].title + " " + (Data.amountdata[6]-1).toString() + " units\n" +
                            itemdata[7].title + " " + (Data.amountdata[7]-1).toString() + " units\n" +
                            itemdata[8].title + " " + (Data.amountdata[8]-1).toString() + " units\n" +
                            itemdata[9].title + " " + (Data.amountdata[9]-1).toString() + " units\n"
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total Price:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('฿' + Data.price.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Data.price = 0;
                    Navigator.pop(context,Data);
                    print(Data.price);
                  },
                  child: Text('Pay for your earphones'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,Data.price);
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