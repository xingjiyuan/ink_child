library ink_child;

import 'package:flutter/material.dart';

/// ```dart
/// Widget buildButton(
///    String assetImage, String text, GestureTapCallback _onTap) {
///  InkBox inkBox = InkBox(
///      child: Image.asset(
///    assetImage,
///    width: 42,
///    height: 42,
///  ));
///
///  InkChildWidget inkResponse = InkChildWidget(
///      inkBox: inkBox,
///      child: Container(
///          width: 90,
///          child: Column(
///            mainAxisAlignment: MainAxisAlignment.center,
///            children: <Widget>[
///              inkBox,
///              Padding(
///                padding: EdgeInsets.all(6),
///                child: Text(
///                  text,
///                  style: TextStyle(fontSize: 14, color: Color(0xFF313E44)),
///                ),
///              ),
///            ],
///          )),
///      customBorder: CircleBorder(),
///      onTap: _onTap);
///  return Material(
///    child: inkResponse,
///    color: Colors.white,
///  );
/// }
/// ```

/// 实现点击一个 widget 时，其内部的子 widget 出现水波纹效果。
/// 主要通过 inkBox 获取水波纹的大小和位置，而形状则需要外部设置
/// 注意 inkBox 要作为 child 的子 widget。可以参考 example code
class InkChildWidget extends InkResponse {
  final InkBox inkBox;

  InkChildWidget({
    @required this.inkBox,
    Key key,
    Widget child,
    GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    BoxShape highlightShape = BoxShape.circle,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    double radius,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
  }) : super(
    containedInkWell: true,
    highlightShape: highlightShape,
    customBorder: customBorder,
    child: child,
    onTap: onTap,
    onTapDown: onTapDown,
    onTapCancel: onTapCancel,
    onDoubleTap: onDoubleTap,
    onLongPress: onLongPress,
    onHighlightChanged: onHighlightChanged,
    radius: radius,
    borderRadius: borderRadius,
    highlightColor: highlightColor,
    splashColor: splashColor,
    splashFactory: splashFactory,
    enableFeedback: enableFeedback,
    excludeFromSemantics: excludeFromSemantics,
  );

  @override
  RectCallback getRectCallback(RenderBox referenceBox) {
    return () => inkBox.rect(ancestor: referenceBox);
  }
}

class InkBox extends StatelessWidget {
  final Widget child;
  BuildContext context;

  Rect rect({RenderObject ancestor}) =>
      (context.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero, ancestor: ancestor) &
      context.size;

  InkBox({this.child});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: child,
    );
  }
}
