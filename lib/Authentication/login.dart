// //import 'dart:html';

// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:green2/Initial/HasUser.dart';
// import 'package:green2/animation/FadeAnimation.dart';
// import 'package:green2/Authentication/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// //import 'dart:developer' as devLog;

// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailContoller = TextEditingController();

//   final passwordContoller = TextEditingController();

//   void signUserin() async {
//     // stdout.writeln(emailContoller.text); // not working... donno why?
//     //devLog.log(emailContoller.text.toString(), name: "Auth_logs1");

//     showDialog(
//         context: context,
//         builder: (context) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         });
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailContoller.text, password: passwordContoller.text);
//       // Navigator.pop(context);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) {
//           return HasUserHome();
//         }),
//       );
//     } on FirebaseAuthException catch (e) {
//       bool loginSuccessful = true;
//       Navigator.pop(context, loginSuccessful);
//       showErrorMessage(e.code);
//     }
//   }

//   void showErrorMessage(String message) {
//     if (message.isEmpty) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const AlertDialog(
//               title: Center(
//                   child: Text(
//                 "Invalid Credentials!",
//                 style: TextStyle(color: Colors.black),
//               )),
//             );
//           });
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Center(
//                   child: Text(
//                 message,
//                 style: const TextStyle(color: Colors.black),
//               )),
//             );
//           });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         // leading: IconButton(
//         //   onPressed: () {
//         //     // Navigator.pop(context);
//         //   },
//         //   icon: const Icon(
//         //     Icons.arrow_back_ios,
//         //     size: 20,
//         //     color: Colors.black,
//         //   ),
//         // ),
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       const FadeAnimation(
//                           1,
//                           Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 30, fontWeight: FontWeight.bold),
//                           )),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       FadeAnimation(
//                           1.2,
//                           Text(
//                             "Login to your account",
//                             style: TextStyle(
//                                 fontSize: 15, color: Colors.grey[700]),
//                           )),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: <Widget>[
//                         FadeAnimation(
//                             1.2,
//                             makeInput(
//                                 controller: emailContoller, label: "Email")),
//                         FadeAnimation(
//                             1.3,
//                             makeInput1(
//                                 controller: passwordContoller,
//                                 label: "Password",
//                                 obscureText: true)),
//                       ],
//                     ),
//                   ),
//                   FadeAnimation(
//                       1.4,
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 40),
//                         child: Container(
//                           padding: const EdgeInsets.only(top: 3, left: 3),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50),
//                               border: const Border(
//                                 bottom: BorderSide(color: Colors.black),
//                                 top: BorderSide(color: Colors.black),
//                                 left: BorderSide(color: Colors.black),
//                                 right: BorderSide(color: Colors.black),
//                               )),
//                           child: MaterialButton(
//                             minWidth: double.infinity,
//                             height: 60,
//                             onPressed: () {
//                               signUserin();
//                             },
//                             color: Colors.greenAccent,
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: const Text(
//                               "Login",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600, fontSize: 18),
//                             ),
//                           ),
//                         ),
//                       )),
//                   FadeAnimation(
//                       1.5,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           const Text("Don't have an account?"),
//                           InkWell(
//                             onTap: () {
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => SignupPage()));
//                             },
//                             child: const Text(
//                               "Sign up",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600, fontSize: 18),
//                             ),
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//             FadeAnimation(
//                 1.2,
//                 Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/background.png'),
//                           fit: BoxFit.cover)),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget makeInput1(
//       {label, obscureText = false, required TextEditingController controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: const TextStyle(
//               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         TextField(
//           controller: passwordContoller,
//           obscureText: obscureText,
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//             border:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//           ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }

//   Widget makeInput(
//       {label, obscureText = false, required TextEditingController controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: const TextStyle(
//               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         TextField(
//           controller: emailContoller,
//           obscureText: obscureText,
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//             border:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//           ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }
// }

