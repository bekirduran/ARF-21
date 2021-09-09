
import '../Widgets/category_grid_widget.dart';
import 'package:flutter/material.dart';

class ShopWelcomeScreen extends StatelessWidget {
  const ShopWelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/ShopWelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(child: CategoryGridWidget()) ,
    );
  }
}
