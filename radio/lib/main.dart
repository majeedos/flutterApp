
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/creator/creator_page.dart';
import 'package:radio/home/home_page.dart';
import 'package:radio/podscast_player/pod_cast_player.dart';
import 'package:radio/providers/home_page_provider.dart';
import 'package:radio/providers/library_provider.dart';
import 'package:radio/providers/interest_provider.dart';
import 'package:radio/providers/main_screen_provider.dart';
import 'package:radio/providers/pod_cast_provider.dart';
import 'package:radio/providers/search_provider.dart';
import 'package:radio/search/home_search.dart';
import 'package:radio/search/library_search.dart';
import 'package:sizer/sizer.dart';
import 'auth/login_page.dart';
import 'discover/discover_page.dart';
import 'home/tags_page.dart';
import 'library/library.dart';

void main() {

  runApp(
    DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) =>  MultiProvider(
          providers: [
            ChangeNotifierProvider<InterestProvider>(create: (_) => InterestProvider()),
            ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
            ChangeNotifierProvider<HomePageProvider>(create: (_) => HomePageProvider()),
            ChangeNotifierProvider<LibraryProvider>(create: (_) => LibraryProvider()),
            ChangeNotifierProvider<PodCastProvider>(create: (_) => PodCastProvider()),
            ChangeNotifierProvider<MainScreenProvider>(create: (_) => MainScreenProvider()),

          ],
          child: const MyApp(),
        )
    ),
  );



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,_) {

        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
        //  home: MainScreen(),

          routes: {
            '/' : (_)=> HomePage(),
            'LibrarySearch' : (_)=> LibrarySearch(),
            'Library' : (_)=> Library(),
            'DiscoverPage' : (_)=> DiscoverPage(),
            'TagsPage' : (_)=> TagsPage(),
            'CreatorPage' : (_)=> CreatorPage(),
            'PodCastPlayer' : (_)=> PodCastPlayer(),

           /* '/' : (_)=> MainScreen(),
            '/' : (_)=> MainScreen(),
            '/' : (_)=> MainScreen(),*/
          },
          //MainScreen(),
        );
      },

    );
  }
}


