import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/home/presentation/homePage.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/utils/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashghal/core/widgets/textfield_inhanced.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});


  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final TextEditingController natIdController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        title: Text(AppStrings.signup),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/sign-up.svg',height: 200,),
                const SizedBox(height: 25),
                // User ID Field
                LogTextField(controller:userIdController ,label: 'الاسم رباعى',
                  icon: Icons.perm_identity,obscureText: false,obsecureChar: ' ',),

                const SizedBox(height: 10),
                LogTextField(controller:userNameController ,label: 'اسم المستخدم',
                  icon: Icons.person,obscureText: false,obsecureChar: ' ',),

                const SizedBox(height: 10),
                // Password Fields
                LogTextField(controller:passwordController ,label: 'الرقم السرى',
                  icon: Icons.password,obscureText: true,obsecureChar: '*',),
                const SizedBox(height: 10),
                LogTextField(controller:passwordConfirmController ,label: 'تأكيد الرقم السرى ',
                  icon: Icons.key,obscureText: true,obsecureChar: '*',),
                const SizedBox(height: 10),
                LogTextField(controller:natIdController ,label: 'الرقم القومى',
                  icon: Icons.numbers,obscureText: false,obsecureChar: ' ',),
                const SizedBox(height: 10),
                LogTextField(controller:phoneNoController ,label: 'رقم الهاتف',
                  icon: Icons.phone,obscureText: false,obsecureChar: ' ',),
                const SizedBox(height: 10),
                LogTextField(controller:emailController,label: 'بريد إلكترونى',
                  icon: Icons.email,obscureText: false,obsecureChar: ' ',),
                const SizedBox(height: 10),

              // Login Button
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyHomePage(userName: userNameController.text)),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),),
                    child: Text(AppWords.saveBtn,
                      style: TextStyle(color: Colors.white, fontSize: 18),)
                  )
                ],
              ),

             ]
          ),
        )

      ),
    );
  }
}
