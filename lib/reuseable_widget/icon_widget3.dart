import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const IconWidget3(),
    );
  }
}

class IconWidget3 extends StatefulWidget {
  const IconWidget3({super.key});

  @override
  State<IconWidget3> createState() => _IconWidget3State();
}

class _IconWidget3State extends State<IconWidget3> {
  int index3 = 0;
  int index2 = 1;
  int index4 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF3A3A3A), // any background works
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // This one replicates your image (Bookmarks / Pins / Notes)
            UIButtonWidget(
              width: 360,
              height: 64,
              fontSize: 14,
              borderWidth: 2,
              radius: 10,
              items: const [
                UISegmentItem(
                  label: 'Bookmarks',
                ),
                UISegmentItem(
                  label: 'Pins',
                ),
                UISegmentItem(
                  label: 'Notes',
                ),
              ],
              initialIndex: index3,
              onChanged: (i) => setState(() => index3 = i),
            ),
            const SizedBox(height: 24),

            // 2 segments, text-only (icon is optional)
            UIButtonWidget(
              width: 320,
              height: 56,
              items: const [
                UISegmentItem(label: 'White'),
                UISegmentItem(label: 'Night', icon: Icons.nightlight_round),
              ],
              initialIndex: index2,
              onChanged: (i) => setState(() => index2 = i),
            ),
            const SizedBox(height: 24),

            // 4 segments, mix of icon/no icon
            UIButtonWidget(
              width: 360,
              height: 64,
              items: const [
                UISegmentItem(label: 'All', icon: Icons.all_inclusive),
                UISegmentItem(label: 'Docs', icon: Icons.description),
                UISegmentItem(label: 'Media', icon: Icons.perm_media),
                UISegmentItem(label: 'Links'),
              ],
              initialIndex: index4,
              onChanged: (i) => setState(() => index4 = i),
            ),
          ],
        ),
      ),
    );
  }
}

/// Data for each segment (text required, icon optional).
class UISegmentItem {
  final String label;
  final IconData? icon;
  const UISegmentItem({required this.label, this.icon});
}

/// Reusable segmented button with a sliding pill indicator.
/// - Supports 2/3/4 segments.
/// - Works on any background.
/// - Only Material widgets (no external packages).
class UIButtonWidget extends StatefulWidget {
  const UIButtonWidget({
    super.key,
    required this.items,
    this.initialIndex = 0,
    this.onChanged,
    this.width = 340,
    this.height = 60,

    // Style (override if you need)
    this.containerColor = const Color(0xFFFFFFFF), // white card
    this.borderColor = const Color(0xFF17A589), // mint-green stroke
    this.borderWidth = 2.0,
    this.radius = 18.0,
    this.innerPadding = const EdgeInsets.all(6.0),
    this.pillColor = const Color(0xFF159A74), // selected pill green
    this.textSelected = const Color(0xFFFFFFFF),
    this.textUnselected = const Color(0xFF4F5B62), // dark grey
    this.iconSelected = const Color(0xFFFFFFFF),
    this.iconUnselected = const Color(0xFF4F5B62),
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w600,
    this.duration = const Duration(milliseconds: 240),
    this.curve = Curves.easeInOut,
  }) : assert(items.length >= 2 && items.length <= 4,
            'UIButtonWidget supports 2 to 4 segments.');

  final List<UISegmentItem> items;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

  final double width;
  final double height;

  final Color containerColor;
  final Color borderColor;
  final double borderWidth;
  final double radius;
  final EdgeInsets innerPadding;

  final Color pillColor;
  final Color textSelected;
  final Color textUnselected;
  final Color iconSelected;
  final Color iconUnselected;

  final double fontSize;
  final FontWeight fontWeight;

  final Duration duration;
  final Curve curve;

  @override
  State<UIButtonWidget> createState() => _UIButtonWidgetState();
}

class _UIButtonWidgetState extends State<UIButtonWidget> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.items.length - 1);
  }

  void _select(int i) {
    if (i == _index) return;
    setState(() => _index = i);
    widget.onChanged?.call(i);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.containerColor,
          border:
              Border.all(color: widget.borderColor, width: widget.borderWidth),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        padding: widget.innerPadding,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double w = constraints.maxWidth;
            final double h = constraints.maxHeight;
            final int count = widget.items.length;
            final double segW = w / count;

            return Stack(
              children: [
                // Sliding green pill behind the selected segment
                AnimatedPositioned(
                  duration: widget.duration,
                  curve: widget.curve,
                  left: _index * segW,
                  top: 0,
                  width: segW,
                  height: h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.pillColor,
                      borderRadius: BorderRadius.circular(widget.radius - 6),
                      boxShadow: [
                        BoxShadow(
                          color: widget.pillColor.withOpacity(0.18),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),

                // Foreground interactive segments
                Row(
                  children: List.generate(count, (i) {
                    final bool isSelected = i == _index;
                    final item = widget.items[i];

                    final label = Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isSelected
                            ? widget.textSelected
                            : widget.textUnselected,
                        fontSize: widget.fontSize,
                        fontWeight: widget.fontWeight,
                        letterSpacing: 0.2,
                      ),
                    );

                    final content = item.icon == null
                        ? label
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              label,
                              const SizedBox(width: 8),
                              Icon(
                                item.icon,
                                size: 20,
                                color: isSelected
                                    ? widget.iconSelected
                                    : widget.iconUnselected,
                              ),
                            ],
                          );

                    return Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => _select(i),
                          borderRadius:
                              BorderRadius.circular(widget.radius - 6),
                          child: Center(child: content),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
