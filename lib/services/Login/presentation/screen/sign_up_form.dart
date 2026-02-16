import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/core/token_storage.dart';
import 'package:ashghal/services/Login/cubit/user_cubit.dart';
import 'package:ashghal/services/Login/cubit/user_register_cubit.dart';
import 'package:ashghal/services/Login/cubit/user_register_cubit_state.dart';
import 'package:ashghal/services/Login/presentation/screen/login_form.dart';
import 'package:ashghal/services/home/presentation/homePage.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/utils/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashghal/core/widgets/textfield_inhanced.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});


  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController natIdController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('تم إنشاء المستخدم \n برجاء تسجيل الدخول باستخدام اسم المستخدم الجديد والرقم السرى ')));
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) =>
                  BlocProvider(
                    create: (_) => LoginCubit(AuthService(), TokenStorage()),
                    child: LoginForm(),
                  ),
              transitionsBuilder: (_, anim, __, child) =>
                  FadeTransition(opacity: anim, child: child),
            ),
          );
          // save token & navigate
        }

        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          title: Text(AppStrings.signup),
        ),
        body: LayoutBuilder(
            builder: (context, constraints) {
            return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Form(
                      key: _formKey,
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
                            // const SizedBox(height: 10),
                            // LogTextField(controller:passwordConfirmController ,label: 'تأكيد الرقم السرى ',
                            //   icon: Icons.key,obscureText: true,obsecureChar: '*',),
                             const SizedBox(height: 10),
                            LogTextField(controller:natIdController ,label: 'الرقم القومى',
                              icon: Icons.numbers,obscureText: false,obsecureChar: ' ',),
                            const SizedBox(height: 10),
                            LogTextField(controller:phoneNoController ,label: 'رقم الهاتف',
                              icon: Icons.phone,obscureText: false,obsecureChar: ' ',),
                            const SizedBox(height: 10),
                            LogTextField(controller:whatsAppController ,label: 'رقم الwhatsapp',
                              icon: Icons.phone_android,obscureText: false,obsecureChar: ' ',),
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
                                // Handle Login Logic
                                if (_formKey.currentState!.validate()) {
                                  print("signing up");
                                  context.read<RegisterCubit>().register(
                                    username: userNameController.text,
                                    password: passwordController.text,
                                    fullName: userIdController.text,
                                    natId: int.parse(natIdController.text),
                                    mobileNo: phoneNoController.text,
                                    whatsNo: whatsAppController.text,
                                    email: emailController.text,

                                  );
                                }
                                else{
                                  print(_formKey);
                                }
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
                    ),
                  )
                ),
              ),
            ),
          );}
        ),
      ),
    );
  }
}
