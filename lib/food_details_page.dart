import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button.dart';
import 'cartpage.dart';
import 'food.dart';
import 'colors.dart';


class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({Key?key, required this.food}):super(key:key);

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  List<Map<String, dynamic>> cartItems = [];
  //quantity
  int quantityCount=1;


  //decrement quantity
  void decrementQuantity(){
    setState(() {
      if( quantityCount>0)
      quantityCount--;
    });
  }
  //increment quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }
  void _addToCart() {
    setState(() {
      cartItems.add({
        'name': widget.food.name,
        'price': widget.food.price * quantityCount,
        'quantity': quantityCount, // Storing the name of the food item in the cart
      });
    });
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        actions:[
          IconButton(
            onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context)=>CartPage(cartItems:cartItems),
                ),
              );
            },
            icon:Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      //star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 10),
                      //rating nb
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Indulge in the irresistible allure of perfectly cooked pasta, a culinary delight that captivates with its versatility and comforting flavors, sure to satisfy any craving. Elevate your dining experience with the exquisite taste and endless possibilities of pasta, a timeless favorite that brings joy to every plate.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    //price
                    Text(
                      "\$ ${(widget.food.price * quantityCount).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:18,
                      ),
                    ),
                    //quantity
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: secondaryColor,
                          shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style:const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: secondaryColor,
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )

                  ],),
                  //add to cart
                  const SizedBox(height: 20),
                  MyButton(
                    text: "Add To Cart", onTap: () { _addToCart(); },
                  ),
                ],
              ),

          )
        ],
      ),
    );
  }
}
