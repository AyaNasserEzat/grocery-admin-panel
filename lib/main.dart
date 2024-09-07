import 'package:admin_panel_grocery_app/core/theme/app_theme.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/home_view.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:admin_panel_grocery_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductCubit()..getProduct(),
      ),
      BlocProvider(
        create: (context) => OrderCubit()..getOrder(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
