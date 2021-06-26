import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../UI widgets/gradient-bg.dart';
import 'menu-suggest.dart';
import 'last-week.dart';

class NextWeekPage extends StatelessWidget {
  final Map<String, String> _icons = {
    'Porridge': 'assets/icon/porridge.svg',
    'Milk': 'assets/icon/milk.svg',
    'Meat': 'assets/icon/beef.svg',
    'Fish': 'assets/icon/vitamin_d.svg',
    'Egg': 'assets/icon/egg.svg',
    'Green Vegets': 'assets/icon/salad.svg',
    'Red Vegets': 'assets/icon/carrot.svg',
    'Citrus fruit': 'assets/icon/orange.svg',
  };

  Widget _buildFoodDetailIcon(String name) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            _icons[name],
            width: 40,
            height: 40,
          ),
          Text(
            ' 999g',
            style: TextStyle(
              fontSize: 11.0,
              color: Color.fromRGBO(0, 0, 0, .5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealSuggest(BuildContext context, String mealName) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 96,
            alignment: Alignment.center,
            child: Text(
              mealName,
              style: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(0, 0, 0, .5),
              ),
            ),
          ),
          _buildFoodDetailIcon('Porridge'),
          _buildFoodDetailIcon('Meat'),
          _buildFoodDetailIcon('Milk'),
        ],
      ),
    );
  }

  Widget _buildDateProfile(BuildContext context, int date) {
    return Container(
      child: GlassContainer(
        height: 130,
        width: 370,
        color: Colors.white.withOpacity(0.8),
        blur: 12,
        borderColor: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(15.0),
        borderWidth: 1.0,
        elevation: 10.0,
        child: Column(
          children: [
            Container(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: HexColor('#85B4F2'),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      date.toString(),
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  Text(
                    ' days next',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(0, 0, 0, .5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '20/5/2021',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            Divider(
              height: .5,
              thickness: .5,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFoodDetailIcon('Porridge'),
                  _buildFoodDetailIcon('Meat'),
                  _buildFoodDetailIcon('Fish'),
                  _buildFoodDetailIcon('Green Vegets'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFoodDetailIcon('Egg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastWeekButton(BuildContext context, double deviceWidth) {
    return GestureDetector(
      child: Container(
        width: deviceWidth / 2 - 1,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        child: Center(
          child: Text(
            'Last Week',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LastWeekPage(),
          ),
        );
      },
    );
  }

  Widget _buildNextWeekButton(BuildContext context, double deviceWidth) {
    return GestureDetector(
      child: Container(
        width: deviceWidth / 2,
        height: 75,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).cardColor,
              HexColor('#85B4F2'),
              HexColor('#85B4F2'),
            ],
            stops: [0.3, 0.8, 1],
          ),
          border: Border.all(
            width: 1.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        child: Center(
          child: Text(
            'Next Week',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildBody(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeigth = MediaQuery.of(context).size.height;

    final List<Widget> _widgets = [
      SizedBox(height: 30),
      Container(
        child: GlassContainer(
          height: 130,
          width: 370,
          color: Colors.white.withOpacity(0.8),
          blur: 12,
          borderColor: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(15.0),
          borderWidth: 1.0,
          elevation: 10.0,
          child: Column(
            children: [
              Container(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total for the next ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(0, 0, 0, .5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: HexColor('#85B4F2'),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '7',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    Text(
                      ' days from Sunday',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(0, 0, 0, .5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFoodDetailIcon('Porridge'),
                    _buildFoodDetailIcon('Meat'),
                    _buildFoodDetailIcon('Fish'),
                    _buildFoodDetailIcon('Red Vegets'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildFoodDetailIcon('Citrus fruit'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 30),
      Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.topCenter,
              height: 120,
              width: 370,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor('#FFDA8F'),
                      HexColor('#FC9495'),
                      HexColor('#BD88F2'),
                      HexColor('#85B4F2'),
                      HexColor('#91F2E9'),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32.0))),
              child: Container(
                alignment: Alignment.center,
                width: 370,
                height: 70,
                child: Text(
                  'Tomorrow',
                  style: TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 30.0,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 70),
              Container(
                child: GlassContainer(
                  height: 200,
                  width: 370,
                  color: Colors.white.withOpacity(0.8),
                  blur: 12,
                  borderColor: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(32.0),
                  borderWidth: 1.0,
                  elevation: 10.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMealSuggest(context, 'Breakfast'),
                      SizedBox(height: 15),
                      _buildMealSuggest(context, 'Noon'),
                      SizedBox(height: 15),
                      _buildMealSuggest(context, 'Dinner'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 30),
      _buildDateProfile(context, 2),
      SizedBox(height: 30),
      SizedBox(height: 95),
    ];
    return Container(
      child: GlassContainer(
        height: deviceHeigth,
        width: deviceWidth,
        color: Colors.white.withOpacity(.3),
        blur: 12,
        borderColor: Colors.white,
        borderWidth: 0,
        elevation: 10.0,
        child: Stack(
          children: [
            ListView(
              children: _widgets,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 75,
                child: Row(
                  children: [
                    _buildLastWeekButton(context, deviceWidth),
                    _buildNextWeekButton(context, deviceWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final PreferredSize _appBar = PreferredSize(
    preferredSize: Size.fromHeight(65),
    child: AppBar(
      centerTitle: true,
      title: Container(
        child: Text(
          'Next Week Menu',
          style: TextStyle(
            fontFamily: 'Dosis',
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: HexColor('#bd88f2'),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: HexColor('#bd88f2'),
        size: 40,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      _buildBody(context),
      context,
      _appBar,
      null,
    );
  }
}
