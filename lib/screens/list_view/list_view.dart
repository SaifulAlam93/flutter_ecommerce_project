import 'package:ecommerce_ui/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerce_ui/enums.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';


class ListDataView extends StatelessWidget {
  static String routeName = "/list";

  const ListDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: Text("Alhamdulillah"),
        ),
  
        body: Body(),
        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      );
  }
}
