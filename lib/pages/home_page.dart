import 'package:bukos_flutter/models/city.dart';
import 'package:bukos_flutter/models/tips.dart';
import 'package:bukos_flutter/theme.dart';
import 'package:bukos_flutter/widgets/bottom_navbar_item.dart';
import 'package:bukos_flutter/widgets/city_card.dart';
import 'package:bukos_flutter/widgets/space_card.dart';
import 'package:bukos_flutter/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/space.dart';
import '../providers/space_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(height: edge),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Find your dream house',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Popular Cities',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 24,
                      ),
                      CityCard(City(
                        1,
                        'Jakarta',
                        'assets/city1.png',
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                        2,
                        'Surabaya',
                        'assets/city2.png',
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                        3,
                        'Bandung',
                        'assets/city3.png',
                        true,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                        4,
                        'Bali',
                        'assets/city1.png',
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                        5,
                        'Palembang',
                        'assets/city4.png',
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                        6,
                        'Aceh',
                        'assets/city5.png',
                        true,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                        7,
                        'Bogor',
                        'assets/city6.png',
                      )),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Recommended Space',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Tips and Guidance',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                  children: [
                    TipsCard(Tips(
                        1, 'City Guidelines', 'assets/tips1.png', '20 Apr')),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(Tips(
                        2, 'Jakarta Fairship', 'assets/tips2.png', '11 Dec')),
                  ],
                ),
              ),
              SizedBox(
                height: 75 + edge,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BottomNavbarItem(
            'assets/icon_home.png',
            true,
          ),
          BottomNavbarItem(
            'assets/icon_email.png',
            false,
          ),
          BottomNavbarItem(
            'assets/icon_card.png',
            false,
          ),
          BottomNavbarItem(
            'assets/icon_love.png',
            false,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
