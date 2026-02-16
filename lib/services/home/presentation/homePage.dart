import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/Login/presentation/widgets/appBar_title.dart';
import 'package:ashghal/services/operations/cubit/demands_cubit.dart';
import 'package:ashghal/services/operations/presentation/Demands_screen.dart';
import 'package:ashghal/services/Login/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashghal/core/utils/app_strings.dart';
 import 'widgets/buildCardWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,required this.userName});
  final String userName ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late final List<Widget> _screens;
  void changeTab(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });

  }
  @override
  void initState() {
    super.initState();


    _screens = [
      HomeBody(
        username: widget.userName,
        onGoToTalabat: () => changeTab(1),
      ),
      BlocProvider(
        create: (_) => DemandsCubit()..getDemandsFromApi(),
        child:  DemandsScreen(),
      ),
      const ProfileScreen(),
    ];
  }

@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: AppbarTitle(),
        actions: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: SvgPicture.asset('assets/cabin.svg'),
                  //child: Icon(Icons.person_outline_outlined)
              ),
              Text('${widget.userName} ' )
            ],
          ),
        ],
      ),
      body:  IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary,
        backgroundColor: AppColors.primaryBackground,
        unselectedIconTheme: IconThemeData(color: AppColors.grey,),
        selectedIconTheme: IconThemeData(color: AppColors.primary,),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب الشخصى',
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: (){},
      //   tooltip: AppWords.addBtnToolTib,
      //   label: Row(
      //       children: [
      //         Text(AppWords.addBtnToolTib,
      //           maxLines: 2, // Allow wrapping
      //           overflow: TextOverflow.ellipsis,
      //           textAlign: TextAlign.center,),
      //          Icon(Icons.add),
      //       ],
      //     ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeBody extends StatelessWidget {
   HomeBody({super.key,required this.username, required this.onGoToTalabat});
  final String username;
  final VoidCallback  onGoToTalabat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: (){ onGoToTalabat();
                  print('outside');

                },
                  // Navigator.of(context).pushReplacement(
                  //   PageRouteBuilder(
                  //     pageBuilder: (_, __, ___) =>  BlocProvider(
                  //       create: (_) => DemandsCubit()..getDemandsFromApi(),
                  //       child: const DemandsScreen(),
                  //     ),
                  //     transitionsBuilder: (_, anim, __, child) =>
                  //         FadeTransition(opacity: anim, child: child),
                  //   ),
                  // );

                child: Buildcardwidget(
                  imagePath: 'assets/deals.png',
                  title: 'الطلبات المقدمة',
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("قريبا سوف يتم فتح الدفع الالكترونى", textDirection: TextDirection.rtl,),
                    ),
                  );

                },
                child: Buildcardwidget(
                  imagePath: 'assets/money.jpg',
                  title: 'المعاملات المالية',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}