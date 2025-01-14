import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:a2/component/filter_component.dart';
import 'package:a2/component/sell_item_component.dart';

class MarketPageBuyer extends ConsumerStatefulWidget {
  const MarketPageBuyer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MarketPageBuyerState();
}

class _MarketPageBuyerState extends ConsumerState<MarketPageBuyer> {
  final _searchController = TextEditingController();
  final List<String> filterMarket = [
    'All',
    'Nearest',
    'Most Popular',
    'Cheapest',
    'Most expensive',
    'Highest Rating'
  ];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  prefixIcon: const Icon(Icons.search_rounded)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: FilterComponent(filterList: filterMarket),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 210),
                padding: const EdgeInsets.all(12),
                itemCount: 22,
                itemBuilder: (context, index) => const SellItemComponent(
                    imagePath: 'assets/images/rice.png',
                    price: '12.350',
                    riceName: 'Sona masoori',
                    distance: '1.3',
                    owner: 'Ahmad Zaki',
                    address: 'Tenali, Andhra Pradesh')),
          ),
        ],
      )),
    );
  }
}
