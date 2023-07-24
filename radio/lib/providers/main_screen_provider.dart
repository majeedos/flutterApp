

import 'package:flutter/material.dart';

import '../discover/discover_page.dart';
import '../home/home_page.dart';
import '../library/library.dart';
import '../search/library_search.dart';

class MainScreenProvider extends ChangeNotifier{


  int _currentTab = 0; // to keep track of active tab index
  final List<Widget> _screens = [
    const HomePage(),
    const DiscoverPage(),
    const Library(),
     LibrarySearch()

  ]; // to store nested tabs
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget _currentScreen = const HomePage();

  int getCurrentTab (){
   return _currentTab;
  }

  List<Widget> getScreens (){
    return _screens;
  }

  PageStorageBucket getBucket(){
    return _bucket;
  }

  Widget getCurrentScreen (){
    return _screens[_currentTab];
  }

/*  setCurrentScreen(Widget value) {
    _currentScreen = value;
    notifyListeners();
  }*/


  setCurrentTab(int value) {
    _currentTab = value;
    notifyListeners();
  } // Our first view in viewport





}