// //..................................................
// // Scaffold(
// //       resizeToAvoidBottomInset: true,
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: const Icon(
// //             Icons.arrow_back_ios,
// //             size: 20,
// //             color: Colors.black,
// //           ),
// //         ),
// //         systemOverlayStyle: SystemUiOverlayStyle.dark,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.only(bottom: 15.0),
// //         child: SizedBox(
// //             height: MediaQuery.of(context).size.height,
// //             width: double.infinity,
// //             child: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 40),
// //               child: Center(
// //                 child: SingleChildScrollView(
// //                     child: Column(
// //                   children: <Widget>[
// //                     const FadeAnimation(
// //                       1,
// //                       Text("Login",
// //                           style: TextStyle(
// //                             color: Colors.lightGreen,
// //                             fontSize: 30,
// //                             fontWeight: FontWeight.bold,
// //                           )),
// //                     ),
// //                     const SizedBox(
// //                       height: 60,
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 30),
// //                       child: Column(
// //                         children: <Widget>[
// //                           FadeAnimation(
// //                               1.2,
// //                               makeInput(
// //                                   controller: emailController, label: "Email")),
// //                           FadeAnimation(
// //                               1.3,
// //                               makeInput1(
// //                                   controller: PasswordController,
// //                                   label: "Password",
// //                                   obscureText: true)),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     FadeAnimation(
// //                       1.5,
// //                       Container(
// //                         padding:
// //                             const EdgeInsets.only(top: 3, left: 90, right: 90),
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(50),
// //                           // border: const Border(
// //                           //   bottom: BorderSide(color: Colors.black),
// //                           //   top: BorderSide(color: Colors.black),
// //                           //   left: BorderSide(color: Colors.black),
// //                           //   right: BorderSide(color: Colors.black),
// //                           // ),
// //                         ),
// //                         child: GradientBackgroundButton(
// //                           materialStatePropertyShape:
// //                               MaterialStateProperty.all(RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(18.0),
// //                           )),
// //                           icon: const Icon(Icons.login_rounded,
// //                               color: Colors.white, size: 20),
// //                           leftIcon: 20,
// //                           child: Text('Sign up',
// //                               style:
// //                                   TextStyle(fontSize: 18, color: Colors.white)),
// //                           gradient: const LinearGradient(
// //                             colors: <Color>[
// //                               Color(0xff004d7a),
// //                               Color(0xff008793),
// //                               Color(0xff00bf72),
// //                               Color(0xffa8eb12)
// //                             ],
// //                           ),
// //                           onPressed: () {
// //                             checkvalues();
// //                             // Navigator.push(
// //                             //   context,
// //                             //   MaterialPageRoute(builder: (context) {
// //                             //     return CompleteProfile(signupModel: ,);
// //                             //   }),
// //                             // );
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                     // FadeAnimation(
// //                     //     1.5,
// //                     //     CupertinoButton(
// //                     //         child: Text("Log in"),
// //                     //         color: Theme.of(context).colorScheme.secondary,
// //                     //         onPressed: () {
// //                     //           checkvalues();
// //                     //         })),
// //                   ],
// //                 )),
// //               ),
// //             )),
// //       ),
// //       bottomNavigationBar: FadeAnimation(
// //           1.4,
// //           Container(
// //             child: Padding(
// //               padding: const EdgeInsets.only(bottom: 25.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Text(
// //                     "Don't have a account?",
// //                     style: TextStyle(fontSize: 16),
// //                   ),
// //                   CupertinoButton(
// //                     child: const Text(
// //                       "Sign Up",
// //                       style: TextStyle(fontSize: 16),
// //                     ),
// //                     onPressed: () {
// //                       Navigator.push(context,
// //                           MaterialPageRoute(builder: (context) {
// //                         return SignUpPage();
// //                       }));
// //                     },
// //                   )
// //                 ],
// //               ),
// //             ),
// //           )),
// //     );