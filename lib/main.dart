/**
 *
 * ----------------Module-7-Assignment----------------
 * ----------------Majedul Islam----------------------
 *
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});

   @override
  State<StatefulWidget> createState() {
    return HomePageView();
  }
}
class HomePageView extends State<HomePage>{
  var items=['\$10.00', '\$20.00','\$30.00','\$40.00',
    '\$50.00', '\$60.00','\$70.00','\$80.00',
    '\$90.00', '\$10.00','\$20.00','\$45.00',
  ];
   var count=[0,0,0,0,0,0,0,0,0,0,0,0];
   int product=0;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
             itemCount: items.length,
          itemBuilder: (context,index){
         return ListTile(
                    title: Text('Product ${index+1}'),
                    subtitle: Text('${items[index]}'),
                    trailing:Column(
                      children: [
                        Text('Count:${count[index]}'),
                        ElevatedButton(
                          child: Text('Buy Now'),
                          onPressed: (){
                              setState(() {
                                if(count[index]==0){
                                  product+=1;
                                }
                                count[index]+=1;
                              });
                              if(count[index]==5){
                                showDialog(context: context,
                                       builder: (context){
                                      return AlertDialog(
                                        title: Text('Congratulations!'),
                                        content: Text('You\'ve bought 5 Product ${index+1}!'),
                                        actions: [
                                          TextButton(onPressed: (){}, child: Text('OK')),
                                        ],
                                      );
                                    }
                                );
                              }
                          },
                        ),
                      ],
                    )
                );
          }
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(product: product),
            ),
          );
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }

}
class Cart extends StatelessWidget{
  int product;
   Cart({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Product Bought: $product'),
          ],
        ),
      ),
    );
  }
}