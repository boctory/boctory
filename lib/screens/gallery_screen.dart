import 'package:flutter/material.dart';
import 'processing_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 48) / 2;
    final itemHeight = itemWidth; // 정사각형 형태로 변경

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '해파리 사진을 선택하세요',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2, // 간격 최소화
                    crossAxisSpacing: 2, // 간격 최소화
                    childAspectRatio: 1, // 정사각형
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProcessingScreen(
                              imagePath:
                                  'assets/images/jellyfish${index + 1}.jpg',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.black,
                        child: Image.asset(
                          'assets/images/jellyfish${index + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
