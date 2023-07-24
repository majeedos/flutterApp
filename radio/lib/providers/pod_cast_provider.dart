

import 'package:flutter/material.dart';

enum PlaybackSpeed {
  quarter('0.25x'),
  half('0.5x'),
  normal('Normal'),
  oneAndQuarter('1.25x'),
  oneAndHalf('1.5x'),
  double('2x'),;


  final String value;

  const  PlaybackSpeed(this.value);

}


enum SleepTimer {
  fiveMinutes('5 minutes'),
  tenMinutes('10 minutes'),
  fifteenMinutes('15 minutes'),
  twentyMinutes('20 minutes'),
  thirtyMinutes('30 minutes'),
  fortyFiveMinutes('45 minutes'),
  oneHour('1 hour'),
  endOfEpisode('End Of Episode'),
  ;


  final String value;

  const  SleepTimer(this.value);

}


class PodCastProvider extends ChangeNotifier{


  bool _isPlaying = false;
  bool _showMiniPlayer = false;

  togglePlaying(){
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  bool getPlayingStatus(){
    return _isPlaying;
  }

  bool getMiniPlayerStatus(){
    return _showMiniPlayer;
  }

   dismissMiniPlayer(){
     _showMiniPlayer = false;
     notifyListeners();
  }
  showMiniPlayer(){
    _showMiniPlayer = true;
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////

  PlaybackSpeed  _currentPlayBackSpeed = PlaybackSpeed.normal;

  PlaybackSpeed getCurrentPlayBackSpeed(){
    return _currentPlayBackSpeed;
  }

  void setCurrentPlayBackSpeed({required PlaybackSpeed playbackSpeed}){
     _currentPlayBackSpeed = playbackSpeed;
     notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////

  SleepTimer _currentSleepTimer = SleepTimer.oneHour;

  SleepTimer getCurrentSleepTimer(){
    return _currentSleepTimer;
  }

  void setCurrentSleepTimer({required SleepTimer sleepTimer}){
    _currentSleepTimer = sleepTimer;
    notifyListeners();
  }


}