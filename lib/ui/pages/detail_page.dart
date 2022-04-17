import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/costom_bottom.dart';
import 'package:airplane/ui/widgets/interests_item.dart';
import 'package:airplane/ui/widgets/photos_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 330,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              destination.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget costumeShadow() {
      return Container(
        height: 94,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            // NOTE : EMBLEM
            Container(
              height: 24,
              width: 98,
              margin: const EdgeInsets.only(
                top: 70,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),
            // NOTE : TITLE
            Container(
              margin: const EdgeInsets.only(top: 106),
              child: Row(
                children: [
                  // NOTE : NAME
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destination.city,
                          style: whiteStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // NOTE : RATING
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: whiteStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      )
                    ],
                  )
                ],
              ),
            ),
            // NOTE : DESCRIPTION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : ABOUT
                  Text(
                    'About',
                    style: blackStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackStyle.copyWith(height: 2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Photos',
                    style: blackStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: const [
                      PhotosItem(
                        imageUrl: 'assets/image_photos1.png',
                      ),
                      PhotosItem(
                        imageUrl: 'assets/image_photos2.png',
                      ),
                      PhotosItem(
                        imageUrl: 'assets/image_photos3.png',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // NOTE : INTERESTS
                  Text(
                    'Interests',
                    style: blackStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      InterestsItem(
                        text: 'Kids Park',
                      ),
                      InterestsItem(
                        text: 'City Museum',
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      InterestsItem(
                        text: 'Honor Bridge',
                      ),
                      InterestsItem(
                        text: 'Central Mall',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // NOTE : PRICE END BOOK BUTTON
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(destination.price),
                          style: purpelStyle.copyWith(
                              fontSize: 18, fontWeight: semibold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'per orang',
                          style: blackStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  CustomBottom(
                    title: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChooseSeatPage(destination)));
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            costumeShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
