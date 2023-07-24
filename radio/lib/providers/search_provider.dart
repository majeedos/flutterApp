import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<Map<String, String>> prodCasts = [
    {
      'image': 'assets/lexFridman.png',
      'title': 'PodCast 0 title',
      'subTitle': 'PodCast 0 subTitle'
    },
    {
      'image': 'assets/pod_casts/image 3.png',
      'title': "Conan o'Brien Needs a Friend",
      'subTitle': 'Team Coco & Earwolf Celebrities'
    },
    {
      'image': 'assets/lexFridman.png',
      'title': 'PodCast 2 title',
      'subTitle': 'PodCast 2 subTitle'
    },
    {
      'image': 'assets/pod_casts/image 3.png',
      'title': 'PodCast 3 title',
      'subTitle': 'PodCast 3 subTitle'
    },
    {
      'image': 'assets/lexFridman.png',
      'title': 'PodCast 4 title',
      'subTitle': 'PodCast 4 subTitle'
    },
    {
      'image': 'assets/pod_casts/image 3.png',
      'title': 'PodCast 3 title',
      'subTitle': 'PodCast 3 subTitle'
    },
  ];




  List<Map<String, String>> filteredProdCasts = [];

  SearchProvider() {
    filteredProdCasts = List<Map<String, String>>.from(prodCasts);
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredProdCasts = List<Map<String, String>>.from(prodCasts);
    } else {
      filteredProdCasts = prodCasts
          .where((map) =>
      map['title']!.toLowerCase().contains(query.toLowerCase()) ||
          map['subTitle']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}