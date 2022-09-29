import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:finalcontainer/banka2.dart';
import 'package:finalcontainer/bankb.dart';
import 'package:finalcontainer/containers_class.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BankB2Class extends StatefulWidget {
  const BankB2Class({Key? key}) : super(key: key);

  @override
  State<BankB2Class> createState() => BankB2ClassState();
}

class BankB2ClassState extends State<BankB2Class> {
  final date = DateTime(2022);

  Timer? timer;

  bool countDown = true;

  bool isTheme = true;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  double pos = 0;
  double hour = 0;
  double min = 0;
  double sed = 0;
  List<int> i = [];

  List<Map<String, dynamic>> data2 = [
    {
      "id": 1,
      "img1": "assets/img1.png",
      "img2": "assets/wimg1.png",
      "blue": "assets/b(1).png",
      "gold": "assets/g(1).png",
      "bankaudio1": "banka(1).mp3",
      "bankaudio2": "bankb(1).mp3",
      "selection": false
    },
    {
      "id": 2,
      "img1": "assets/img2.png",
      "img2": "assets/wimg2.png",
      "blue": "assets/b(2).png",
      "gold": "assets/g(2).png",
      "bankaudio1": "banka(2).mp3",
      "bankaudio2": "bankb(2).mp3",
      "selection": false
    },
    {
      "id": 3,
      "img1": "assets/img3.png",
      "img2": "assets/wimg3.png",
      "blue": "assets/b(3).png",
      "gold": "assets/g(3).png",
      "bankaudio1": "banka(3).mp3",
      "bankaudio2": "bankb(3).mp3",
      "selection": false
    },
    {
      "id": 4,
      "img1": "assets/img4.png",
      "img2": "assets/wimg4.png",
      "blue": "assets/b(4).png",
      "gold": "assets/g(4).png",
      "bankaudio1": "banka(4).mp3",
      "bankaudio2": "bankb(4).mp3",
      "selection": false
    },
    {
      "id": 5,
      "img1": "assets/img5.png",
      "img2": "assets/wimg5.png",
      "blue": "assets/b(5).png",
      "gold": "assets/g(5).png",
      "bankaudio1": "banka(5).mp3",
      "bankaudio2": "bankb(5).mp3",
      "selection": false
    },
    {
      "id": 6,
      "img1": "assets/img6.png",
      "img2": "assets/wimg6.png",
      "blue": "assets/b(6).png",
      "gold": "assets/g(6).png",
      "bankaudio1": "banka(6).mp3",
      "bankaudio2": "bankb(6).mp3",
      "selection": false
    },
    {
      "id": 7,
      "img1": "assets/img7.png",
      "img2": "assets/wimg7.png",
      "blue": "assets/b(7).png",
      "gold": "assets/g(7).png",
      "bankaudio1": "banka(7).mp3",
      "bankaudio2": "bankb(7).mp3",
      "selection": false
    },
    {
      "id": 8,
      "img1": "assets/img8.png",
      "img2": "assets/wimg8.png",
      "blue": "assets/b(8).png",
      "gold": "assets/g(8).png",
      "bankaudio1": "banka(8).mp3",
      "bankaudio2": "bankb(8).mp3",
      "selection": false
    },
    {
      "id": 9,
      "img1": "assets/img9.png",
      "img2": "assets/wimg9.png",
      "blue": "assets/b(9).png",
      "gold": "assets/g(9).png",
      "bankaudio1": "banka(9).mp3",
      "bankaudio2": "bankb(9).mp3",
      "selection": false
    },
    {
      "id": 10,
      "img1": "assets/img10.png",
      "img2": "assets/wimg10.png",
      "blue": "assets/b(10).png",
      "gold": "assets/g(10).png",
      "bankaudio1": "banka(10).mp3",
      "bankaudio2": "bankb(10).mp3",
      "selection": false
    },
    {
      "id": 11,
      "img1": "assets/img11.png",
      "img2": "assets/wimg11.png",
      "blue": "assets/b(11).png",
      "gold": "assets/g(11).png",
      "bankaudio1": "banka(11).mp3",
      "bankaudio2": "bankb(11).mp3",
      "selection": false
    },
    {
      "id": 12,
      "img1": "assets/img12.png",
      "img2": "assets/wimg12.png",
      "blue": "assets/b(12).png",
      "gold": "assets/g(12).png",
      "bankaudio1": "banka(12).mp3",
      "bankaudio2": "bankb(12).mp3",
      "selection": false
    },
    {
      "id": 13,
      "img1": "assets/img13.png",
      "img2": "assets/wimg13.png",
      "blue": "assets/b(13).png",
      "gold": "assets/g(13).png",
      "bankaudio1": "banka(13).mp3",
      "bankaudio2": "bankb(13).mp3",
      "selection": false
    },
    {
      "id": 14,
      "img1": "assets/img14.png",
      "img2": "assets/wimg14.png",
      "blue": "assets/b(14).png",
      "gold": "assets/g(14).png",
      "bankaudio1": "banka(14).mp3",
      "bankaudio2": "bankb(14).mp3",
      "selection": false
    },
    {
      "id": 15,
      "img1": "assets/img15.png",
      "img2": "assets/wimg15.png",
      "blue": "assets/b(15).png",
      "gold": "assets/g(15).png",
      "bankaudio1": "banka(15).mp3",
      "bankaudio2": "bankb(15).mp3",
      "selection": false
    },
    {
      "id": 16,
      "img1": "assets/img16.png",
      "img2": "assets/wimg16.png",
      "blue": "assets/b(16).png",
      "gold": "assets/g(16).png",
      "bankaudio1": "banka(16).mp3",
      "bankaudio2": "bankb(16).mp3",
      "selection": false
    },
    {
      "id": 17,
      "img1": "assets/img17.png",
      "img2": "assets/wimg17.png",
      "blue": "assets/b(17).png",
      "gold": "assets/g(17).png",
      "bankaudio1": "banka(17).mp3",
      "bankaudio2": "bankb(17).mp3",
      "selection": false
    },
    {
      "id": 18,
      "img1": "assets/img18.png",
      "img2": "assets/wimg18.png",
      "blue": "assets/b(18).png",
      "gold": "assets/g(18).png",
      "bankaudio1": "banka(18).mp3",
      "bankaudio2": "bankb(18).mp3",
      "selection": false
    },
    {
      "id": 19,
      "img1": "assets/img19.png",
      "img2": "assets/wimg19.png",
      "blue": "assets/b(19).png",
      "gold": "assets/g(19).png",
      "bankaudio1": "banka(19).mp3",
      "bankaudio2": "bankb(19).mp3",
      "selection": false
    },
    {
      "id": 20,
      "img1": "assets/img20.png",
      "img2": "assets/wimg20.png",
      "blue": "assets/b(20).png",
      "gold": "assets/g(20).png",
      "bankaudio1": "banka(20).mp3",
      "bankaudio2": "bankb(20).mp3",
      "selection": false
    },
    {
      "id": 21,
      "img1": "assets/img21.png",
      "img2": "assets/wimg21.png",
      "blue": "assets/b(21).png",
      "gold": "assets/g(21).png",
      "bankaudio1": "banka(21).mp3",
      "bankaudio2": "bankb(21).mp3",
      "selection": false
    },
    {
      "id": 22,
      "img1": "assets/img22.png",
      "img2": "assets/wimg22.png",
      "blue": "assets/b(22).png",
      "gold": "assets/g(22).png",
      "bankaudio1": "banka(22).mp3",
      "bankaudio2": "bankb(22).mp3",
      "selection": false
    },
    {
      "id": 23,
      "img1": "assets/img23.png",
      "img2": "assets/wimg23.png",
      "blue": "assets/b(23).png",
      "gold": "assets/g(23).png",
      "bankaudio1": "banka(23).mp3",
      "bankaudio2": "bankb(23).mp3",
      "selection": false
    },
    {
      "id": 24,
      "img1": "assets/img24.png",
      "img2": "assets/wimg24.png",
      "blue": "assets/b(24).png",
      "gold": "assets/g(24).png",
      "bankaudio1": "banka(24).mp3",
      "bankaudio2": "bankb(24).mp3",
      "selection": false
    },
    {
      "id": 25,
      "img1": "assets/img25.png",
      "img2": "assets/wimg25.png",
      "blue": "assets/b(25).png",
      "gold": "assets/g(25).png",
      "bankaudio1": "banka(25).mp3",
      "bankaudio2": "bankb(25).mp3",
      "selection": false
    },
    {
      "id": 26,
      "img1": "assets/img26.png",
      "img2": "assets/wimg26.png",
      "blue": "assets/b(26).png",
      "gold": "assets/g(26).png",
      "bankaudio1": "banka(26).mp3",
      "bankaudio2": "bankb(26).mp3",
      "selection": false
    },
    {
      "id": 27,
      "img1": "assets/img27.png",
      "img2": "assets/wimg27.png",
      "blue": "assets/b(27).png",
      "gold": "assets/g(27).png",
      "bankaudio1": "banka(27).mp3",
      "bankaudio2": "bankb(27).mp3",
      "selection": false
    },
    {
      "id": 28,
      "img1": "assets/img28.png",
      "img2": "assets/wimg28.png",
      "blue": "assets/b(28).png",
      "gold": "assets/g(28).png",
      "bankaudio1": "banka(28).mp3",
      "bankaudio2": "bankb(28).mp3",
      "selection": false
    },
    {
      "id": 29,
      "img1": "assets/img29.png",
      "img2": "assets/wimg29.png",
      "blue": "assets/b(29).png",
      "gold": "assets/g(29).png",
      "bankaudio1": "banka(29).mp3",
      "bankaudio2": "bankb(29).mp3",
      "selection": false
    },
    {
      "id": 30,
      "img1": "assets/img30.png",
      "img2": "assets/wimg30.png",
      "blue": "assets/b(30).png",
      "gold": "assets/g(30).png",
      "bankaudio1": "banka(30).mp3",
      "bankaudio2": "bankb(30).mp3",
      "selection": false
    },
    {
      "id": 31,
      "img1": "assets/img31.png",
      "img2": "assets/wimg31.png",
      "blue": "assets/b(31).png",
      "gold": "assets/g(31).png",
      "bankaudio1": "banka(31).mp3",
      "bankaudio2": "bankb(31).mp3",
      "selection": false
    },
    {
      "id": 32,
      "img1": "assets/img32.png",
      "img2": "assets/wimg32.png",
      "blue": "assets/b(32).png",
      "gold": "assets/g(32).png",
      "bankaudio1": "banka(32).mp3",
      "bankaudio2": "bankb(32).mp3",
      "selection": false
    },
    {
      "id": 33,
      "img1": "assets/img33.png",
      "img2": "assets/wimg33.png",
      "blue": "assets/b(33).png",
      "gold": "assets/g(33).png",
      "bankaudio1": "banka(33).mp3",
      "bankaudio2": "bankb(33).mp3",
      "selection": false
    },
    {
      "id": 34,
      "img1": "assets/img34.png",
      "img2": "assets/wimg34.png",
      "blue": "assets/b(34).png",
      "gold": "assets/g(34).png",
      "bankaudio1": "banka(34).mp3",
      "bankaudio2": "bankb(34).mp3",
      "selection": false
    },
    {
      "id": 35,
      "img1": "assets/img35.png",
      "img2": "assets/wimg35.png",
      "blue": "assets/b(35).png",
      "gold": "assets/g(35).png",
      "bankaudio1": "banka(35).mp3",
      "bankaudio2": "bankb(35).mp3",
      "selection": false
    },
    {
      "id": 36,
      "img1": "assets/img36.png",
      "img2": "assets/wimg36.png",
      "blue": "assets/b(36).png",
      "gold": "assets/g(36).png",
      "bankaudio1": "banka(36).mp3",
      "bankaudio2": "bankb(36).mp3",
      "selection": false
    },
    {
      "id": 37,
      "img1": "assets/img37.png",
      "img2": "assets/wimg37.png",
      "blue": "assets/b(37).png",
      "gold": "assets/g(37).png",
      "bankaudio1": "banka(37).mp3",
      "bankaudio2": "bankb(37).mp3",
      "selection": false
    },
    {
      "id": 38,
      "img1": "assets/img38.png",
      "img2": "assets/wimg38.png",
      "blue": "assets/b(38).png",
      "gold": "assets/g(38).png",
      "bankaudio1": "banka(38).mp3",
      "bankaudio2": "bankb(38).mp3",
      "selection": false
    },
    {
      "id": 39,
      "img1": "assets/img39.png",
      "img2": "assets/wimg39.png",
      "blue": "assets/b(39).png",
      "gold": "assets/g(39).png",
      "bankaudio1": "banka(39).mp3",
      "bankaudio2": "bankb(39).mp3",
      "selection": false
    },
    {
      "id": 40,
      "img1": "assets/img40.png",
      "img2": "assets/wimg40.png",
      "blue": "assets/b(40).png",
      "gold": "assets/g(40).png",
      "bankaudio1": "banka(40).mp3",
      "bankaudio2": "bankb(40).mp3",
      "selection": false
    },
    {
      "id": 41,
      "img1": "assets/img41.png",
      "img2": "assets/wimg41.png",
      "blue": "assets/b(41).png",
      "gold": "assets/g(41).png",
      "bankaudio1": "banka(41).mp3",
      "bankaudio2": "bankb(41).mp3",
      "selection": false
    },
    {
      "id": 42,
      "img1": "assets/img42.png",
      "img2": "assets/wimg42.png",
      "blue": "assets/b(42).png",
      "gold": "assets/g(42).png",
      "bankaudio1": "banka(42).mp3",
      "bankaudio2": "bankb(42).mp3",
      "selection": false
    },
    {
      "id": 43,
      "img1": "assets/img43.png",
      "img2": "assets/wimg43.png",
      "blue": "assets/b(43).png",
      "gold": "assets/g(43).png",
      "bankaudio1": "banka(43).mp3",
      "bankaudio2": "bankb(43).mp3",
      "selection": false
    },
    {
      "id": 44,
      "img1": "assets/img44.png",
      "img2": "assets/wimg44.png",
      "blue": "assets/b(44).png",
      "gold": "assets/g(44).png",
      "bankaudio1": "banka(44).mp3",
      "bankaudio2": "bankb(44).mp3",
      "selection": false
    },
    {
      "id": 45,
      "img1": "assets/img45.png",
      "img2": "assets/wimg45.png",
      "blue": "assets/b(45).png",
      "gold": "assets/g(45).png",
      "bankaudio1": "banka(45).mp3",
      "bankaudio2": "bankb(45).mp3",
      "selection": false
    },
    {
      "id": 46,
      "img1": "assets/img46.png",
      "img2": "assets/wimg46.png",
      "blue": "assets/b(46).png",
      "gold": "assets/g(46).png",
      "bankaudio1": "banka(46).mp3",
      "bankaudio2": "bankb(46).mp3",
      "selection": false
    },
    {
      "id": 47,
      "img1": "assets/img47.png",
      "img2": "assets/wimg47.png",
      "blue": "assets/b(47).png",
      "gold": "assets/g(47).png",
      "bankaudio1": "banka(47).mp3",
      "bankaudio2": "bankb(47).mp3",
      "selection": false
    },
    {
      "id": 48,
      "img1": "assets/img48.png",
      "img2": "assets/wimg48.png",
      "blue": "assets/b(48).png",
      "gold": "assets/g(48).png",
      "bankaudio1": "banka(48).mp3",
      "bankaudio2": "bankb(48).mp3",
      "selection": false
    },
    {
      "id": 49,
      "img1": "assets/img49.png",
      "img2": "assets/wimg49.png",
      "blue": "assets/b(49).png",
      "gold": "assets/g(49).png",
      "bankaudio1": "banka(49).mp3",
      "bankaudio2": "bankb(49).mp3",
      "selection": false
    },
    {
      "id": 50,
      "img1": "assets/img50.png",
      "img2": "assets/wimg50.png",
      "blue": "assets/b(50).png",
      "gold": "assets/g(50).png",
      "bankaudio1": "banka(50).mp3",
      "bankaudio2": "bankb(50).mp3",
      "selection": false
    },
    {
      "id": 51,
      "img1": "assets/img51.png",
      "img2": "assets/wimg51.png",
      "blue": "assets/b(51).png",
      "gold": "assets/g(51).png",
      "bankaudio1": "banka(51).mp3",
      "bankaudio2": "bankb(51).mp3",
      "selection": false
    },
    {
      "id": 52,
      "img1": "assets/img52.png",
      "img2": "assets/wimg52.png",
      "blue": "assets/b(52).png",
      "gold": "assets/g(52).png",
      "bankaudio1": "banka(52).mp3",
      "bankaudio2": "bankb(52).mp3",
      "selection": false
    },
    {
      "id": 53,
      "img1": "assets/img53.png",
      "img2": "assets/wimg53.png",
      "blue": "assets/b(53).png",
      "gold": "assets/g(53).png",
      "bankaudio1": "banka(53).mp3",
      "bankaudio2": "bankb(53).mp3",
      "selection": false
    },
    {
      "id": 54,
      "img1": "assets/img54.png",
      "img2": "assets/wimg54.png",
      "blue": "assets/b(54).png",
      "gold": "assets/g(54).png",
      "bankaudio1": "banka(54).mp3",
      "bankaudio2": "bankb(54).mp3",
      "selection": false
    },
    {
      "id": 55,
      "img1": "assets/img55.png",
      "img2": "assets/wimg55.png",
      "blue": "assets/b(55).png",
      "gold": "assets/g(55).png",
      "bankaudio1": "banka(55).mp3",
      "bankaudio2": "bankb(55).mp3",
      "selection": false
    },
    {
      "id": 56,
      "img1": "assets/img56.png",
      "img2": "assets/wimg56.png",
      "blue": "assets/b(56).png",
      "gold": "assets/g(56).png",
      "bankaudio1": "banka(56).mp3",
      "bankaudio2": "bankb(56).mp3",
      "selection": false
    },
    {
      "id": 57,
      "img1": "assets/img57.png",
      "img2": "assets/wimg57.png",
      "blue": "assets/b(57).png",
      "gold": "assets/g(57).png",
      "bankaudio1": "banka(57).mp3",
      "bankaudio2": "bankb(57).mp3",
      "selection": false
    },
    {
      "id": 58,
      "img1": "assets/img58.png",
      "img2": "assets/wimg58.png",
      "blue": "assets/b(58).png",
      "gold": "assets/g(58).png",
      "bankaudio1": "banka(58).mp3",
      "bankaudio2": "bankb(58).mp3",
      "selection": false
    },
    {
      "id": 59,
      "img1": "assets/img59.png",
      "img2": "assets/wimg59.png",
      "blue": "assets/b(59).png",
      "gold": "assets/g(59).png",
      "bankaudio1": "banka(59).mp3",
      "bankaudio2": "bankb(59).mp3",
      "selection": false
    },
    {
      "id": 60,
      "img1": "assets/img60.png",
      "img2": "assets/wimg60.png",
      "blue": "assets/b(60).png",
      "gold": "assets/g(60).png",
      "bankaudio1": "banka(60).mp3",
      "bankaudio2": "bankb(60).mp3",
      "selection": false
    },
    {
      "id": 61,
      "img1": "assets/img61.png",
      "img2": "assets/wimg61.png",
      "blue": "assets/b(61).png",
      "gold": "assets/g(61).png",
      "bankaudio1": "banka(61).mp3",
      "bankaudio2": "bankb(61).mp3",
      "selection": false
    },
    {
      "id": 62,
      "img1": "assets/img62.png",
      "img2": "assets/wimg62.png",
      "blue": "assets/b(62).png",
      "gold": "assets/g(62).png",
      "bankaudio1": "banka(62).mp3",
      "bankaudio2": "bankb(62).mp3",
      "selection": false
    },
    {
      "id": 63,
      "img1": "assets/img63.png",
      "img2": "assets/wimg63.png",
      "blue": "assets/b(63).png",
      "gold": "assets/g(63).png",
      "bankaudio1": "banka(63).mp3",
      "bankaudio2": "bankb(63).mp3",
      "selection": false
    },
    {
      "id": 64,
      "img1": "assets/img64.png",
      "img2": "assets/wimg64.png",
      "blue": "assets/b(64).png",
      "gold": "assets/g(64).png",
      "bankaudio1": "banka(64).mp3",
      "bankaudio2": "bankb(64).mp3",
      "selection": false
    },
    {
      "id": 65,
      "img1": "assets/img65.png",
      "img2": "assets/wimg65.png",
      "blue": "assets/b(65).png",
      "gold": "assets/g(65).png",
      "bankaudio1": "banka(65).mp3",
      "bankaudio2": "bankb(65).mp3",
      "selection": false
    },
    {
      "id": 66,
      "img1": "assets/img66.png",
      "img2": "assets/wimg66.png",
      "blue": "assets/b(66).png",
      "gold": "assets/g(66).png",
      "bankaudio1": "banka(66).mp3",
      "bankaudio2": "bankb(66).mp3",
      "selection": false
    },
    {
      "id": 67,
      "img1": "assets/img67.png",
      "img2": "assets/wimg67.png",
      "blue": "assets/b(67).png",
      "gold": "assets/g(67).png",
      "bankaudio1": "banka(67).mp3",
      "bankaudio2": "bankb(67).mp3",
      "selection": false
    },
    {
      "id": 68,
      "img1": "assets/img68.png",
      "img2": "assets/wimg68.png",
      "blue": "assets/b(68).png",
      "gold": "assets/g(68).png",
      "bankaudio1": "banka(68).mp3",
      "bankaudio2": "bankb(68).mp3",
      "selection": false
    },
    {
      "id": 69,
      "img1": "assets/img69.png",
      "img2": "assets/wimg69.png",
      "blue": "assets/b(69).png",
      "gold": "assets/g(69).png",
      "bankaudio1": "banka(69).mp3",
      "bankaudio2": "bankb(69).mp3",
      "selection": false
    },
    {
      "id": 70,
      "img1": "assets/img70.png",
      "img2": "assets/wimg70.png",
      "blue": "assets/b(70).png",
      "gold": "assets/g(70).png",
      "bankaudio1": "banka(70).mp3",
      "bankaudio2": "bankb(70).mp3",
      "selection": false
    },
    {
      "id": 71,
      "img1": "assets/img71.png",
      "img2": "assets/wimg71.png",
      "blue": "assets/b(71).png",
      "gold": "assets/g(71).png",
      "bankaudio1": "banka(71).mp3",
      "bankaudio2": "bankb(71).mp3",
      "selection": false
    },
    {
      "id": 72,
      "img1": "assets/img72.png",
      "img2": "assets/wimg72.png",
      "blue": "assets/b(72).png",
      "gold": "assets/g(72).png",
      "bankaudio1": "banka(72).mp3",
      "bankaudio2": "bankb(72).mp3",
      "selection": false
    },
    {
      "id": 73,
      "img1": "assets/img73.png",
      "img2": "assets/wimg73.png",
      "blue": "assets/b(73).png",
      "gold": "assets/g(73).png",
      "bankaudio1": "banka(73).mp3",
      "bankaudio2": "bankb(73).mp3",
      "selection": false
    },
    {
      "id": 74,
      "img1": "assets/img74.png",
      "img2": "assets/wimg74.png",
      "blue": "assets/b(74).png",
      "gold": "assets/g(74).png",
      "bankaudio1": "banka(74).mp3",
      "bankaudio2": "bankb(74).mp3",
      "selection": false
    },
    {
      "id": 75,
      "img1": "assets/img75.png",
      "img2": "assets/wimg75.png",
      "blue": "assets/b(75).png",
      "gold": "assets/g(75).png",
      "bankaudio1": "banka(75).mp3",
      "bankaudio2": "bankb(75).mp3",
      "selection": false
    },
    {
      "id": 76,
      "img1": "assets/img76.png",
      "img2": "assets/wimg76.png",
      "blue": "assets/b(76).png",
      "gold": "assets/g(76).png",
      "bankaudio1": "banka(76).mp3",
      "bankaudio2": "bankb(76).mp3",
      "selection": false
    },
    {
      "id": 77,
      "img1": "assets/img77.png",
      "img2": "assets/wimg77.png",
      "blue": "assets/b(77).png",
      "gold": "assets/g(77).png",
      "bankaudio1": "banka(77).mp3",
      "bankaudio2": "bankb(77).mp3",
      "selection": false
    },
    {
      "id": 78,
      "img1": "assets/img78.png",
      "img2": "assets/wimg78.png",
      "blue": "assets/b(78).png",
      "gold": "assets/g(78).png",
      "bankaudio1": "banka(78).mp3",
      "bankaudio2": "bankb(78).mp3",
      "selection": false
    },
    {
      "id": 79,
      "img1": "assets/img79.png",
      "img2": "assets/wimg79.png",
      "blue": "assets/b(79).png",
      "gold": "assets/g(79).png",
      "bankaudio1": "banka(79).mp3",
      "bankaudio2": "bankb(79).mp3",
      "selection": false
    },
    {
      "id": 80,
      "img1": "assets/img80.png",
      "img2": "assets/wimg80.png",
      "blue": "assets/b(80).png",
      "gold": "assets/g(80).png",
      "bankaudio1": "banka(80).mp3",
      "bankaudio2": "bankb(80).mp3",
      "selection": false
    },
    {
      "id": 81,
      "img1": "assets/img81.png",
      "img2": "assets/wimg81.png",
      "blue": "assets/b(81).png",
      "gold": "assets/g(81).png",
      "bankaudio1": "banka(81).mp3",
      "bankaudio2": "bankb(81).mp3",
      "selection": false
    },
    {
      "id": 82,
      "img1": "assets/img82.png",
      "img2": "assets/wimg82.png",
      "blue": "assets/b(82).png",
      "gold": "assets/g(82).png",
      "bankaudio1": "banka(82).mp3",
      "bankaudio2": "bankb(82).mp3",
      "selection": false
    },
    {
      "id": 83,
      "img1": "assets/img83.png",
      "img2": "assets/wimg83.png",
      "blue": "assets/b(83).png",
      "gold": "assets/g(83).png",
      "bankaudio1": "banka(83).mp3",
      "bankaudio2": "bankb(83).mp3",
      "selection": false
    },
    {
      "id": 84,
      "img1": "assets/img84.png",
      "img2": "assets/wimg84.png",
      "blue": "assets/b(84).png",
      "gold": "assets/g(84).png",
      "bankaudio1": "banka(84).mp3",
      "bankaudio2": "bankb(84).mp3",
      "selection": false
    },
    {
      "id": 85,
      "img1": "assets/img85.png",
      "img2": "assets/wimg85.png",
      "blue": "assets/b(85).png",
      "gold": "assets/g(85).png",
      "bankaudio1": "banka(85).mp3",
      "bankaudio2": "bankb(85).mp3",
      "selection": false
    },
    {
      "id": 86,
      "img1": "assets/img86.png",
      "img2": "assets/wimg86.png",
      "blue": "assets/b(86).png",
      "gold": "assets/g(86).png",
      "bankaudio1": "banka(86).mp3",
      "bankaudio2": "bankb(86).mp3",
      "selection": false
    },
    {
      "id": 87,
      "img1": "assets/img87.png",
      "img2": "assets/wimg87.png",
      "blue": "assets/b(87).png",
      "gold": "assets/g(87).png",
      "bankaudio1": "banka(87).mp3",
      "bankaudio2": "bankb(87).mp3",
      "selection": false
    },
    {
      "id": 88,
      "img1": "assets/img88.png",
      "img2": "assets/wimg88.png",
      "blue": "assets/b(88).png",
      "gold": "assets/g(88).png",
      "bankaudio1": "banka(88).mp3",
      "bankaudio2": "bankb(88).mp3",
      "selection": false
    },
    {
      "id": 89,
      "img1": "assets/img89.png",
      "img2": "assets/wimg89.png",
      "blue": "assets/b(89).png",
      "gold": "assets/g(89).png",
      "bankaudio1": "banka(89).mp3",
      "bankaudio2": "bankb(89).mp3",
      "selection": false
    },
    {
      "id": 90,
      "img1": "assets/img90.png",
      "img2": "assets/wimg90.png",
      "blue": "assets/b(90).png",
      "gold": "assets/g(90).png",
      "bankaudio1": "banka(90).mp3",
      "bankaudio2": "bankb(90).mp3",
      "selection": false
    },
    {
      "id": 91,
      "img1": "assets/img91.png",
      "img2": "assets/wimg91.png",
      "blue": "assets/b(91).png",
      "gold": "assets/g(91).png",
      "bankaudio1": "banka(91).mp3",
      "bankaudio2": "bankb(91).mp3",
      "selection": false
    },
    {
      "id": 92,
      "img1": "assets/img92.png",
      "img2": "assets/wimg92.png",
      "blue": "assets/b(92).png",
      "gold": "assets/g(92).png",
      "bankaudio1": "banka(92).mp3",
      "bankaudio2": "bankb(92).mp3",
      "selection": false
    },
    {
      "id": 93,
      "img1": "assets/img93.png",
      "img2": "assets/wimg93.png",
      "blue": "assets/b(93).png",
      "gold": "assets/g(93).png",
      "bankaudio1": "banka(93).mp3",
      "bankaudio2": "bankb(93).mp3",
      "selection": false
    },
    {
      "id": 94,
      "img1": "assets/img94.png",
      "img2": "assets/wimg94.png",
      "blue": "assets/b(94).png",
      "gold": "assets/g(94).png",
      "bankaudio1": "banka(94).mp3",
      "bankaudio2": "bankb(94).mp3",
      "selection": false
    },
    {
      "id": 95,
      "img1": "assets/img95.png",
      "img2": "assets/wimg95.png",
      "blue": "assets/b(95).png",
      "gold": "assets/g(95).png",
      "bankaudio1": "banka(95).mp3",
      "bankaudio2": "bankb(95).mp3",
      "selection": false
    },
    {
      "id": 96,
      "img1": "assets/img96.png",
      "img2": "assets/wimg96.png",
      "blue": "assets/b(96).png",
      "gold": "assets/g(96).png",
      "bankaudio1": "banka(96).mp3",
      "bankaudio2": "bankb(96).mp3",
      "selection": false
    },
    {
      "id": 97,
      "img1": "assets/img97.png",
      "img2": "assets/wimg97.png",
      "blue": "assets/b(97).png",
      "gold": "assets/g(97).png",
      "bankaudio1": "banka(97).mp3",
      "bankaudio2": "bankb(97).mp3",
      "selection": false
    },
    {
      "id": 98,
      "img1": "assets/img98.png",
      "img2": "assets/wimg98.png",
      "blue": "assets/b(98).png",
      "gold": "assets/g(98).png",
      "bankaudio1": "banka(98).mp3",
      "bankaudio2": "bankb(98).mp3",
      "selection": false
    },
    {
      "id": 99,
      "img1": "assets/img99.png",
      "img2": "assets/wimg99.png",
      "blue": "assets/b(99).png",
      "gold": "assets/g(99).png",
      "bankaudio1": "banka(99).mp3",
      "bankaudio2": "bankb(99).mp3",
      "selection": false
    },
    {
      "id": 100,
      "img1": "assets/img100.png",
      "img2": "assets/wimg100.png",
      "blue": "assets/b(100).png",
      "gold": "assets/g(100).png",
      "bankaudio1": "banka(100).mp3",
      "bankaudio2": "bankb(100).mp3",
      "selection": false
    },
  ];

