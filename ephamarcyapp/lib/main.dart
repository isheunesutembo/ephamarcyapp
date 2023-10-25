import 'package:ephamarcyapp/components/errorwidget.dart';
import 'package:ephamarcyapp/components/loader.dart';
import 'package:ephamarcyapp/controllers/authcontroller.dart';
import 'package:ephamarcyapp/models/users.dart';

import 'package:ephamarcyapp/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp( ProviderScope(child: MyApp()));
}



class MyApp extends ConsumerWidget {
  UserModel? userModel;

 void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);}
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return ref.watch(authStateChangeProvider).when(
        data: (data) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context),
              routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
                if (data != null) {
                  getData(ref, data);
                  return loggedInRoute;
                }
                return loggedOutRoute;
              }),
              routeInformationParser:const RoutemasterParser(),
            ),
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () =>const Loader());
  }
}
