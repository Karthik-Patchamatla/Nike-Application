import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool _isOn = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOn = !_isOn;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Nike image on the left side of the toggle
            _isOn
                ? Image.asset(
                    'lib/assets/nikeblack.png',
                    width: 30.0,
                    height: 30.0,
                  )
                : ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(255, 205, 207, 207), BlendMode.srcIn),
                    child: Image.asset(
                      'lib/assets/nikeblack.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
            const SizedBox(width: 10.0),
            // Jordan image on the right side of the toggle
            !_isOn
                ? Image.asset(
                    'lib/assets/jordan.png',
                    width: 30.0,
                    height: 30.0,
                  )
                : ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(255, 205, 207, 207), BlendMode.srcIn),
                    child: Image.asset(
                      'lib/assets/jordan.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
