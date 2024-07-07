import 'package:flutter/material.dart';
import 'package:my_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "HomeId";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
