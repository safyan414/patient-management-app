import 'package:flutter/cupertino.dart';

class Responsive{
  static bool isMobile(BuildContext context)=>
      MediaQuery.of(context).size.width <370;
  static bool isTablet(BuildContext context)=>
      MediaQuery.of(context).size.width <650 &&
          MediaQuery.of(context).size.width >=370;

  static bool isDesktop(BuildContext context)=>
      MediaQuery.of(context).size.width >=650;
}