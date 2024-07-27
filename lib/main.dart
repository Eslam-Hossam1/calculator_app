import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit_states.dart';
import 'package:my_app/simple_bloc_oberver.dart';
import 'package:my_app/views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = SimpleBlocOberver();

  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalculationsCubit()),
        BlocProvider(create: (context) => ChangeThemeCubit()),
      ],
      child: BlocBuilder<ChangeThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: BlocProvider.of<ChangeThemeCubit>(context).theme,
            routes: {
              HomeView.id: (context) => const HomeView(),
            },
            initialRoute: HomeView.id,
          );
        },
      ),
    );
  }
}
