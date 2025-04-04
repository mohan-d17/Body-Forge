import 'package:bodyforge/core/const/color_constants.dart';
import 'package:bodyforge/screens/onboarding/page/onboarding_page.dart';
import 'package:bodyforge/screens/tab_bar/page/tab_bar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown,
 ]);
 await Firebase.initializeApp();
 runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
   final isLoggedIn = FirebaseAuth.instance.currentUser != null;
 
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Fitness',
     theme: ThemeData(
       textTheme:
           TextTheme(bodyLarge: TextStyle(color: ColorConstants.textColor)),
       fontFamily: 'NotoSansKR',
       scaffoldBackgroundColor: Colors.white,
       visualDensity: VisualDensity.adaptivePlatformDensity,
     ),
     home: isLoggedIn ? TabBarPage() : OnboardingPage(),
   );
 }
}