import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget2 extends StatefulWidget {
  const IconWidget2({super.key});

  @override
  State<IconWidget2> createState() => _IconWidget2State();
}

class _IconWidget2State extends State<IconWidget2> {
  int index3 = 0;
  int index2 = 1;
  int index4 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1E242B),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              UIButtonWidget(
                width: 280,
                height: 60,
                textUnselected: const Color(0xFFFFFFFF),
                containerColor: Color(0xFF20262d),
                fontSize: 14,
                iconUnselected: const Color(0xFFFFFFFF),
                // borderColor: Color.transparent,
                radius: 10,
                items: const [
                  UISegmentItem(
                      label: 'W2hite',
                      // icon: Icons.wb_sunny,
                      svgIcon: 'assets/images/svg/reusableWidget/sun.svg'),
                  UISegmentItem(
                      label: 'Night',
                      // icon: Icons.nights_stay,
                      svgIcon: 'assets/images/svg/reusableWidget/halfmoon.svg'),
                ],
                initialIndex: index2,
                onChanged: (i) => setState(() => index2 = i),
              ),
              SizedBox(height: 20),
              UIButtonWidget(
                width: 360,
                height: 64,
                fontSize: 14,
                borderColor: const Color(0xFF159A74),
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
              SizedBox(height: 20),
              UIButtonWidget(
                width: 250,
                height: 50,
                fontSize: 14,
                borderWidth: 1,
                textSelected: const Color(0xFF417360),
                textUnselected: const Color(0xFF000000),
                borderColor: const Color(0xFFe1ebe1),
                pillColor: const Color(0xFFe1ebe1),
                radius: 50,
                items: const [
                  UISegmentItem(
                    label: 'Dua',
                  ),
                  UISegmentItem(
                    label: 'Ruqyah',
                  ),
                ],
                initialIndex: index2,
                onChanged: (i) => setState(() => index2 = i),
              ),
              SizedBox(height: 20),
              // UIButtonWidget(
              //   width: 380,
              //   height: 80,
              //   fontSize: 14,
              //   fontWeight: FontWeight.bold,
              //   columnIcon: true,
              //   borderColor: const Color(0xFF159A74),
              //   borderWidth: 2,
              //   radius: 10,
              //   items: const [
              //     UISegmentItem(
              //       icon: Icons.bookmark,
              //       label: 'All Masayel',
              //     ),
              //     UISegmentItem(
              //       icon: Icons.push_pin,
              //       label: 'Subjectwise',
              //     ),
              //     UISegmentItem(
              //       icon: Icons.note_alt,
              //       label: 'Bookmarks',
              //     ),
              //   ],
              //   initialIndex: index3,
              //   onChanged: (i) => setState(() => index3 = i),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data for each segment (text required, icon optional).
class UISegmentItem {
  final String label;
  final IconData? icon;
  final String? svgIcon;
  const UISegmentItem({required this.label, this.icon, this.svgIcon});
}

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
    this.borderColor = const Color(0xFFFFFFFF), // stroke (override-able)
    this.borderWidth = 2.0,
    this.radius = 20.0,
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

    // New: layout controls
    this.columnIcon = false, // if true => Column(icon/text)
    this.columnPadding = const EdgeInsets.symmetric(vertical: 8),
    this.gap = 8.0, // space between icon and text
    this.iconSize = 20.0,
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

  // New
  final bool columnIcon;
  final EdgeInsets columnPadding;
  final double gap;
  final double iconSize;

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

                    final textStyle = TextStyle(
                      color: isSelected
                          ? widget.textSelected
                          : widget.textUnselected,
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                      letterSpacing: 0.2,
                    );

                    final text = Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: textStyle,
                    );

                    Widget content;

                    if (item.svgIcon == null) {
                      // Only text
                      content = text;
                    } else {
                      // final icon = Icon(
                      //   item.icon,
                      //   size: widget.iconSize,
                      //   color: isSelected
                      //       ? widget.iconSelected
                      //       : widget.iconUnselected,
                      // );
                      final svgIcon = SvgPicture.asset(
                        item.svgIcon!,
                        width: widget.iconSize,
                        height: widget.iconSize,
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? widget.iconSelected
                              : widget.iconUnselected,
                          BlendMode.srcIn,
                        ),
                      );

                      if (widget.columnIcon) {
                        // Column (icon + text vertically)
                        content = Padding(
                          padding: widget.columnPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              svgIcon,
                              SizedBox(height: widget.gap),
                              text,
                            ],
                          ),
                        );
                      } else {
                        // Row (text + icon horizontally)
                        content = Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            text,
                            SizedBox(width: widget.gap),
                            svgIcon,
                          ],
                        );
                      }
                    }

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
