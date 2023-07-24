import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:textfield_search/textfield_search.dart';
import 'dart:async';

class HomeSearch extends StatefulWidget {
  HomeSearch({Key? key, this.title = 'My Home Page'}) : super(key: key);

  final String title;

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final _testList = [
    'Test Item 1',
    'Test Item 2',
    'Test Item 3',
    'Test Item 4',
  ];

  TextEditingController myController = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();
  TextEditingController myController4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    myController2.addListener(_printLatestValue);
    myController3.addListener(_printLatestValue);
    myController4.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("text field: ${myController.text}");
    print("text field: ${myController2.text}");
    print("text field: ${myController3.text}");
    print("text field: ${myController4.text}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    super.dispose();
  }

  // mocking a future
  Future<List> fetchSimpleData() async {
    await Future.delayed(Duration(milliseconds: 3000));
    List _list = <dynamic>[];
    // create a list from the text input of three items
    // to mock a list of items from an http call
    _list.add('Test' + ' Item 1');
    _list.add('Test' + ' Item 2');
    _list.add('Test' + ' Item 3');
    return _list;
  }

  // mocking a future that returns List of Objects
  Future<List> fetchComplexData() async {
    await Future.delayed(Duration(milliseconds: 3000));
    List _list = <dynamic>[];
    List _jsonList = [
      {'label': 'Text' + ' Item 1', 'value': 30},
      {'label': 'Text' + ' Item 2', 'value': 31},
      {'label': 'Text' + ' Item 3', 'value': 32},
    ];
    // create a list from the text input of three items
    // to mock a list of items from an http call where
    // the label is what is seen in the textfield and something like an
    // ID is the selected value
    _list.add(new TestItem.fromJson(_jsonList[0]));
    _list.add(new TestItem.fromJson(_jsonList[1]));
    _list.add(new TestItem.fromJson(_jsonList[2]));

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight),
        child: Column(
            children:[
              Padding(
                padding:EdgeInsets.only(top: MediaQuery.of(context).padding.top+10),
                child:  Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 5.w,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Color(0xff818790),

                        ),
                      ),
                    ),
                    Container(
                      width: 75.w,
                      height: 35,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,

                        decoration: InputDecoration(
                            isCollapsed: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Color(0xff5A5F67),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(color: Color(0xffC3C7CC)),
                            hintText: "placeholder"),
                      ),
                    ),
                    Container(

                      width: 15.w,
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Search",
                              style: GoogleFonts.sourceSans3(
                                  color: Color(0xff00ADB5),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.13
                              ),
                            )),
                      ),
                    )
                  ],
                  //color: Color(0xff222831),
                ),
              ),

            ]
        ),

      ),
        body:Padding(
          padding: EdgeInsets.only(top: 7.5),
          child: ListView(

            children: [

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    children: [
                      const Icon(
                          Icons.history,
                          color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Joe Rogan',
                        style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          letterSpacing: 0.25,
                          color: Colors.white
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                              Icons.clear,
                            color: Color(0xff818790),
                            size: 15,
                          ),
                        )
                      )
                    ],
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.history,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Joe Rogan',
                        style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            letterSpacing: 0.25,
                            color: Colors.white
                        ),
                      ),
                      const Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.clear,
                              color: Color(0xff818790),
                              size: 15,
                            ),
                          )
                      )
                    ],
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.history,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Joe Rogan',
                        style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            letterSpacing: 0.25,
                            color: Colors.white
                        ),
                      ),
                      const Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.clear,
                              color: Color(0xff818790),
                              size: 15,
                            ),
                          )
                      )
                    ],
                  )
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 14.0, 0.0, 0.0),
              child:Text(
                'Also',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white
                ),
              )
              ),
              SizedBox(
                height: 13.0,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                child: Container(
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF90D2D6), // Replace with your desired color
                        Color.fromRGBO(144, 210, 214, 0), // Replace with your desired color
                      ],
                      stops: [0.0, 0.9316],
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 10.0),
                        child: Icon(
                            Icons.brightness_1,
                            color: Color(0xff00ADB5),
                          size: 8.0,
                        ),
                      ),
                      Text(
                      'Productivity in Startups',
                      style: GoogleFonts.sourceSans3(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 0.25,
                        color: Colors.white
                      )
                    ,
                    ),
                  ]
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                child: Container(
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF90D2D6), // Replace with your desired color
                        Color.fromRGBO(144, 210, 214, 0), // Replace with your desired color
                      ],
                      stops: [0.0, 0.9316],
                    ),
                  ),
                  child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 10.0),
                          child: Icon(
                            Icons.brightness_1,
                            color: Color(0xff00ADB5),
                            size: 8.0,
                          ),
                        ),
                        Text(
                          'Productivity in Startups',
                          style: GoogleFonts.sourceSans3(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.25,
                              color: Colors.white
                          )
                          ,
                        ),
                      ]
                  ),
                ),
              ),


              SizedBox(
                height: 7.0,
              ),
              Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 9.0, 10.0, 10.0),
                      child: Icon(
                        Icons.brightness_1,
                        color: Color(0xff818790),
                        size: 8.0,
                      ),
                    ),
                    Text(
                      'Productivity in Startups',
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 0.25,
                          color: Colors.white
                      )
                      ,
                    ),
                  ]
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 9.0, 10.0, 10.0),
                      child: Icon(
                        Icons.brightness_1,
                        color: Color(0xff818790),
                        size: 8.0,
                      ),
                    ),
                    Text(
                      'Productivity in Startups',
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 0.25,
                          color: Colors.white
                      )
                      ,
                    ),
                  ]
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 9.0, 10.0, 10.0),
                      child: Icon(
                        Icons.brightness_1,
                        color: Color(0xff818790),
                        size: 8.0,
                      ),
                    ),
                    Text(
                      'Productivity in Startups',
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 0.25,
                          color: Colors.white
                      )
                      ,
                    ),
                  ]
              ),


              SizedBox(
                height: 42,
              ),
              Center(
                child: Text(
                  'Give Feedback',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                    letterSpacing: 0.13,
                    color: Color(0xffc3c7cc)
                  ),
                ),
              )
            ],

    ),
        ),
    );
  }
}

// Mock Test Item Class
class TestItem {
  final String label;
  dynamic value;

  TestItem({required this.label, this.value});

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(label: json['label'], value: json['value']);
  }
}
