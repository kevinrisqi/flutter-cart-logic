// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_interview_test/providers/checkout_provider.dart';
import 'package:flutter_interview_test/theme.dart';
import 'package:flutter_interview_test/widgets/history_card.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: blueColor,
            title: Text('Riwayat Pesanan'),
            centerTitle: true,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: checkoutProvider.checkouts
                .map(
                  (checkout) => HistoryCard(
                    checkout: checkout,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
