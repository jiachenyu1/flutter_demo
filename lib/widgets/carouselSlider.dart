import 'package:flutter/material.dart';

class CarouselSliderWrap extends StatelessWidget {
  CarouselSliderWrap({this.child, this.animation});

  final List<Widget> child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    var list = [];

    this.child.forEach((item) => {
          list.add(AnimatedBuilder(
            animation: this.animation,
            child: item,
            builder: (BuildContext context, Widget child) {
              return Container(
                child: item,
                width: this.animation.value,
                height: this.animation.value,
                color: Colors.red,
              );
            },
          ))
        });
    return Row(children: list);
  }
}

class CarouselSlider extends StatefulWidget {
  CarouselSlider({this.child});

  final List<Widget> child;

  @override
  _CarouselSlider createState() => _CarouselSlider();
}

class _CarouselSlider extends State<CarouselSlider>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = new Tween(begin: 10.0, end: 600.0).animate(controller);
    controller.forward();
  }

  Widget build(BuildContext context) {
    return CarouselSliderWrap(child: widget.child, animation: animation);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
