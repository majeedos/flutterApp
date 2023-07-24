

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:faker/faker.dart';
class HomePageProvider extends ChangeNotifier {
String _chosenTag= '';
int _currentStream = 0;

final List<Map<String, dynamic>> _tagsContent = [


  {
    'Title': lorem(paragraphs: 1, words: 7),
    'Summary' : lorem(paragraphs: 1, words: 20),
    'Image' : 'assets/Frame 60.png',
    'Duration' : faker.randomGenerator.integer(100)
  },

{
  'Title': lorem(paragraphs: 1, words: 7),
  'Summary' : lorem(paragraphs: 1, words: 20),
  'Image' : 'assets/pod_casts/podCast_0.jpg',
  'Duration' : faker.randomGenerator.integer(100)
},
  {
    'Title': lorem(paragraphs: 1, words: 10),
    'Summary' : lorem(paragraphs: 1, words: 20),
    'Image' : 'assets/pod_casts/podCast_1.jpg',
    'Duration' : faker.randomGenerator.integer(100)
  },
  {
    'Title': lorem(paragraphs: 1, words: 10),
    'Summary' : lorem(paragraphs: 1, words: 20),
    'Image' : 'assets/pod_casts/podCast_2.jpg',
    'Duration' : faker.randomGenerator.integer(100)
  },
  {
    'Title': lorem(paragraphs: 1, words: 10),
    'Summary' : lorem(paragraphs: 1, words: 20),
    'Image' : 'assets/pod_casts/podCast_3.png',
    'Duration' : faker.randomGenerator.integer(100)
  },


];

void setChoseTag({required String chosenTag}){
  _chosenTag = chosenTag;
}

String getChoseTag(){
  return _chosenTag;
}

void setCurrentStream({required int currentStream}){
  _currentStream = currentStream;
}

int getCurrentStream(){
  return _currentStream;
}

List<Map<String, dynamic>> getTagsContent(){
  return _tagsContent;
 }

}
