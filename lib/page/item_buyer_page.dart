import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:a2/component/comentar_component.dart';

class MarketBuyerPage extends ConsumerWidget {
  MarketBuyerPage({super.key});

  List<Icon> ratings = [
    Icon(
      Icons.star,
      color: Colors.yellow[700],
      size: 30,
    ),
    Icon(
      Icons.star,
      color: Colors.yellow[700],
      size: 30,
    ),
    Icon(
      Icons.star,
      color: Colors.yellow[700],
      size: 30,
    ),
    Icon(
      Icons.star,
      color: Colors.yellow[700],
      size: 30,
    ),
    Icon(
      Icons.star,
      color: Colors.yellow[700],
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('C4')),
        backgroundColor: const Color.fromARGB(255, 5, 130, 64),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: heightScreen * 0.37,
              width: widthScreen,
              child: Image.asset(
                'assets/images/rice-sell.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Rp 13.000/',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35)),
                        const Text('kg',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const Expanded(child: SizedBox()),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 30,
                        ),
                        const Text('4.9',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('John',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 27)),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 27,
                          color: Color.fromARGB(255, 5, 130, 64),
                        ),
                        SizedBox(
                          width: widthScreen * 0.70,
                          child: const Text(
                            '',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 122, 173, 82)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('1.3 km',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      '',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14, height: 1.4),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      '.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14, height: 1.4),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 5, 130, 64),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Image.asset('assets/images/person.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              Text('')
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.message,
                                color: Color.fromARGB(255, 5, 130, 64),
                                size: 37,
                              ))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 5, 130, 64),
                      thickness: 1.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 5, 130, 64),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 14),
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 243, 195, 1),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 3),
                                child: Text(
                                  'Bidding',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const Text('Buyer',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    CommentComponent(rating: ratings),
                    CommentComponent(rating: ratings),
                    CommentComponent(rating: ratings),
                    CommentComponent(rating: ratings)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
