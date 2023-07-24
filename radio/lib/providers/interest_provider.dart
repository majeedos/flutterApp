import 'package:flutter/material.dart';

class InterestProvider extends ChangeNotifier {

  Map<String, String> interestsData = {
    'Productivity': 'assets/icons/productivity.png',
    'Depression': 'assets/icons/depression.png',
    'Addiction': 'assets/icons/addiction.png',
    'Self-Confidence': 'assets/icons/self_confidence.png',
    'Health and Fitness': 'assets/icons/health_fitness.png',
    'Travel': 'assets/icons/travel.png',
    'Photography': 'assets/icons/photography.png',
    'Music': 'assets/icons/music.png',
    'Art': 'assets/icons/art.png',
    'Literature': 'assets/icons/literature.png',
    'Cooking': 'assets/icons/cooking.png',
    'Technology': 'assets/icons/technology.png',
    'Gardening': 'assets/icons/gardening.png',
    'Fashion': 'assets/icons/fashion.png',
    'Sports': 'assets/icons/sports.png',
    'Science': 'assets/icons/science.png',
    'History': 'assets/icons/history.png',
    'Personal Development': 'assets/icons/personal_development.png',
    'Sustainability': 'assets/icons/sustainability.png',
    'Nature': 'assets/icons/nature.png',
    'Entrepreneurship': 'assets/icons/entrepreneurship.png',
  };

