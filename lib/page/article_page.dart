import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.46,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/farmpedia_hd.png',
                      fit: BoxFit.fill,
                    ),
                  )),
              const Positioned(
                  bottom: 105,
                  left: 37,
                  right: 20,
                  child: Text("Choosing Best price for the product",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ))),
              Positioned(
                bottom: 40,
                left: 37,
                child: SizedBox(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 43,
                          child: Image.asset('assets/images/person.png',
                              fit: BoxFit.fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('John',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          const SizedBox(height: 5),
                          Text('',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 11))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 30,
                  bottom: 40,
                  child: Row(
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            size: 27,
                            color: Colors.red,
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 3, right: 6),
                        child:
                            Text('100', style: TextStyle(color: Colors.white)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_outlined,
                            size: 27,
                            color: Color.fromARGB(255, 5, 130, 64),
                          ))
                    ],
                  )),
              Positioned(
                top: 50,
                left: 30,
                child: IconButton(
                  icon: const Icon(Icons.arrow_circle_left_rounded,
                      color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
          Expanded(
              child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Choosing the best rice scientifically is important for farmers and business people in the agricultural sector. Good rice has many advantages, including high yield, resistance to pests and diseases, and good quality of harvest. In this article, we will discuss There are several factors that need to be considered in choosing the best rice scientifically. Environmental conditions. Environmental conditions such as altitude, rainfall, air temperature and humidity greatly influence the growth and yield of rice. Therefore, choosing the right rice variety must be adjusted to environmental conditions. in the area where rice will be planted. For example, rice varieties that are suitable for planting in the lowlands are not necessarily suitable for planting in the highlands. Availability of water Availability of sufficient water is very important for rice growth. There are several rice varieties that are more resistant to drought or have the ability to adapt to environmental conditions with low water availability. Therefore, before choosing the rice variety to be planted, it is necessary to consider the water availability factor in the area. Resistance to pests and diseases Resistance to pests and diseases is very important to avoid losses in crop yields. There are several rice varieties that are more resistant to certain pests and diseases. SiddharthBefore choosing a rice variety, it is necessary to consider the types of pests and diseases that commonly occur in the area, as well as the level of resistance of the rice variety to these pests and diseases.",
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
