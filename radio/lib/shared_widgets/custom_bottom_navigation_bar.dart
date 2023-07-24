

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../discover/discover_page.dart';
import '../home/home_page.dart';
import '../library/library.dart';
import '../providers/pod_cast_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff222831),
      child: SizedBox(
        height: 6.h,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height:0.3,
              width: double.infinity,
              color: Colors.grey,
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 5.h,
               // color: Colors.purpleAccent,
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Welcome
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          context.read<PodCastProvider>().dismissMiniPlayer();
                          print('current route: ${ModalRoute.of(context)?.settings.name}');

                          ModalRoute.of(context)?.settings.name != '/'
                              ? Navigator.pushReplacementNamed(context, '/')
                              : null ;

                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color:  Colors.white ,
                              size: 30,
                            )
                          ],
                        ),
                      ),

                      //Calender
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          ModalRoute.of(context)?.settings.name != 'DiscoverPage'
                              ? Navigator.pushNamed(context, 'DiscoverPage')
                              : null ;


                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      //Chat
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          ModalRoute.of(context)?.settings.name != 'Library'
                              ? Navigator.pushNamed(context, 'Library')
                              : null ;



                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                )
              )
            ],

          ),
        ]
        )
      /*  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize : MainAxisSize.min,
            children:[
              Container(
                height:0.3,
                width: double.infinity,
                color: Colors.grey,
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Welcome
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      context.read<PodCastProvider>().dismissMiniPlayer();
                      print('current route: ${ModalRoute.of(context)?.settings.name}');

                      ModalRoute.of(context)?.settings.name != '/'
                      ? Navigator.pushReplacementNamed(context, '/')
                      : null ;

                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color:  Colors.white ,
                          size: 30,
                        )
                      ],
                    ),
                  ),

                  //Calender
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      ModalRoute.of(context)?.settings.name != 'DiscoverPage'
                          ? Navigator.pushNamed(context, 'DiscoverPage')
                          : null ;


                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  //Chat
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      ModalRoute.of(context)?.settings.name != 'Library'
                          ? Navigator.pushNamed(context, 'Library')
                          : null ;



                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.list,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]
        ),*/
      ),
    );
  }
}
