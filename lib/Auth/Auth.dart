import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_basic/Screens/homescreen.dart';
import 'package:youtube_basic/index.dart';
import 'package:youtube_basic/services/auth_service.dart';

final supabase = Supabase.instance.client;

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  var login=true;
  String _errorMessage="";

  var isShowPassword = false;

  void signIn() async{

    if(_EmailController.text.isEmpty || _PasswordController.text.isEmpty){
      setState(() {
        _errorMessage="Fields cannot be empty";
      });
      return;
    }
    try{
      final response= await AuthService().signInWithEmail(_EmailController.text, _PasswordController.text);
      print(response);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const IndexPage()));
    }
    catch(e){
      _errorMessage=e.toString();
    }

  }

  void SignUp() async{
if(_EmailController.text.isEmpty || _PasswordController.text.isEmpty||_NameController.text.isEmpty||_phoneController.text.isEmpty){
  setState(() {
    _errorMessage="Fields cannot be empty";
  });
  return;
}
    try{
      print('Sign Up');
      final response= await AuthService().signUpWithEmail(_EmailController.text, _PasswordController.text,_NameController.text,_phoneController.text);
      print(response);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const IndexPage()));
    }
catch(e){
  setState(() {
    _errorMessage="Something Went Wrong!";
  });
}
  }
  @override
  Widget build(BuildContext context) {
    return login? Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _EmailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _PasswordController,
                  obscureText: isShowPassword?false:true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      suffixIcon: IconButton(onPressed: (){

                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      }, icon: const Icon(Icons.visibility),)
                  ),

                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  signIn();
                },
                child: const Text('Sign In'),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(
                      TextSpan(text: "Have not Account?"),
                  ),
                  TextButton(onPressed: (){
                    setState(() {
                      login=false;
                    });
                  }, child: const Text('Sign Up'))
                ],
              ),

              if(_errorMessage.isNotEmpty)...[
                Padding(padding: const EdgeInsets.all(8),
                    child:
                    Text(_errorMessage,style: const TextStyle(color: Colors.red),))
              ],
            ],
          ),
        ),
      )
      ,
    ):Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _EmailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _NameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _PasswordController,
                  obscureText: isShowPassword?false:true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      suffixIcon: IconButton(onPressed: (){

                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      }, icon: const Icon(Icons.visibility),)
                  ),

                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  SignUp();
                },
                child: const Text('Sign Up'),
              ),

            ],
          ),
        ),
      ),
    ) ;
  }
}

