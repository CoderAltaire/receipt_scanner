import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/left/bloc/check_f_bloc.dart';
import 'package:receipt_scanner/left/checks_list.dart';
import 'model/receipt_model_4.dart';
import 'my_objectbox/my_objectbox.dart';
import 'right/check_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Prefs.init();
  await MyObjectbox.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    List<ReceiptModel4> checksList =
        MyObjectbox.saleStore.box<ReceiptModel4>().getAll().reversed.toList();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckFBloc(checksList: checksList)),
      ],
      child: MaterialApp(
        title: 'Receipt Scanner',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
            primaryColor: const Color.fromARGB(255, 8, 84, 146)),
        home: Scaffold(
          body: Container(
            color: Theme.of(context).colorScheme.background,
            child: Row(
              children: [
                Builder(
                  builder: (context) {
                    BlocProvider.of<CheckFBloc>(context)
                        .add(CheckFCallInitialEvent());
                    return const Expanded(
                      flex: 1,
                      child: ChecksListt(),
                    );
                  },
                ),
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                const Expanded(
                  flex: 3,
                  child: CheckView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Generate qiliw ucun kerak 
//flutter packages pub run build_runner watch --use-polling-watcher --delete-conflicting-outputs