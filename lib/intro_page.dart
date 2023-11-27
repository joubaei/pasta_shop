import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/colors.dart';
import 'button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 10,),
          // shop name
          Text("Italian Cuisine",
          style: GoogleFonts.dmSerifDisplay(
            fontSize:28,
            color: Colors.white,
          ),
          ),
          const SizedBox(height: 10),
          //image
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Image.asset('assets/sushi_images/icons8-spaghetti-96.png'),
          ),
          const SizedBox(height: 5),
          //title
          Text(
            "THE TASTE OF ITALIAN FOOD",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 44,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          //subtitle
          Text(
            "Get the taste of true italian meals",
            style: TextStyle(
              fontSize:20,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 15),
          //button
          MyButton(text: "Log In",
            onTap: (){
              Navigator.pushNamed(context, '/login');
            },),
        ],
      ),
    ),
    );
  }
}
