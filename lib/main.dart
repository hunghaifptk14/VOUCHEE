import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vouchee/core/configs/theme/app_theme.dart';
import 'package:vouchee/presentation/pages/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseAuth.instance.setLanguageCode('en');
  runApp(
      //   MultiProvider(
      //   providers: [
      //     // ChangeNotifierProvider(create: (_) => VoucherProvider()),
      //     ChangeNotifierProvider(create: (_) => CartProvider()),
      //   ],
      //   child: const Vouchee(),
      // ));
      Vouchee());
}

class Vouchee extends StatelessWidget {
  const Vouchee({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginPage());
  }
}
