import 'package:flutter/material.dart';
import 'package:hotel_packaging/const/colors.dart';
import 'package:hotel_packaging/const/text_styles.dart';
import 'package:hotel_packaging/providers/auth_provider.dart';
import 'package:provider/provider.dart';



class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: appcolor,
      //   title: const Text("TOBY",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(

        children: [
          Container(
            color: appcolor,
            width: double.infinity,
            height: double.infinity,
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(size.width*.05, size.height*.2, size.width*.05, 0),
            child: Container(


              height:size.height*.65 ,
              width: size.width*.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(
                          'Login',
                          style: mainTitleTextStyle(size)
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:

                            const InputDecoration(
                              labelText: 'User Name',
                              prefixIcon: const Icon(
                                Icons.phone,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                          ),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                            color: appcolor,
                          ),
                          child: MaterialButton(
                            onPressed: () {


                              context.read<AuthProvider>().signIn(emailController.text, passwordController.text, context);

                            },
                            child: const Text(
                              'LOGIN',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      )
    );
  }
}