  List<Map> subInterestsData = [
    {
      "Productivity": [
        {
          "Time management": "assets/icons/random.png",
          "Goal setting": "assets/icons/random.png",
          "Task organization": "assets/icons/random.png",
          "Efficiency techniques": "assets/icons/random.png"
        }
      ],
      "Depression": [
        {
          "Mental health awareness": "assets/icons/random.png",
          "Coping strategies": "assets/icons/random.png",
          "Therapy and counseling": "assets/icons/random.png",
          "Self-care practices": "assets/icons/random.png"
        }
      ],
      "Addiction": [
        {
          "Substance abuse": "assets/icons/random.png",
          "Recovery program": "assets/icons/random.png",
          "Behavioral addictions": "assets/icons/random.png",
          "Support groups": "assets/icons/random.png"
        }
      ],
      "Self-Confidence": [
        {
          "Positive self-talk": "assets/icons/random.png",
          "Building self-esteem": "assets/icons/random.png",
          "Overcoming self-doubt": "assets/icons/random.png",
          "Assertiveness training": "assets/icons/random.png"
        }
      ],
      "Health and Fitness": [
        {
          "Exercise routines": "assets/icons/random.png",
          "Nutrition and diet": "assets/icons/random.png",
          "Weight management": "assets/icons/random.png",
          "Wellness practices": "assets/icons/random.png"
        }
      ],
      "Travel": [
        {
          "Destination guides": "assets/icons/random.png",
          "Travel tips and hacksn": "assets/icons/random.png",
          "Adventure travel": "assets/icons/random.png",
          "Solo travel": "assets/icons/random.png",
        }
      ],
      "Photography": [
        {
          "Camera equipment and gear": "assets/icons/random.png",
          "Composition and framing": "assets/icons/random.png",
          "Landscape photography": "assets/icons/random.png",
          "Lighting techniques": "assets/icons/random.png"
        }
      ],
      "Music": [
        {
          "Music theory": "assets/icons/random.png",
          "Music production and recording": "assets/icons/random.png",
          "Music genres and history": "assets/icons/random.png",
          "Performance and live gigs": "assets/icons/random.png"
        }
      ],
      "Art": [
        {
          "Painting and drawing techniques": "assets/icons/random.png",
          "Sculpture and ceramics": "assets/icons/random.png",
          "Digital art and graphic design": "assets/icons/random.png",
          "Art exhibitions and galleries": "assets/icons/random.png"
        }
      ],
      "Literature": [
        {
          "Book reviews and recommendations": "assets/icons/random.png",
          "Contemporary fiction": "assets/icons/random.png",
          "Classic literature": "assets/icons/random.png",
          "Poetry and prose": "assets/icons/random.png"
        }
      ],
      "Cooking": [
        {
          "Recipes and cooking techniques": "assets/icons/random.png",
          "Baking and pastry": "assets/icons/random.png",
          "Healthy cooking and nutrition": "assets/icons/random.png",
          "Meal planning and prep": "assets/icons/random.png"
        }
      ],
      "Technology": [
        {
          "Software and app reviews": "assets/icons/random.png",
          "Programming languages": "assets/icons/random.png",
          "Tech news and updates": "assets/icons/random.png",
          "Artificial intelligence": "assets/icons/random.png"
        }
      ],
      "Gardening": [
        {
          "Plant care and maintenance": "assets/icons/random.png",
          "Organic gardening": "assets/icons/random.png",
          "Landscaping and garden design": "assets/icons/random.png",
          "Vegetable and herb gardening": "assets/icons/random.png"
        }
      ],
      "Fashion": [
        {
          "Fashion trends and styles": "assets/icons/random.png",
          "Wardrobe essentials": "assets/icons/random.png",
          "Fashion history and icons": "assets/icons/random.png",
          "Sustainable fashion": "assets/icons/random.png"
        }
      ],
      "Sports": [
        {
          "Team sports": "assets/icons/random.png",
          "Individual sports": "assets/icons/random.png",
          "Sports training and techniques": "assets/icons/random.png",
          "ports psychology and motivation": "assets/icons/random.png"
        }
      ],
      "Science": [
        {
          "Biology and life sciences": "assets/icons/random.png",
          "Physics and astronomy": "assets/icons/random.png",
          "Earth and environmental sciences": "assets/icons/random.png",
          "Scientific research and discoveries": "assets/icons/random.png"
        }
      ],
      "History": [
        {
          "World history": "assets/icons/random.png",
          "Ancient civilizations": "assets/icons/random.png",
          "Modern history": "assets/icons/random.png",
          "Historical events and figures": "assets/icons/random.png"
        }
      ],
      "Personal Development": [
        {
          "Goal setting and achievement": "assets/icons/random.png",
          "Emotional intelligence": "assets/icons/random.png",
          "Mindset and positivity": "assets/icons/random.png",
          "Communication skills": "assets/icons/random.png"
        }
      ],
      "Sustainability": [
        {
          "Environmental conservation": "assets/icons/random.png",
          "Renewable energy sources": "assets/icons/random.png",
          "Waste reduction and recycling": "assets/icons/random.png",
          "Sustainable living practices": "assets/icons/random.png"
        }
      ],
      "Nature": [
        {
          "Wildlife and animal conservation": "assets/icons/random.png",
          "Nature photography and exploration": "assets/icons/random.png",
          "Ecological systems and biodiversity": "assets/icons/random.png",
          "Nature conservation organizations": "assets/icons/random.png"
        }
      ],
      "Entrepreneurship": [
        {
          "Business planning and strategy": "assets/icons/random.png",
          "Startup development and funding": "assets/icons/random.png",
          "Marketing and sales techniques": "assets/icons/random.png",
          "Leadership and management": "assets/icons/random.png"
        }
      ]
    },
  ];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////
  List<String> _chosenInterestData = [];
  List<String> getAllChosenInterestData() {
    return _chosenInterestData;
  }

////////////////////////////////////////////
  MapEntry<String, String> getInterestDataByTitle(String interestTitle) {
  return interestsData.entries.firstWhere((element) => element.key == interestTitle);
  }

////////////////////////////////////////////
  bool checkInterestChipSelection(String interestTitle) {
    if (!_chosenInterestData.contains(interestTitle)) {
      return false;
    } else {
      return true;
    }
  }

////////////////////////////////////////////
  void interestChipToggle(String interestTitle) {
    if (!_chosenInterestData.contains(interestTitle)) {
      _chosenInterestData.add(interestTitle);
      notifyListeners();
    } else {
      _chosenInterestData.remove(interestTitle);

      clearChosenSubInterestData(interestTitle);

      notifyListeners();
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////
  List<String> _chosenSubInterestData = [];
  List<String> getAllChosenSubInterestData() {
    return _chosenSubInterestData;
  }

  ////////////////////////////////////////////
  Map<String, String> getSubInterestDataByTitle(String subInterestTitle) {
    final matchingMap = subInterestsData.firstWhere(
      (map) => map.containsKey(subInterestTitle),
    );
    return matchingMap[subInterestTitle][0].cast<String, String>();
  }

  ////////////////////////////////////////////
  bool checkSubInterestChipSelection(String subInterestTitle) {
    if (!_chosenSubInterestData.contains(subInterestTitle)) {
      return false;
    } else {
      return true;
    }
  }

////////////////////////////////////////////
  void subInterestChipToggle(String subInterestTitle) {
    if (!_chosenSubInterestData.contains(subInterestTitle)) {
      _chosenSubInterestData.add(subInterestTitle);
      notifyListeners();
    } else {
      _chosenSubInterestData.remove(subInterestTitle);
      notifyListeners();
    }
  }

  //////////////////////////////////////////////

  void clearChosenSubInterestData(String deletedInterestTitle) {
    List<String> affectedSubInterestTitle = [];
    for (var map in subInterestsData) {
      if (map.containsKey(deletedInterestTitle)) {
        var subInterests =
            map[deletedInterestTitle] as List<Map<dynamic, dynamic>>;
        affectedSubInterestTitle =
            subInterests[0].keys.map((key) => key.toString()).toList();
        break;
      }
    }

    _chosenSubInterestData
        .removeWhere((item) => affectedSubInterestTitle.contains(item));
    notifyListeners();
  }
  ///////////////////////////////////////////

  void clearAllChosenInterests() {
    _chosenInterestData.clear();
    _chosenSubInterestData.clear();
    notifyListeners();
  }
}
