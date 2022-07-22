import 'dart:async';

import 'package:bukos_flutter/pages/error_page.dart';
import 'package:bukos_flutter/widgets/facility_item.dart';
import 'package:bukos_flutter/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

import '../models/space.dart';
import '../theme.dart';

// const String _url = 'https://goo.gl/maps/Sisc4qxrYz5tY2A36';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    _launchURL(String _url) async {
      if (!await launch(_url)) {
        !await launch(_url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Do you want to call the boarding house owner?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Call'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchURL('tel:${widget.space.phone ?? null}');
                  },
                ),
              ],
            );
          });
    }

    ;

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.space.imageUrl ?? '',
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(height: 328),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name ?? '',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' / month',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index,
                                      widget.space.rating ?? 0,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        // NOTE: Main Facilities
                        Padding(
                          padding: EdgeInsets.only(
                            left: edge,
                          ),
                          child: Text(
                            'Main Facilities',
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                'kitchen',
                                'assets/icon_kitchen.png',
                                widget.space.numberOfKitchens ?? 0,
                              ),
                              FacilityItem(
                                'bedroom',
                                'assets/icon_bedroom.png',
                                widget.space.numberOfBedrooms ?? 0,
                              ),
                              FacilityItem(
                                'cupboard',
                                'assets/icon_cupboard.png',
                                widget.space.numberOfCupboards ?? 0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        // NOTE: Photo
                        Padding(
                          padding: EdgeInsets.only(
                            left: edge,
                          ),
                          child: Text(
                            'Photos',
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos!.map((item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                            // [
                            //   SizedBox(width: 24),
                            //   Image.asset(
                            //     'assets/photo1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/photo2.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/photo3.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/photo1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/photo2.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/photo3.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 24),
                            // ]
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // NOTE:
                  Padding(
                    padding: EdgeInsets.only(
                      left: edge,
                    ),
                    child: Text(
                      'Location',
                      style: regularTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: edge,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.space.address}\n${widget.space.city}',
                          style: greyTextStyle,
                        ),
                        InkWell(
                          onTap: () {
                            // _launchURL('https://goo.gl/maps/Sisc4qxrYz5tY2A36');
                            _launchURL(widget.space.mapUrl ?? "");
                          },
                          child: Image.asset(
                            'assets/btn_map.png',
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: edge,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width - (edge * 2),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          )),
                      onPressed: () {
                        showConfirmation();
                      },
                      child: Text(
                        'Book Now',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        isClicked
                            ? 'assets/btn_wishlist_filled.png'
                            : 'assets/btn_wishlist.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
