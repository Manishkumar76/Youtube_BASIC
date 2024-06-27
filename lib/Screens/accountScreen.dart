import 'package:flutter/material.dart';
import 'package:youtube_basic/services/auth_service.dart';

class AccountScreen extends StatefulWidget {
  const  AccountScreen({super.key});

  @override
  State< AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State< AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is Account screen"),
            ElevatedButton(onPressed: (){
              AuthService().signOut();
            }, child: const Text("Logout"))
          ],
        ),
      )
    );
  }
}
