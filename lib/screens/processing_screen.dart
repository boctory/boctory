import 'package:flutter/material.dart';
import '../services/jellyfish_ai_service.dart';
import 'result_screen.dart';

class ProcessingScreen extends StatefulWidget {
  final String imagePath;

  const ProcessingScreen({super.key, required this.imagePath});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  final _aiService = JellyfishAIService();
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _processImage();
  }

  Future<void> _processImage() async {
    try {
      _startProgressAnimation();
      final result = await _aiService.identifyJellyfish(widget.imagePath);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              imagePath: widget.imagePath,
              result: result,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _startProgressAnimation() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (_progress < 1.0 && mounted) {
        setState(() {
          _progress += 0.01;
        });
        _startProgressAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Processing...',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                widget.imagePath,
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey[800],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
