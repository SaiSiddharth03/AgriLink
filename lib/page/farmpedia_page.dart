import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:a2/component/carousel.dart';
import 'package:a2/component/farmpedia_content.dart';
import 'package:a2/component/filter_component.dart';
import 'package:a2/component/title_component.dart';

class FarmPediaPage extends ConsumerStatefulWidget {
  const FarmPediaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FarmPediaPageState();
}

class _FarmPediaPageState extends ConsumerState<FarmPediaPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final List<String> filterList = [
    'All',
    'Stories',
    'Scientific',
    'Beginner',
    'Tips',
    'Low Budget',
    'Innovation'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
            const TitleComponent(title: 'Featured Articles'),
            const CarouserlSliderPage(),
            const SizedBox(
              height: 22,
            ),
            FilterComponent(filterList: filterList),
            const FarmPediaContent(
                type: 'Content',
                title: '',
                imagePath: 'assets/images/farmpedia_content.png',
                name: 'John Doe',
                dateUpload: 'Uploaded on 11:30 PM',
                photoProfil: 'assets/images/person.png'),
            const FarmPediaContent(
                type: 'Content',
                title: '',
                imagePath: 'assets/images/farmpedia_content.png',
                name: 'John Doe',
                dateUpload: 'Uploaded on 11:30 PM',
                photoProfil: 'assets/images/person.png'),
            const FarmPediaContent(
                type: 'Content',
                title: '',
                imagePath: 'assets/images/farmpedia_content.png',
                name: 'John Doe',
                dateUpload: 'Uploaded on 11:30 PM',
                photoProfil: 'assets/images/person.png')
          ],
        )),
      ),
    );
  }
}
