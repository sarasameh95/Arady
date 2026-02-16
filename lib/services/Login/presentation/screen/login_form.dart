import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/Login/cubit/user_cubit.dart';
import 'package:ashghal/services/Login/cubit/user_cubit_state.dart';
import 'package:ashghal/services/Login/cubit/user_register_cubit.dart';
import 'package:ashghal/services/Login/presentation/screen/sign_up_form.dart';
import 'package:ashghal/services/home/presentation/homePage.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/utils/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashghal/core/widgets/textfield_inhanced.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginForm extends StatefulWidget {
  const LoginForm({super.key,});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return
      BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          print('TOKEN: ${state.token}');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  MyHomePage(userName: userNameController.text, )),
          );
          // save token & navigate
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child:
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          title: Text(AppStrings.login),
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/login.svg',height: 200,),
                                    const SizedBox(height: 25),
                                    // User ID Field
                                    LogTextField(controller:userNameController ,label: 'اسم المستخدم',
                                      icon: Icons.person,obscureText: false,obsecureChar: ' ',),

                                    const SizedBox(height: 15),

                                  // Password Field
                                        LogTextField(controller:passwordController ,label: 'الرقم السرى',
                                          icon: Icons.key,obscureText: true,obsecureChar: '*',),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton(child: Text('نسيت كلمة المرور ؟'),onPressed: (){},),
                                          ],
                                        ),



                                    const SizedBox(height: 10),

                                  // Login Button
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      BlocBuilder<LoginCubit, LoginState>(
                                  builder: (context, state) {
                                    if (state is LoginLoading) {
                                      return const CircularProgressIndicator();
                                    }
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:AppColors.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                         // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                        ),
                                        onPressed: () {
                                          // Handle Login Logic
                                          if (_formKey.currentState!.validate()) {
                                            print("Logging in...");
                                          context.read<LoginCubit>().login(
                                            username: userNameController.text,
                                            password: passwordController.text,
                                          );}
                                          else{
                                            print(_formKey);
                                          }
                                        },
                                        child: Text(
                                            AppStrings.login,
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                      );})
                                    ,
                                      OutlinedButton(onPressed: (){
                                        Navigator.of(context).pushReplacement(
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(milliseconds: 500),
                                            pageBuilder: (_, __, ___) =>
                                                BlocProvider(
                                                  create: (_) => RegisterCubit(AuthService()),
                                                  child: SignUpForm(),
                                                ),
                                            transitionsBuilder: (_, anim, __, child) =>
                                                FadeTransition(opacity: anim, child: child),
                                          ),
                                        );
                                      },
                                       // style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                                       // ),
                                        child: Text(AppWords.createAccount))
                                    ],
                                  ),

                                 ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              'تم التطوير بواسطة قسم البرمجيات-إدارة الاتصالات',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    ),
          ),
        ),
      );}
    )
            )
            );
  }
}
