import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/costom_bottom.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            'Select Your\nFavorite Seat',
            style: blackStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
        ),
      );
    }

    Widget setStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            // NOTE : AVAILABLE
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_available.png'))),
                ),
                Text(
                  'Available',
                  style: blackStyle,
                ),
              ],
            ),
            // NOTE : SELECTED
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  margin: const EdgeInsets.only(left: 15, right: 6),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_selected.png'))),
                ),
                Text(
                  'Selected',
                  style: blackStyle,
                ),
              ],
            ),
            // NOTE : UNAVAILABLE
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  margin: const EdgeInsets.only(left: 10, right: 6),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_unavailable.png'))),
                ),
                Text(
                  'Unavailable',
                  style: blackStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget selectedSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            // NOTE : SEAT INDICATOR
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      // height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                // NOTE : SEAT 1
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      const SeatItem(
                        id: 'B1',
                        isAvailable: false,
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C1',
                      ),
                      const SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                // NOTE : SEAT 2
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A2',
                      ),
                      const SeatItem(
                        id: 'B2',
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C2',
                      ),
                      const SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                // NOTE : SEAT 3
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A3',
                      ),
                      const SeatItem(
                        id: 'B3',
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C3',
                      ),
                      const SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                // NOTE : SEAT 4
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A4',
                      ),
                      const SeatItem(
                        id: 'B4',
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C4',
                      ),
                      const SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                // NOTE : SEAT 5
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A5',
                      ),
                      const SeatItem(
                        id: 'B5',
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C5',
                      ),
                      const SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your seat',
                          style: greyStyle.copyWith(fontWeight: light),
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: blackStyle.copyWith(
                          fontWeight: semibold,
                          color: kPrimeryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total',
                          style: greyStyle.copyWith(fontWeight: light),
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: purpelStyle.copyWith(
                            fontWeight: semibold, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    Widget checkOutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomBottom(
            margin: const EdgeInsets.only(bottom: 20),
            title: 'Continue to Checkout',
            onPressed: () {
              int price = destination.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckOutPage(
                    TransactionModel(
                      destination: destination,
                      amountOfTravel: state.length,
                      selectedSeat: state.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultpadding),
        children: [
          title(),
          setStatus(),
          selectedSeat(),
          checkOutButton(),
        ],
      ),
    );
  }
}
