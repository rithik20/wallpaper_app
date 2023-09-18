import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationsRough extends StatelessWidget {
  const AnimationsRough({super.key});

  @override
  Widget build(BuildContext context) {
    final prop = Provider.of<Properties>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<Properties>(
              builder: (context, state, child) {
                return AnimatedContainer(
                  width: state.width,
                  height: state.height,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Image.asset("assets/ui_layer/display_page/no_data_to_show.jpg"),
                );
              }
            ),

            Row(
              children: [
                MaterialButton(
                  color: Colors.black,
                    onPressed: (){
                      prop.increase();
                    }),
                MaterialButton(
                    color: Colors.black,
                    onPressed: (){
                      prop.decrease();
                    })
              ],
            )
          ],
        )
      ),
    );
  }
}

List<int> list = [1,2,3,56,8,9,12];

class Properties extends ChangeNotifier{

  double width = 200.0;
  double height = 200.0;

  void increase(){
    width = 400;
    height = 400;
    notifyListeners();
  }

  void decrease(){
    width = 200.0;
    height = 200.0;
    notifyListeners();
  }
}