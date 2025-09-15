import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'No-Paint Dashed Expansion',
//       theme: ThemeData(
//         useMaterial3: true,
//         scaffoldBackgroundColor: const Color(0xFFF2F5F4),
//         textTheme: const TextTheme(
//           titleMedium: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF0F172A)),
//           bodyMedium: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF0F172A)),
//           labelSmall: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: Color.fromARGB(255, 162, 139, 139)),
//         ),
//       ),
//       home: const DuaRuqya(),
//     );
//   }
// }

class DuaRuqya extends StatelessWidget {
  const DuaRuqya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color(0xFFF2F5F4),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: const [
          CustomExpansionTile(
            title: 'Dua Acceptance',
            subtitle: '1 Subcategories | 14 Duas',
            number: 1,
          ),
          SizedBox(height: 12),
          CustomExpansionTile(
            title: 'Morning & Evening',
            subtitle: '3 Subcategories | 45 Duas',
            icon: Icons.wb_sunny_outlined,
            initiallyExpanded: true,
            childrenLabels: [
              'Excellence of dua in the morning & evening',
              'Morning & Evening Adhkar',
              'Dhikr in busy state',
            ],
          ),
          SizedBox(height: 12),
          CustomExpansionTile(
            title: 'Sleep',
            subtitle: '2 Subcategories | 31 Duas',
            icon: Icons.nightlight_outlined,
          ),
          SizedBox(height: 12),
          CustomExpansionTile(
            title: 'Cloths',
            subtitle: '1 Subcategories | 8 Duas',
            icon: Icons.checkroom_outlined,
            childrenLabels: [
              'Dhikr in busy state',
              'Morning & Evening Adhkar',
              'Excellence of dua in the morning & evening',
              'Excellence of dua in the morning & evening',
              'Morning & Evening Adhkar',
              'Dhikr in busy state',
            ],
          ),
        ],
      ),
    );
  }
}

/// Reusable expansion tile where the dashed connector is built only with borders
/// (no painter, no packages). Dash color is gray by default.
class CustomExpansionTile extends StatefulWidget {
  // required
  final String title;
  final String subtitle;

  // either show a number or a Material icon
  final int? number;
  final IconData? icon;

  // children labels
  final List<String> childrenLabels;

  // visuals
  final Color tileColor;
  final Color borderColor;
  final Color dashColor; // gray
  final bool initiallyExpanded;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.number,
    this.icon,
    this.childrenLabels = const [],
    this.tileColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xFFE6EAEE),
    this.dashColor = const Color(0xFFB7C0CA), // soft gray
    this.initiallyExpanded = false,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with TickerProviderStateMixin {
  static const double _radius = 14;
  static const double _padH = 14;
  static const double _padV = 12;
  static const double _leadingSize = 40;

  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.tileColor,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: widget.borderColor, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(_radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _toggle,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: _padH, vertical: _padV),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Row(
                  children: [
                    _LeadingBadge(
                      size: _leadingSize,
                      number: widget.number,
                      icon: widget.icon,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4),
                          Text(widget.subtitle,
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 6),
                      turns: _expanded ? 0.5 : 0.0,
                      child: const Icon(Icons.expand_more,
                          color: Color(0xFF64748B)),
                    ),
                  ],
                ),

                // expanded body
                AnimatedSize(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: !_expanded || widget.childrenLabels.isEmpty
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: _ExpandedBodyNoPaint(
                            dashColor: widget.dashColor,
                            leftIndentFromTile: _leadingSize - 12,
                            items: widget.childrenLabels,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LeadingBadge extends StatelessWidget {
  final double size;
  final int? number;
  final IconData? icon;

  const _LeadingBadge({required this.size, this.number, this.icon});

  @override
  Widget build(BuildContext context) {
    final Color bg = const Color(0xFFE8F3EB); // soft green-ish
    final Color fg = const Color(0xFF16A34A);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: number != null
          ? Text('$number',
              style: TextStyle(
                  color: fg,
                  fontSize: size * 0.42,
                  fontWeight: FontWeight.w700))
          : Icon(icon ?? Icons.category_outlined, color: fg, size: size * 0.58),
    );
  }
}

class _ExpandedBodyNoPaint extends StatelessWidget {
  final Color dashColor;
  final double leftIndentFromTile;
  final List<String> items;

  const _ExpandedBodyNoPaint({
    required this.dashColor,
    required this.leftIndentFromTile,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // Stack lets a full-height dashed rail sit behind the children.
    return Stack(
      children: [
        // full-height vertical dashed rail built with borders only
        Positioned.fill(
          left: leftIndentFromTile -
              18, // fine-tune so it visually lines up with leading badge
          right: null,
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 12,
              child: _VerticalDashedRailByBorder(
                color: dashColor,
                thickness: 2,
                dash: 6,
                gap: 6,
              ),
            ),
          ),
        ),

        // children list; each child gets a short horizontal dash to connect
        Padding(
          // padding: EdgeInsets.only(left: leftIndentFromTile),
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < items.length; i++) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _HorizontalDashByBorder(
                        color: dashColor,
                        width: 50,
                        dash: 6,
                        gap: 6,
                        thickness: 2),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          items[i],
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right,
                        color: Color(0xFF94A3B8), size: 20),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// A full-height vertical dashed rail using only borders (no CustomPaint).
class _VerticalDashedRailByBorder extends StatelessWidget {
  final Color color;
  final double thickness;
  final double dash;
  final double gap;

  const _VerticalDashedRailByBorder({
    required this.color,
    required this.thickness,
    required this.dash,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final double h =
            constraints.maxHeight.isFinite ? constraints.maxHeight : 0;
        final double unit = dash + gap;
        final int count = h == 0 ? 0 : (h / unit).floor().clamp(0, 200);
        final double used = count > 0 ? (count * unit) - gap : 0;
        final double remainder = (h - used).clamp(0.0, double.infinity);

        final children = <Widget>[];
        for (int i = 0; i < count; i++) {
          children.add(SizedBox(
            height: dash,
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(color: color, width: thickness)),
              ),
            ),
          ));
          if (i != count - 1) children.add(SizedBox(height: gap));
        }
        if (remainder > 0) {
          children.add(SizedBox(height: remainder));
        }

        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      },
    );
  }
}

/// A horizontal dashed line using only Border (no CustomPaint).
/// Repeats dashes across the given width.
class _HorizontalDashByBorder extends StatelessWidget {
  final Color color;
  final double width;
  final double thickness;
  final double dash; // length of each dash
  final double gap; // space between dashes

  const _HorizontalDashByBorder({
    required this.color,
    required this.width,
    required this.thickness,
    this.dash = 6,
    this.gap = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // a tiny height so the bottom border is visible without clipping
      height: thickness + 2,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final double w =
              constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;

          if (w <= 0) return const SizedBox.shrink();

          final double unit = dash + gap;
          final int count = unit <= 0 ? 0 : (w / unit).floor().clamp(0, 200);
          final double used = count > 0 ? (count * unit) - gap : 0;
          final double remainder = (w - used).clamp(0.0, double.infinity);

          final children = <Widget>[];
          for (int i = 0; i < count; i++) {
            children.add(SizedBox(
              width: dash,
              height: thickness + 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: color, width: thickness),
                  ),
                ),
              ),
            ));
            if (i != count - 1) children.add(SizedBox(width: gap));
          }

          // keep total width exact by adding leftover empty space
          if (remainder > 0) {
            children.add(SizedBox(width: remainder));
          }

          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: children,
          );
        },
      ),
    );
  }
}
