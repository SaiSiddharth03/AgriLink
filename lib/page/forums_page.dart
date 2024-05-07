import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:a2/component/forum_news_component.dart';

import '../component/title_component.dart';

class ForumsPage extends ConsumerStatefulWidget {
  const ForumsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForumsPageState();
}

class _ForumsPageState extends ConsumerState<ForumsPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> title = [
    'Irrigation Technique',
    'Planting Strategies',
    'All about Rice',
    'Innovation in Technologies',
    'Automated Farming'
  ];

  List<String> subtitle = [
    'NEW: This is how to make Irrigation good',
    'NEW: Planting using traditional way is not good',
    'UPDATE: New variance Rice'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          const TitleComponent(title: 'Forums'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.all(20),
                    title: Text(
                      title[index],
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      subtitle[index],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 17, color: Colors.black54),
                    ),
                    trailing: const Text('11',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 130, 64),
                        )),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    children: const [
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
