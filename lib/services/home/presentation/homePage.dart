import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/Login/presentation/widgets/appBar_title.dart';
import 'package:ashghal/services/operations/presentation/Demands_screen.dart';
import 'package:ashghal/services/Login/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashghal/core/utils/app_strings.dart';
 import 'widgets/buildCardWidget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,required this.userName});
  final String userName ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late final List<Widget> _screens = [
    HomeBody(username: widget.userName,),
    const DemandsScreen(),
    const ProfileScreen(),
  ];
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
  const HomeBody({super.key,required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Buildcardwidget(
                imagePath: 'assets/deals.png',
                title: 'الطلبات المقدمة',
              ),
              const SizedBox(height: 20),
              Buildcardwidget(
                imagePath: 'assets/money.jpg',
                title: 'المعاملات المالية',
              ),
            ],
          ),
        ),
      ],
    );
  }
}