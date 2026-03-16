import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:homz/features/home/ui/widgets/buttons_overlay_image.dart';

class BuildCarouselSlider extends StatefulWidget {
  final List<String> imagePaths;
  const BuildCarouselSlider({super.key, required this.imagePaths});

  @override
  State<BuildCarouselSlider> createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  // Track the currently centered image
  int _currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CarouselSlider(
          options: CarouselOptions(
            padEnds: false,
            reverse: true,
            height: constraints.maxHeight, 
            enlargeCenterPage: true, 
            enlargeFactor: 0.20, 
            viewportFraction: 0.60, 
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imagePaths.asMap().entries.map((entry) {
            int itemIndex = entry.key;
            String itemPath = entry.value;
            bool isActive = itemIndex == _currentIndex; 

            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin:  EdgeInsets.symmetric(vertical: 20,), 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      fit: StackFit.expand, 
                      children:[
                        // Background Image (ALWAYS VISIBLE) 
                        Image.asset(itemPath, fit: BoxFit.cover),
                        // Buttons Overlay (ONLY VISIBLE ON CENTER IMAGE)
                        AnimatedOpacity(
                          opacity: isActive ? 1.0 : 0.0, 
                          duration: const Duration(milliseconds: 300),
                          child: ButtonsOverlayImage(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      }
    );
  }
}