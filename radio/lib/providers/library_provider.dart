

import 'package:flutter/material.dart';


enum SortBy {

  recent('Recent'),
  recentlyAdded('Recently Added'),
  alphabetical('Alphabetical'),
  ;

   final  String value;
   const SortBy(this.value);

}



class LibraryProvider extends ChangeNotifier{

  SortBy  _libraryPodCastSortBy = SortBy.recent;
  SortBy  _libraryListenLaterSortBy = SortBy.recent;
  SortBy  _libraryFollowingSortBy = SortBy.recent;

  setLibraryPodCastSortBy({required SortBy sortBy}){
    _libraryPodCastSortBy = sortBy;
    notifyListeners();
  }
  SortBy  getLibraryPodCastSortBy(){
  return _libraryPodCastSortBy ;
  }


  setLibraryListenLaterSortBy({required SortBy sortBy}){
    _libraryListenLaterSortBy = sortBy;
    notifyListeners();
  }
  SortBy  getLibraryListenLaterSortBy(){
    return _libraryListenLaterSortBy ;
  }


  setLibraryFollowingSortBy({required SortBy sortBy}){
    _libraryFollowingSortBy = sortBy;
    notifyListeners();
  }
  SortBy  getLibraryFollowingSortBy(){
    return _libraryFollowingSortBy ;
  }




  final List<Map<String, String>> _libraryPodCasts = [

    {
      'Image' : 'assets/lexFridman.png',
      'title' : 'Thursday Afternoon Monday Morning Podcast 5-11-23',
      'subTitle' : '',
      'tail': 'May 11 ● 1 hr, 9 min'
    },
    {
      'Image' : 'assets/the economist.png',
      'title' : 'Money Talks:Is the car industry running out of gas?',
      'subTitle' : '',
      'tail': 'March 8 ● 1 hr, 9 min'
    },
    {
      'Image' : 'assets/image 3.png',
      'title' : 'The Rolls Royce of Vikings',
      'subTitle' : '',
      'tail': 'jan 8 ● 36 min'
    },
    {
      'Image' : 'assets/image 4.png',
      'title' : 'James Fox',
      'subTitle' : '',
      'tail': 'Oct 1 ● 1 hr, 9 min'
    }


  ];

  List<Map<String, String>> getLibraryPodCas(){
    return _libraryPodCasts;
  }


}
