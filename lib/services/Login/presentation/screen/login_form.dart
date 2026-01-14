import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/Login/presentation/screen/sign_up_form.dart';
import 'package:ashghal/services/home/presentation/homePage.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/utils/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashghal/core/widgets/textfield_inhanced.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.title});
  final String title;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        title: Text(AppStrings.login),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            /*  const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/green.jpg')
              ),
              const SizedBox(height: 20),
            */
                SvgPicture.asset('assets/login.svg',height: 200,),
                const SizedBox(height: 25),
                // User ID Field
                LogTextField(controller:userNameController ,label: 'اسم المستخدم',
                  icon: Icons.person,obscureText: false,obsecureChar: ' ',),

                const SizedBox(height: 15),

              // Password Field
                Column(
                  children: [
                    LogTextField(controller:passwordController ,label: 'الرقم السرى',
                      icon: Icons.key,obscureText: true,obsecureChar: '*',),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(child: Text('نسيت كلمة المرور ؟'),onPressed: (){},),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

              // Login Button
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                     // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    onPressed: () {
                      // Handle Login Logic
                      print("Logging in...");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  MyHomePage(userName: userNameController.text)),
                      );
                    },
                    child: Text(
                        AppStrings.login,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  OutlinedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpForm()),
                    );
                  },
                   // style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                   // ),
                    child: Text(AppWords.createAccount))
                ],
              ),

             ]
          ),
        )

      ),
    );
  }
}
