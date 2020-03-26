import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final Widget widgetSliderChild;

  AppSlider({@required this.widgetSliderChild});
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      child: widgetSliderChild,
      data: SliderTheme.of(context).copyWith(
        overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.pink,
        thumbColor: Colors.pink,
        activeTrackColor: Colors.pink,
        inactiveTrackColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
