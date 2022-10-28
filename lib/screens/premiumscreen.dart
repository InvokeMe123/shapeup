import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:shapeup/models/diet_model.dart';
import 'package:shapeup/screens/diet_card.dart';
//import 'package:shapeup/screens/diet_detail_page.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  final colorizeColors = [
    Colors.teal,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.purple,
  ];
  final colorizeTextStyle = const TextStyle(
    fontSize: 35.0,
    fontFamily: 'Horizon',
  );

  final premiumDietList = [
    'Low Carb',
    'High Protein',
  ];

  List<String> imagePathList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText('Premium',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
                speed: const Duration(milliseconds: 300)),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          pause: const Duration(milliseconds: 1),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ImageSlideshow(
                      width: double.infinity,
                      initialPage: 0,
                      indicatorColor: Colors.white,
                      indicatorBackgroundColor: Colors.black,
                      autoPlayInterval: 3000,
                      children: [
                        Image.asset(
                          "assets/slider1.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          "assets/slider2.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                        // Image.asset(
                        //   "assets/app_image/slider3.jpg",
                        //   fit: BoxFit.fitHeight,
                        // ),
                        // Image.asset(
                        //   "assets/app_image/slider.png",
                        //   fit: BoxFit.fitWidth,
                        // ),
                        // Image.asset(
                        //   "assets/app_image/slider6.png",
                        //   fit: BoxFit.cover,
                        // ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: const Offset(0, 20),
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            fillColor: Colors.black38,
                            hintStyle: const TextStyle(color: Colors.white),
                            filled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 10, top: 5, right: 5, bottom: 0),
                            hintText: "Search",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Container(
            //     height: 130,
            //     child: ListView(scrollDirection: Axis.horizontal, children: [
            //       categories(image: 'assets/11M.png', title: '500/month'),
            //       categories(image: 'assets/6M.png', title: '300/month'),
            //       categories(image: 'assets/12.png', title: '150/month'),
            //     ])),
            // const SizedBox(
            //   height: 20,
            // ),
            DietCard(
              dietModel: DietModel(
                  title: 'Low Carb',
                  imagePath: 'assets/diet.jpg',
                  description:
                      'Ease into low-carb eating in just 4 weeks. This Plan uses our brand new Meal Planner tool to slowly scale back on carbs in a healthy and sustainable way. Build new habits one day at a time while following a meal plan customized for your calorie needs. By Day 28, you\'ll be able to confidently plan and cook low-carb meals and choose foods that fuel your body best.',
                  caution:
                      'Consult your physician before starting any plan. Neither Shape Up nor its affiliates will be liable for any injury sustained as a result of your participation.',
                  duration: '28 days',
                  difficulty: 'Beginner',
                  commitment: 'Daily',
                  planCondition: [
                    ' Your calorie goal is between 1200 and 2200 calories.',
                    'Your goal is weight loss or weight maintenance.',
                    'You\'re new to a low-carb eating pattern.',
                    'You\'ve tried low carb before and had trouble feeling full or getting enough fiber.',
                    'You are not a vegetarian (recipes in this Plan include meat and dairy)',
                  ]),
            ),
            DietCard(
              dietModel: DietModel(
                  title: 'High Protein',
                  imagePath: 'assets/slider2.jpg',
                  description: '',
                  caution:
                      'Consult your physician before starting any plan. Neither Shape Up nor its affiliates will be liable for any injury sustained as a result of your participation.',
                  duration: '',
                  difficulty: 'Beginner',
                  commitment: 'Daily',
                  planCondition: [
                    ' Your calorie goal is between 1200 and 2200 calories.',
                    'Your goal is weight loss or weight maintenance.',
                  ]),
            )
          ],
        ),
      ),
    );
  }

  getCardView(value) {
    return Card(
        child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Image.asset(
                  'assets/app_image/ui_bg.png',
                  height: 20,
                ),
              ],
            )));
  }

  Widget categories({image, title}) {
    return AspectRatio(
      aspectRatio: 4 / 4,
      child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.1),
              ]),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
            ),
          )),
    );
  }
}
