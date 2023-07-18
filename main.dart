import 'package:Sggs_Online/utilis/routes/routes.dart';
import 'package:Sggs_Online/utilis/routes/routes_name.dart';
import 'package:Sggs_Online/view/dropdown_model.dart';
import 'package:Sggs_Online/view_model/books_model.dart';
import 'package:Sggs_Online/view_model/books_model2.dart';
import 'package:Sggs_Online/view_model/colored_border.dart';
import 'package:Sggs_Online/view_model/custom_keyboard_model.dart';
import 'package:Sggs_Online/view_model/dropdown_model.dart';
import 'package:Sggs_Online/view_model/image_model.dart';
import 'package:Sggs_Online/view_model/page2_view_model.dart';
import 'package:Sggs_Online/view_model/page3_view_model.dart';
import 'package:Sggs_Online/view_model/page_view_model.dart';
import 'package:Sggs_Online/view_model/single_model.dart';
import 'package:Sggs_Online/view_model/view_container.dart';
import 'package:Sggs_Online/view_model/viewpage_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:window_manager/window_manager.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  await windowManager.setMinimumSize(const Size(720, 600));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PageViewModel()),
          ChangeNotifierProvider(create: (_) => Page3ViewProvider()),
          ChangeNotifierProvider(create: (_) => CustomKeyboardModel()),
          ChangeNotifierProvider(create: (_) => Coloredborder()),
          ChangeNotifierProvider(create: (_) => DropdownTools()),
          ChangeNotifierProvider(create: (_) => ViewContainerModel()),
          ChangeNotifierProvider(create: (_) => CustombooksModel()),
          ChangeNotifierProvider(create: (_) => NewbooksModel()),
          ChangeNotifierProvider(create: (_) => page2viewModel()),
          ChangeNotifierProvider(create: (_) => ViewSingleModel()),
          ChangeNotifierProvider(create: (_) => ViewModel()),
          ChangeNotifierProvider(create: (_) => MyModel()),
          ChangeNotifierProvider(create: (_) => DropdownModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xffFE3E26),
                  background: Colors.white,
                ),
          ),
          initialRoute: RoutesName.home,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
