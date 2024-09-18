import 'dart:async';

import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCountDownTimer extends StatefulWidget {
  const DefaultCountDownTimer({
    super.key,
    required this.duration,
    this.onCompletion,
  });

  final Duration duration;
  final VoidCallback? onCompletion;

  @override
  DefaultCountDownTimerState createState() => DefaultCountDownTimerState();
}

class DefaultCountDownTimerState extends State<DefaultCountDownTimer> {
  late Duration remainingDuration;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingDuration = widget.duration;
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingDuration.inSeconds <= 0) {
        _timer?.cancel();
        widget.onCompletion?.call();
      } else {
        setState(() {
          remainingDuration = remainingDuration - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultTextStyle = textTheme.bodyLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold);

    // Extract hours, minutes, and seconds from remaining duration
    final hours = remainingDuration.inHours.toString().padLeft(2, '0');
    final minutes = (remainingDuration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (remainingDuration.inSeconds % 60).toString().padLeft(2, '0');

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimePart(time: hours, type: _TimePartType.hours.value(context), textStyle: defaultTextStyle),
        Gap.xxsmall(),
        Text(':', style: defaultTextStyle),
        Gap.xxsmall(),
        _buildTimePart(time: minutes, type: _TimePartType.minutes.value(context), textStyle: defaultTextStyle),
        Gap.xxsmall(),
        Text(':', style: defaultTextStyle),
        Gap.xxsmall(),
        _buildTimePart(time: seconds, type: _TimePartType.seconds.value(context), textStyle: defaultTextStyle),
      ],
    );
  }

  Widget _buildTimePart({TextStyle? textStyle, required String time, required String type}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              time,
              key: ValueKey(time),
              style: textStyle,
            ),
          ),
          Text(
            type,
            style: textStyle?.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

enum _TimePartType {
  hours,
  minutes,
  seconds,
}

extension _TimePartTypeExt on _TimePartType {
  String value(BuildContext context) => switch (this) {
        _TimePartType.hours => context.l10n.hours,
        _TimePartType.minutes => context.l10n.minutes,
        _TimePartType.seconds => context.l10n.seconds,
      };
}
