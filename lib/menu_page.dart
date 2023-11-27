import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/profilepage.dart';
import 'button.dart';
import 'colors.dart';
import 'food.dart';
import 'food_details_page.dart';
import 'food_title.dart';

class MenuPage extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  MenuPage(this.username,this.email,this.password);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu =[
    Food(
      name:'pasta',
      price: 24.0,
      imagePath: "assets/sushi_images/spaghetti.png",
      rating: "4.5",
    ),
    Food(
      name:'spaghetti',
      price: 30.0,
      imagePath: "assets/sushi_images/icons8-spaghetti-64.png",
      rating: "4.5",
    ),
    Food(
      name:'spaghetti',
      price: 25.0,
      imagePath: "assets/sushi_images/icons8-spaghetti-48.png",
      rating: "4.5",
    ),
    Food(
      name:'Lasagna',
      price: 30.0,
      imagePath: "assets/sushi_images/icons8-lasagna-64.png",
      rating: "4.5",
    ),
  ];

  void navigateToFoodDetails(int index){
    Navigator.push(context, MaterialPageRoute(builder:(context) => FoodDetailsPage(
      food: foodMenu[index],
    ),
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
          Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
          title:
          Text('Italian Cuisine', style: TextStyle(color: Colors.grey[900]) ,),
            actions:[
        IconButton(
          onPressed:(){
            Navigator.push(
            context,MaterialPageRoute(
            builder: (context)=>ProfilePage(widget.username,widget.email,widget.password),
            ),
            );
    },
          icon:Icon(Icons.verified_user,color: Colors.grey[900]),
        ),
      ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20) ),
              margin: const EdgeInsets.symmetric(horizontal: 15 ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Text('Get 30% Promo ',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize:20,
                          color: Colors.white,
                        ),),
                      const SizedBox(height: 20,),
                      MyButton(text: 'Redeem', onTap: (){},)
                    ],
                  ),
                  Image.asset('assets/sushi_images/icons8-macaroni-78.png')

                ],
              )
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0 ),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here",
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0 ),
            child: Text('Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder:(context,index)=> FoodTitle(
                  food: foodMenu[index],
                  onTap: ()=> navigateToFoodDetails(index),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            decoration:  BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 15, right: 15,),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/sushi_images/icons8-lasagna-64.png',
                      height: 60,
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Text("Lasagna",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          '\$21.00',
                          style: TextStyle(
                            color:  Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
