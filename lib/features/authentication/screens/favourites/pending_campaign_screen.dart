import 'package:assignment/Components/campaign_list_item_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class PendingCampaigns extends StatefulWidget {
  const PendingCampaigns({super.key});

  @override
  State<PendingCampaigns> createState() => _PendingCampaignsState();
}

class _PendingCampaignsState extends State<PendingCampaigns> {
  List<Map<String, dynamic>> orders = [];
  bool loadingError = false;

  String jsonFile = 'lib/json/pending_campaign.json';

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      final String jsonString =
          await DefaultAssetBundle.of(context).loadString(jsonFile);
      final List<dynamic> jsonList = json.decode(jsonString);
      if (mounted) {
        setState(() {
          orders = List<Map<String, dynamic>>.from(jsonList);
          loadingError = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          loadingError = true;
        });
      }

      print('Error loading orders: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    loadOrders(); // Load the data every time the build method is called
    if (loadingError) {
      return const Center(
        child: Text(
          'Error loading orders',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return CampaignListItemCard(
                    orderNo: 'Application ID: ${order['orderNo']}',
                    productName: order['productName'],
                    shopName: order['shopName'],
                    price: order['price'],
                    shippedStatus: order['shippedStatus'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

