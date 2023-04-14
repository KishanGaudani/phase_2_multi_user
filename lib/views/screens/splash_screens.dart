import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class splash_screens extends StatefulWidget {
  const splash_screens({Key? key}) : super(key: key);

  @override
  State<splash_screens> createState() => _splash_screensState();
}

class _splash_screensState extends State<splash_screens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Image.asset(
              "assets/images/wp5580037.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w800),),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("to Book Store",style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w800),),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Read a Special Book for Bhagavad Gita",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(30),
                child: InkWell(
                  onTap: (){
                    setState((){
                      Navigator.of(context).pushNamed('Homepage');
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Text("Continue",style: TextStyle(color: Color(0XFF0793B6),fontSize: 25,fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
            ],
          )
        ],

      ),
      backgroundColor: const Color(0XFF0793B6),
    );
  }
}
