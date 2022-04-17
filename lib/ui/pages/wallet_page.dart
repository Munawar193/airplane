import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget card() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(29, 25, 21, 25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/card.png'),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BALANCE',
                                    style: whiteStyle.copyWith(),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                    ).format(state.user.balance),
                                    style: whiteStyle.copyWith(
                                      fontSize: 20,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/pay-icon.png',
                              width: 45,
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CARD HOLDERNAME',
                                  style: whiteStyle.copyWith(),
                                ),
                                Text(
                                  state.user.name,
                                  style: whiteStyle.copyWith(
                                    fontSize: 22,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EXPIRY DATE',
                                  style: whiteStyle.copyWith(),
                                ),
                                Text(
                                  '03-01-2023',
                                  style: whiteStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      );
    }

    Widget operation() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
        padding: const EdgeInsets.only(left: 20, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Operation',
              style: blackStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: kPrimeryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: kPrimeryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: kPrimeryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget operationCard() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 25),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: const [
              CardOperation(
                imageUrl: 'assets/money-transfer.png',
                text: 'Money Transfer',
                cardColor: kWhiteColor,
                textColor: kPrimeryColor,
                iconSize: 65,
              ),
              CardOperation(
                imageUrl: 'assets/insights-tracking.png',
                text: 'Insights Tracking',
                cardColor: kWhiteColor,
                textColor: kPrimeryColor,
              ),
              CardOperation(
                imageUrl: 'assets/bank-withdraw.png',
                text: 'Bank Withdraw',
                cardColor: kWhiteColor,
                textColor: kPrimeryColor,
                iconSize: 50,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            card(),
            operation(),
            operationCard(),
          ],
        ),
      ),
    );
  }
}

class CardOperation extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Color cardColor;
  final Color textColor;
  final double iconSize;

  const CardOperation({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.cardColor,
    required this.textColor,
    this.iconSize = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: iconSize,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
