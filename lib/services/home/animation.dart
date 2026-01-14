import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/services/Login/presentation/widgets/appBar_title.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/utils/app_strings.dart';


class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key,});


  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

double _width = 200;
double _margin = 10;
Color _color = Colors.cyan;
double _opacity = 1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppbarTitle(),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        color: _color,
        width: _width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                _width =300;
                _margin = 20;
              });
            }, child: Text('animate me'))
            ,ElevatedButton(onPressed: (){
              setState(() {
                _color = AppColors.primary;
              });
            }, child: Text('color me')),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    _opacity = 0;
                  });
                }, child: Text('HIDE me')),

              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                _opacity = 1;
              });
            }, child: Text('SHOW me')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        tooltip: AppWords.addBtnToolTib,
        label: Row(
            children: [
              Text(AppWords.addBtnToolTib,
                maxLines: 2, // Allow wrapping
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,),
               Icon(Icons.add),
            ],
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}