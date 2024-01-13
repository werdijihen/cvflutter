import 'package:jihen/constraints/responsive.dart';
import 'package:flutter/material.dart';

class ShowAnimation extends StatefulWidget {
  //which child you want to animation it's received that
  Widget child;
  ShowAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<ShowAnimation> createState() => _ShowAnimationState();
}

class _ShowAnimationState extends State<ShowAnimation> {
  //by this animation you will see that, child are show top to down with increase it's opacity
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: widget.child,
      duration: Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double _val, child) {
        double d = isMobile(context) ? _val * 25 : _val * 50;
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top: d),
            child: child,
          ),
        );
      },
    );
  }
}
