import 'package:flutter/material.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: HomeAppBar(),
      // bottomNavigationBar: MainNavBar(),
      body: HomePageBody(),
    );
  }
}
