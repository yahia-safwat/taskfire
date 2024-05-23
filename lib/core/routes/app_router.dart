import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import 'app_routes.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: AppRoutes.editTask,
      //   name: AppRoutes.editTask,
      //   builder: (context, state) => const EditTaskPage(),
      // ),
      // GoRoute(
      //   path: AppRoutes.addTask,
      //   name: AppRoutes.addTask,
      //   builder: (context, state) => const AddTaskPage(),
      // ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route found for ${state.error}'),
      ),
    ),
  );
}
