import 'package:tranquillo/presentation/widgets/beat_notes.dart';
import 'package:tranquillo/presentation/widgets/staff.dart';
import 'package:flutter/material.dart';

class BeatWidget extends StatelessWidget {
  const BeatWidget({
    required this.mainScale,
    this.preview = false,
    Key? key,
  }) : super(key: key);

  final bool preview;
  final double mainScale;

  @override
  Widget build(BuildContext context) => SizedBox(
        // 24: lines and spaces + 12: noteScale
        height: mainScale * 24 + 12 * mainScale,
        child: Stack(
          children: [
            // TODO(zoskar): change order
            BeatNotes(step: mainScale, preview: preview),
            Staff(
              distance: mainScale,
              isTappable: !preview,
            ),
          ],
        ),
      );
}
