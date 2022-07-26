import 'package:flutter/widgets.dart';

class TurnBox extends StatefulWidget {
  const TurnBox(
      {Key? key,
      this.turns = .0, //旋转的“圈”数,一圈为360度，如0.25圈即90度
      this.speed = 200, //过渡动画执行的总时长
      this.child})
      : super(key: key);

  final double turns;
  final int speed;
  final Widget? child;

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = getAnimationController();
    _controller?.value = widget.turns;
  }

  AnimationController getAnimationController() {
    return AnimationController(
        vsync: this,
        debugLabel: "testhsssaha",
        lowerBound: -double.infinity,
        upperBound: double.infinity);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      /// lxh_tips: 判空处理
      turns: _controller != null ? _controller! : getAnimationController(),
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller?.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed),
        curve: Curves.easeOut,
      );
      print(_controller?.debugLabel != null
          ? (_controller?.debugLabel.toString())! + widget.turns.toString()
          : "======");
    }
  }
}
