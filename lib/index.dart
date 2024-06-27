import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_basic/Screens/homescreen.dart';
import 'package:youtube_basic/Screens/add_video_screen.dart';
import 'package:youtube_basic/Screens/shortsScreen.dart';
import 'package:youtube_basic/Screens/subscriptionsScreen.dart';
import 'package:youtube_basic/Screens/accountScreen.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final Bucket = PageStorageBucket();
  Widget currentPage= HomeScreen();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:PageStorage(bucket: PageStorageBucket(),
          child: currentPage),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    currentPage=const HomeScreen();
                  });
                }, icon: const Icon(Icons.home_outlined),isSelected: true,),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    currentPage= const ShortScreen();
                  });
                }, icon: const Icon(Icons.home_outlined)),
                // const Text('Shorts',style: TextStyle(fontSize: 10))
              ],
            ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddVideoScreen()));
            }, icon: const Icon(Icons.add_circle_outline_sharp),iconSize: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    currentPage=const SubscriptionScreen();
                  });
                }, icon: const Icon(Icons.subscriptions_outlined)),
                // const Text('Subscription',style: TextStyle(fontSize: 10))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap:(){
                    setState(() {
                      currentPage= AccountScreen();
                    });
                  },
                  hoverColor: Colors.grey.shade200,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/youtube_button.png'),
                  ),
                ),
                // const Text('You',style: TextStyle(fontSize: 10))
              ],
            ),


          ],
        ),
      ),
    );
  }
}
