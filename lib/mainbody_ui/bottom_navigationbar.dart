import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

 TextStyle _textStyle =TextStyle(fontSize: 16,color: Colors.grey.shade800);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade300,
        items: [
        //  BottomNavigationBarItem(
        //     title: Text("Oy ver",style: _textStyle,),
        //     backgroundColor: Colors.grey,
        //     icon: IconButton(
        //       icon: Icon(
        //         Icons.loyalty,
        //         color: Colors.red.shade800,
        //         size: 40,
        //       ),
        //       onPressed: () {
        //         context.read<Filters>().Refresh();
        //       },
        //     ),
        //   ),
           BottomNavigationBarItem(
            title: Text("Filtreleri Kaldır",style: _textStyle,),
            backgroundColor: Colors.grey,
            icon: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.grey.shade800,
                size: 40,
              ),
              onPressed: () {
                context.read<Filters>().Update(new Filters());
                Utils.ShowClearEqFilterInfo(context);
              },
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Güncelle",style: _textStyle,),
            backgroundColor: Colors.grey,
            icon: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.green,
                size: 40,
              ),
              onPressed: () {
                context.read<Filters>().Refresh();
                Utils.ShowUpdateEqInfo(context);
              },
            ),
          )
        ]);
  }
}