  //AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  String audioasset = "rac.mp3";

  static AudioPlayer player = AudioPlayer();
  static AudioCache audioCache = AudioCache();

  // var dropdownvalue = '1.0';
  String? MySharedDropDownValue;
  bool backgroundcolor = false;
  bool varr = false;
  List<bool> newa = [];
  List<bool> newa2 = [];

  // List of items in our dropdown menu
  var items = [
    '0.5',
    '0.55',
    "0.65",
    "0.7",
    "0.75",
    "0.8",
    "0.85",
    "0.9",
    "0.95",
    "1.0",
    "1.05",
    "1.1",
    "1.15",
    "1.2",
    "1.25",
    "1.3",
    "1.35",
    "1.4",
    "1.45",
    "1.5",
    "1.55",
    "1.6",
    "1.65",
    "1.7",
    "1.75",
    "1.8",
    "1.85",
    "1.9",
    "1.95",
    "2.0"
  ];

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    getData();
  }
  getData() async
  {
    final prefs = await SharedPreferences.getInstance();
    double? decimals = prefs.getDouble('dropdownvalue');
    if (decimals==null)
  {
    prefs.setDouble('dropdownvalue', 1.0);
  }
    MySharedDropDownValue = decimals.toString();
    setState(() {

    });
  }

  bool ismusic = true;
  bool bank = true;
  var arguments = Get.arguments;
  var textb = "Bank B";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: isTheme ? Colors.black : Colors.white,
          appBar: AppBar(
            actions: [
              DropdownButton(
                value: MySharedDropDownValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: isTheme
                          ? Text(items, style: TextStyle(color: Colors.green))
                          : Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                   MySharedDropDownValue = newValue!;
                  });
                },
              ),
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'PMØS',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '_100™️',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    var bank = false;
                    var iconposition =
                        MediaQuery.of(context).size.width * 0.010;
                    var icon = Icons.flag;
                    var text = 'Bank A';
                    var color = Colors.grey;

                    Get.to(BankBClass(),
                        arguments: [bank, iconposition, icon, text, color]);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.250,
                        height: MediaQuery.of(context).size.height * 0.050,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue),
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width * 0.010,
                          top: MediaQuery.of(context).size.height * 0.014,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.050,
                            height: MediaQuery.of(context).size.height * 0.010,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.done,
                            ),
                          )),
                      Positioned(
                          left: MediaQuery.of(context).size.width * 0.080,
                          top: MediaQuery.of(context).size.height * 0.015,
                          child: Center(
                            child: Text(
                              textb,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),

                // LiteRollingSwitch(
                //   value: bank,
                //   width: MediaQuery.of(context).size.width * 0.250,
                //   textOn: 'BankB',
                //   textOff: 'BankA',
                //   colorOn: Colors.cyan,
                //   colorOff: Colors.grey,
                //   // iconOn: Icons.dark_mode,
                //   // iconOff: Icons.light_mode,

                //   animationDuration: Duration(milliseconds: 800),
                //   onChanged: (bool state) {
                //     print('turned ${(state) ? 'BankB' : 'BankA'}');

                //       bank = state;
                //       Get.to(BankBClass());

                //   },
                //   onTap: () {},
                //   onDoubleTap: () {},
                //   onSwipe: () {},
                // ),

                GestureDetector(
                  onTap: () {
                    if (textb == "Bank B") {
                      Get.to(BankA2Class());
                    } else
                      Get.to(ContainersClass(), arguments: arguments);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.230,
                        height: MediaQuery.of(context).size.height * 0.050,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black),
                      ),
                      Positioned(
                          right: MediaQuery.of(context).size.width * 0.025,
                          top: MediaQuery.of(context).size.height * 0.014,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.050,
                            height: MediaQuery.of(context).size.height * 0.010,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.dark_mode,
                            ),
                          )),
                      Positioned(
                          left: MediaQuery.of(context).size.width * 0.030,
                          top: MediaQuery.of(context).size.height * 0.015,
                          child: Center(
                            child: Text(
                              "Mode",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),

                // LiteRollingSwitch(
                //   value: true,
                //   width: MediaQuery.of(context).size.width * 0.250,
                //   textOn: 'Mode',
                //   textOff: 'Mode',
                //   colorOn: Colors.cyan,
                //   colorOff: Colors.grey,
                //   iconOn: Icons.dark_mode,
                //   iconOff: Icons.light_mode,
                //   animationDuration: Duration(milliseconds: 800),
                //   onChanged: (bool state) {
                //     print('turned ${(state) ? 'Bank B' : 'Bank A'}');

                //     isTheme = state;
                //     Get.to(ContainersClass());
                //   },
                //   onTap: () {},
                //   onDoubleTap: () {},
                //   onSwipe: () {},
                // ),
              ],
            ),
            leading: isTheme
                ? Image.asset(
                    'assets/b.jpeg',
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    'assets/a.jpeg',
                    fit: BoxFit.contain,
                  ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
                ),
                Container(
                    padding: EdgeInsets.all(12.0),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemCount: data2.length,
                        itemBuilder: (BuildContext ctx, index) {
                          for (int i = 0; i < data2.length; i++) {
                            newa.add(false);
                            newa2.add(false);
                          }

                          print('we are in bank b');
                          return GestureDetector(
                              onTap: () {
                                print('data2   $data2');

                                newa.clear();
                                newa2.clear();

                                for (int i = 0; i < data2.length; i++) {
                                  newa.add(false);
                                  newa2.add(false);
                                }

                                //setState(() {});

                                print("-----------");
                                print(date.millisecond);
                                print("-----------");
                                data2[index]['selection'] =
                                    !data2[index]['selection'];
                                if (data2[index]['selection']) {
                                  if (bank == false) {
                                    print('bank A ki Audio....');

                                    newa[index] = data2[index]['selection'];

                                    print(newa[index]);
                                    print(newa);
                                    print(newa.length);
                                    newa.removeWhere((element) => false);

                                    newa2[index] = data2[index]['selection'];

                                    print(newa2[index]);
                                    print(newa2);
                                    print(newa2.length);
                                    newa2.removeWhere((element) => false);

                                    setState(() {});

                                    // player.pause();
                                    var path =
                                        'assets/' + data2[index]['bankaudio1'];
                                    print(path);

                                    player.play(AssetSource(
                                        data2[index]['bankaudio1']));

                                    var speedofsong =
                                        double.parse(MySharedDropDownValue!);
                                    player.setPlaybackRate(speedofsong);

                                    setState(() {});
                                    Timer(Duration(milliseconds: 400), Dummy);

                                    print('play');
                                  } else {
                                    print('bank B ki Audio....');

                                    newa[index] = data2[index]['selection'];

                                    print(newa[index]);
                                    print(newa);
                                    print(newa.length);
                                    newa.removeWhere((element) => false);

                                    newa2[index] = data2[index]['selection'];

                                    print(newa2[index]);
                                    print(newa2);
                                    print(newa2.length);
                                    newa2.removeWhere((element) => false);

                                    setState(() {});

                                    // player.pause();
                                    var path =
                                        'assets/' + data2[index]['bankaudio2'];
                                    print(path);

                                    player.play(AssetSource(
                                        data2[index]['bankaudio2']));

                                    var speedofsong =
                                        double.parse(MySharedDropDownValue!);
                                    player.setPlaybackRate(speedofsong);

                                    setState(() {});
                                    Timer(Duration(milliseconds: 600), Dummy);

                                    print('play');
                                  }
                                } else if (!data2[index]['selection2']) {
                                  newa[index] = false;
                                  newa2[index] = false;

                                  player.dispose();

                                  // dispose();
                                }
                              },
                              child: Stack(
                                children: [
                                  (bank == false)
                                      ? Container(
                                          child: Image.asset(
                                            data2[index]['img1']
                                                .toString()
                                                .trim(),
                                          ),
                                        )
                                      : Container(
                                          child: Image.asset(
                                          data2[index]['img1']
                                              .toString()
                                              .trim(),
                                        )),

                                  // if (newa[index]) ...[
                                  //   Image.asset(
                                  //     data2[index]['blue'].toString().trim(),
                                  //   )
                                  // ],

                                  if (newa2[index] && bank == true) ...[
                                    Image.asset(
                                      data2[index]['gold'].toString().trim(),
                                    )
                                  ]

                                  // newa[index]
                                  //     ? Image.asset(
                                  //         data[index]['blue'].toString().trim(),
                                  //       )
                                  //     : Container(),

                                  //     ismusic ?  Container(
                                  //   child: Image.asset(
                                  //     data[index]['img2'].toString().trim(),
                                  //   ),
                                  // ):Container()
                                ],
                              ));
                        }
                        // return GestureDetector(
                        //     onTap: () async {
                        //       newa.clear();

                        //       for (int i = 0; i < data.length; i++) {
                        //         newa.add(false);
                        //       }
                        //       print(newa);
                        //       print('we are in bank a');
                        //       setState(() {});
                        //       print("-----------");
                        //       print(date.millisecond);
                        //       print("-----------");
                        //       data[index]['selection'] =
                        //           !data[index]['selection'];

                        //       if (data[index]['selection']) {

                        //         if (bank) {
                        //             print('bank B ki Audio....');

                        //             newa[index] = data[index]['selection'];

                        //             print(newa[index]);
                        //             print(newa);
                        //             print(newa.length);
                        //             newa.removeWhere((element) => false);

                        //             setState(() {});

                        //             // player.pause();
                        //             var path =
                        //                 'assets/' + data[index]['bankaudio2'];
                        //             print(path);

                        //             player.play(AssetSource(
                        //                 data[index]['bankaudio2']));

                        //             var speedofsong =
                        //                 double.parse(dropdownvalue);
                        //             player.setPlaybackRate(speedofsong);

                        //             print('play');

                        //           }

                        //           else{

                        //             print('bank A ki Audio....');

                        //             newa[index] = data[index]['selection'];

                        //             print(newa[index]);
                        //             print(newa);
                        //             print(newa.length);
                        //             newa.removeWhere((element) => false);

                        //             setState(() {});

                        //             // player.pause();
                        //             var path =
                        //                 'assets/' + data[index]['bankaudio1'];
                        //             print(path);

                        //             player.play(AssetSource(
                        //                 data[index]['bankaudio1']));

                        //             var speedofsong =
                        //                 double.parse(dropdownvalue);
                        //             player.setPlaybackRate(speedofsong);

                        //             print('play');

                        //           }

                        //         // //varr = !varr;

                        //         // newa[index] = data[index]['selection'];

                        //         // print('numberrr ${data[index]['selection']}');

                        //         // print(newa[index]);
                        //         // print(newa);
                        //         // print(newa.length);

                        //         // newa.removeWhere((element) => false);
                        //         // var path =
                        //         //     'assets/' + data[index]['bankaudio1'];
                        //         // print(path);

                        //         // //var speedofsong = double.parse(dropdownvalue);
                        //         // // audioPlayer.setPlaybackRate(speedofsong);

                        //         // // audioPlayer.open(Audio(path),
                        //         // //     playSpeed: speedofsong);

                        //         // // audioPlayer.play();

                        //         // // print(path);

                        //         // // setState(() {});

                        //         // // player.pause();

                        //         // player.play(
                        //         //   AssetSource(
                        //         //     data[index]['bankaudio1'],
                        //         //   ),
                        //         // );

                        //         // var speedofsong = double.parse(dropdownvalue);
                        //         // player.setPlaybackRate(speedofsong);

                        //         // ismusic = true;
                        //         // Timer(Duration(seconds: 3),
                        //         //     () => newa[index] = false);

                        //         // setState(() {});

                        //         // print('play');
                        //       } else if (!data[index]['selection']) {
                        //         newa[index] = false;

                        //         // print(data[index]['id']);
                        //         // print(data[index]['audio']);
                        //         // print(data[index]['selection']);
                        //         // print(data[index]['position']);

                        //         print('pause');
                        //         player.dispose();

                        //         // ispose();
                        //       }
                        //     },
                        //     child: Stack(
                        //       children: [
                        //         Container(
                        //           child: Image.asset(
                        //             data[index]['img2'].toString().trim(),
                        //           ),
                        //         ),

                        //         if (newa[index]) ...[
                        //           Image.asset(
                        //             data[index]['blue'].toString().trim(),
                        //           )
                        //         ] else if (ismusic) ...[
                        //           Container(
                        //             child: Image.asset(
                        //               data[index]['img2'].toString().trim(),
                        //             ),
                        //           ),
                        //         ],

                        //         // newa[index]
                        //         //     ? Image.asset(
                        //         //         data[index]['blue'].toString().trim(),
                        //         //       )
                        //         //     : Container(),

                        //         //     ismusic ?  Container(
                        //         //   child: Image.asset(
                        //         //     data[index]['img2'].toString().trim(),
                        //         //   ),
                        //         // ):Container()
                        //       ],
                        //     ));

                        ))
              ],
            ),
          )),
    );
  }

  Dummy() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('dropdownvalue', double.parse(MySharedDropDownValue!) );

    Get.offAll(BankB2Class(), arguments: arguments);
  }
}
