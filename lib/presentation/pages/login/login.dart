import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vouchee/presentation/pages/homePage/home_page.dart';
import 'package:vouchee/presentation/pages/login/google_service.dart';
import 'package:vouchee/presentation/widgets/buttons/basic_button.dart';

import '../../../../core/configs/theme/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignInService _authService = GoogleSignInService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopAppBar(
      //   topTitle: SvgPicture.asset(AppVector.logo),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loginText(),
            const SizedBox(
              height: 40,
            ),
            _inputLogin(context),
            const SizedBox(
              height: 20,
            ),
            _inputPassword(context),
            const SizedBox(
              height: 30,
            ),
            BasicButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                },
                backgroundColor: AppColor.primary,
                textColor: AppColor.white,
                title: 'Đăng nhập'),
            const SizedBox(
              height: 20,
            ),
            _otherText(),
            const SizedBox(
              height: 20,
            ),
            _loginWithGoogle(),
          ],
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Text(
      'Đăng nhập',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
    );
  }

  Widget _inputLogin(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Số điện thoại / Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _inputPassword(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Nhập mật khẩu')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _otherText() {
    return const Text(
      'Hoặc',
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w300, color: AppColor.grey),
    );
  }

  Widget _loginWithGoogle() {
    final String googleAccessToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImU2YWMzNTcyNzY3ZGUyNjE0ZmM1MTA4NjMzMDg3YTQ5MjMzMDNkM2IiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiQWRtaW4gVm91Y2hlZSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NLODdtLTVZd0dJLTJjbVliNUNJLWtXLTlkT3Vkemg1ODRoNEVIaTJtT2I4Ri1rSnc9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vdm91Y2hlZS01MDRkYSIsImF1ZCI6InZvdWNoZWUtNTA0ZGEiLCJhdXRoX3RpbWUiOjE3MzA2NDkxNTAsInVzZXJfaWQiOiJWVUtGY1B5Z2VtTkE4Q29md3VLOEV1ZW9LMHkyIiwic3ViIjoiVlVLRmNQeWdlbU5BOENvZnd1SzhFdWVvSzB5MiIsImlhdCI6MTczMDY0OTE1MCwiZXhwIjoxNzMwNjUyNzUwLCJlbWFpbCI6ImFkdm91Y2hlZUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwODg2NTgzMDc1NzIxNjY5OTk1MCJdLCJlbWFpbCI6WyJhZHZvdWNoZWVAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.NjrWwEFJUXa5S3C8cvKZgy9P7liwJ0CFcEs6lmIimRB9n39iTpjPsbGyhgIh-lW-FkeqiLlijEg7NJtJ4L7Q9H0x6AklPfB_s-PYS_mm9ckrgg-IEulVWoq-T6Kq0zo4No_arb1N2aCAcLxis_X-1apEaRc4lakIog2gZgdFW0QU7bic79w6qKutOnAMawlyPpcCT9eg1t07PwMiGbs46ukTM11xRBLb0r2DDk2zetQYwTkJj-flpzB71ZpQPRk2gjPtdfgz1RqiNrix0S644Ah-3cHUEGijTAgWO_DeJGvLzNhaIUPQ73QAGsJ7gDf89wAzu-C0e6YTWa4uOWxf5w";
    return ElevatedButton(
      onPressed: () async {
        // if (await confirm(
        //   context,
        //   title: const Text('Confirm'),
        //   content: const Text('Would you like to remove?'),
        //   textOK: const Text('Yes'),
        //   textCancel: const Text('No'),
        // )) {
        //   return print('pressedOK');
        // }
        // return print('pressedCancel');
        // User? user = await _authService.signInWithGoogle(googleAccessToken);
        User? user = await _authService.signInWithGoogle(googleAccessToken);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(user: user),
              // builder: (context) => HomePageSearchBar(),
            ));
      },
      child: const Text(
        'Sign in with Google',
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
