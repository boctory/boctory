import 'package:flutter/material.dart';
import '../services/jellyfish_ai_service.dart';

class ResultScreen extends StatelessWidget {
  final String imagePath;
  final JellyfishResult result;

  const ResultScreen({
    super.key,
    required this.imagePath,
    required this.result,
  });

  // 각 해파리 종별 상세 설명
  static const Map<String, String> jellyfishDescriptions = {
    'Blue': '''푸른 해파리의 신비로운 매력

푸른 해파리는 깊은 바다에서 서식하며 아름다운 푸른빛을 띠는 해파리입니다.

푸른 해파리의 특징
• 크기: 일반적으로 10-20cm 정도의 크기를 가집니다.
• 모양: 둥근 우산 모양의 갓과 길고 가는 촉수를 가지고 있습니다.
• 색상: 투명한 푸른빛을 띠며, 빛에 따라 다양한 색조를 보입니다.
• 서식지: 깊은 바다에서 주로 발견되며, 플랑크톤을 먹이로 삼습니다.

푸른 해파리는 아름다운 외모로 인해 수족관에서 자주 전시되는 종이기도 합니다.''',
    'Lions': '''사자갈기 해파리, 바다의 거인

사자갈기 해파리는 세계에서 가장 큰 해파리 종 중 하나로, 그 이름에 걸맞게 긴 촉수가 마치 사자의 갈기처럼 보입니다.

사자갈기 해파리의 특징
• 크기: 갓의 지름이 2m 이상 될 수 있으며, 촉수는 30m까지 자랄 수 있습니다.
• 모양: 거대한 우산 모양의 갓과 수천 개의 긴 촉수를 가지고 있습니다.
• 색상: 붉은색, 주황색, 갈색 등 다양한 색상을 띱니다.
• 서식지: 차가운 북극해와 북대서양에 주로 서식합니다.

위험성: 강한 독성을 가지고 있어 심각한 통증과 알레르기 반응을 일으킬 수 있으므로 매우 주의해야 합니다.''',
    'Moon': '''달빛처럼 투명한 문 젤리피쉬

달 해파리는 투명한 우산 모양의 몸체를 가진 아름다운 해파리입니다.

달 해파리의 특징
• 크기: 보통 25-40cm 정도의 크기를 가집니다.
• 모양: 투명한 우산 모양의 갓과 짧은 촉수를 가지고 있습니다.
• 색상: 투명하며 은은한 푸른빛을 띱니다.
• 서식지: 전 세계의 연안 해역에서 발견됩니다.

특이사항: 독성이 매우 약해 인간에게 거의 해를 끼치지 않는 안전한 해파리입니다.''',
    'Mauve': '''보라 쐐기 해파리, 아름답지만 위험한 생명체

보라 쐐기 해파리는 아름다운 보라색 빛을 띠지만, 강한 독성을 가진 위험한 해파리입니다.

보라 쐐기 해파리의 특징
• 크기: 일반적으로 5-10cm 정도로 비교적 작은 크기입니다.
• 모양: 둥근 갓과 길고 가는 촉수를 가지고 있으며, 우아한 모습이 특징입니다.
• 색상: 보라색이나 푸른빛을 띠며, 빛에 따라 형광색을 발합니다.
• 서식지: 따뜻한 열대 및 아열대 해역에서 주로 발견됩니다.

주의사항: 독성이 매우 강해 쏘임을 당하면 심각한 통증과 발진이 발생할 수 있습니다.''',
    'Compass': '''나침반 해파리, 바다의 방향을 알려주는 생명체

나침반 해파리는 독특한 무늬와 형태로 인해 이름이 붙여졌습니다.

나침반 해파리의 특징
• 크기: 평균 20-30cm 정도의 크기를 가집니다.
• 모양: 갓 위에 나침반 모양의 독특한 무늬가 있으며, 긴 촉수를 가지고 있습니다.
• 색상: 투명한 몸체에 갈색이나 주황색 무늬가 특징입니다.
• 서식지: 연안 해역에서 주로 발견되며, 계절에 따라 이동합니다.

주의사항: 독성이 있어 접촉 시 피부 자극이나 통증을 유발할 수 있으니 주의가 필요합니다.''',
    'Barrel': '''해파리의 여왕, 보름달 해파리

보름달 해파리는 이름처럼 둥근 모양이 마치 보름달 같아서 붙여진 이름이에요. 학명은 Rhizostoma pulmo이며, 맹독성을 지닌 해파리 중 하나로 알려져 있습니다.

보름달 해파리의 특징
• 크기: 지름이 50cm를 넘는 개체도 발견될 만큼 매우 큰 해파리입니다.
• 모양: 둥근 것과 긴 촉수가 특징이며, 갓의 가장자리에는 8개의 엽이 있습니다.
• 색깔: 흰색, 분홍색, 보라색 등 다양한 색깔을 띠며, 투명한 젤라틴 몸체를 가지고 있습니다.
• 서식지: 따뜻한 바다의 연안 지역에 주로 서식하며, 플랑크톤을 먹고 살아갑니다.

보름달 해파리의 독성
보름달 해파리에 쏘이면 심한 통증과 함께 발진, 물집 등이 생길 수 있습니다. 심한 경우에는 호흡곤란이나 심장마비를 일으킬 수도 있으므로, 해파리에 쏘였을 때는 즉시 병원으로 가야 합니다.''',
  };

  String _getFormattedTitle() {
    // species 이름을 snake_case로 변환하고 _jellyfish 추가
    return '${result.species.toLowerCase().replaceAll(' ', '_').replaceAll(RegExp(r'[^\w\s]+'), '')}_jellyfish';
  }

  String _getJellyfishDescription() {
    // API 결과에서 기본 이름만 추출 (예: "Blue Jellyfish" -> "Blue")
    String baseSpecies = result.species.split(' ').first;
    return jellyfishDescriptions[baseSpecies] ??
        'It\'s not a jellyfish we can identify. Please try with another image.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // 해파리 종 이름 (이탤릭체) - 중앙 정렬
                Center(
                  child: Text(
                    _getFormattedTitle(),
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // 해파리 이미지
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),

                // Information 섹션
                const Text(
                  'Information',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // 설명 텍스트
                Container(
                  height: 200, // 고정 높이 설정
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Scrollbar(
                    thickness: 4, // 스크롤바 두께 조정
                    radius: const Radius.circular(20), // 스크롤바 모서리 더 둥글게
                    thumbVisibility: true, // 스크롤바 항상 표시
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          20, 20, 12, 20), // 오른쪽 패딩 줄임
                      child: SingleChildScrollView(
                        child: Text(
                          _getJellyfishDescription(),
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1.6,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // 하단 버튼
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton.icon(
                      onPressed: () => Navigator.of(context)
                          .popUntil((route) => route.isFirst),
                      icon: const Icon(
                        Icons.photo_library_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Jelly Pop',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Georgia',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
