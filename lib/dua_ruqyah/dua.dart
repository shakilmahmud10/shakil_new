import 'package:flutter/material.dart';

class Dua extends StatelessWidget {
  const Dua({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <Category>[
      Category(
        number: 1,
        title: 'বান্দা তার রবের মুখাপেক্ষী',
        subtitle: 'সবমোট ৩টি দোয়া রয়েছে',
        children: const [
          ChildItem(
              no: 15, text: 'দীনের উপর অটলতা ও সকল কাজে উন্নতি পরিলক্ষিত'),
          ChildItem(no: 16, text: 'দীনের উপর অটল থাকার দোয়া'),
          ChildItem(no: 17, text: 'ইসলামের উপর অটল থাকার দোয়া'),
          ChildItem(
              no: 15, text: 'দীনের উপর অটলতা ও সকল কাজে উন্নতি পরিলক্ষিত'),
          ChildItem(no: 16, text: 'দীনের উপর অটল থাকার দোয়া'),
          ChildItem(no: 17, text: 'ইসলামের উপর অটল থাকার দোয়া'),
        ],
      ),
      Category(
        number: 2,
        title: 'আল্লাহর কাছে যে নিয়ামতটি চাওয়া সবচেয়ে বেশি গুরুত্বপূর্ণ',
        subtitle: 'সবমোট ৩টি দোয়া রয়েছে',
        children: const [
          ChildItem(
              no: 15, text: 'দীনের উপর অটলতা ও সকল কাজে উন্নতি পরিলক্ষিত'),
          ChildItem(no: 16, text: 'দীনের উপর অটল থাকার দোয়া'),
          ChildItem(no: 17, text: 'ইসলামের উপর অটল থাকার দোয়া'),
        ],
      ),
      Category(
        number: 3,
        title: 'জান্নাত লাভ ও জাহান্নাম থেকে বেঁচাই',
        subtitle: 'সবমোট ৩টি দোয়া রয়েছে',
        children: const [
          ChildItem(
              no: 15, text: 'দীনের উপর অটলতা ও সকল কাজে উন্নতি পরিলক্ষিত'),
          ChildItem(no: 16, text: 'দীনের উপর অটল থাকার দোয়া'),
          ChildItem(no: 17, text: 'ইসলামের উপর অটল থাকার দোয়া'),
        ],
      ),
      Category(
        number: 4,
        title: 'দীনের উপর অটল থাকার দোয়া',
        subtitle: 'সবমোট ৩টি দোয়া রয়েছে',
        children: const [
          ChildItem(
              no: 15, text: 'দীনের উপর অটলতা ও সকল কাজে উন্নতি পরিলক্ষিত'),
          ChildItem(no: 16, text: 'দীনের উপর অটল থাকার দোয়া'),
          ChildItem(no: 17, text: 'ইসলামের উপর অটল থাকার দোয়া'),
        ],
      ),
      Category(
        number: 5,
        title: 'সকল কাজে উন্নত ফলাফলের দোয়া',
        subtitle: 'সবমোট ২টি দোয়া রয়েছে',
        children: const [
          ChildItem(
              no: 15, text: 'দীনের উপর অটলতা ও সকল কাজে উন্নতি পরিলক্ষিত'),
          ChildItem(no: 16, text: 'দীনের উপর অটল থাকার দোয়া'),
          ChildItem(no: 17, text: 'ইসলামের উপর অটল থাকার দোয়া'),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFedf1f0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            const Text('দোয়ার তালিকা', style: TextStyle(color: Colors.black)),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final c = items[i];
          return CustomExpansionTile(
            borderColor: Colors.transparent,
            enableSplash: false,
            title: c.title,
            subtitle: c.subtitle,
            children: c.children,
            leadingNumber: c.number?.toString(),
            initiallyExpanded: c.number == 8,
          );
        },
      ),
    );
  }
}

class Category {
  final int? number;
  final IconData? icon;
  final String title;
  final String subtitle;
  final List<ChildItem> children;
  Category({
    this.number,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
  }) : assert(
            number != null || icon != null, 'Provide leading number or icon.');
}

class ChildItem {
  final int no;
  final String text;
  const ChildItem({required this.no, required this.text});
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<ChildItem> children;
  final String? leadingNumber;
  final IconData? leadingIcon;
  final Color tileBackgroundColor;
  final Color borderColor;
  final Color dashColor;
  final Color leadingBg;
  final Color leadingFg;
  final double borderRadius;
  final bool initiallyExpanded;

  /// 🔹 নতুন property → Splash effect control
  final bool enableSplash;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.leadingNumber,
    this.leadingIcon,
    this.tileBackgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xFFE3EAE6),
    this.dashColor = const Color(0xFFB7C0CA),
    this.leadingBg = const Color(0xFF15A05A),
    this.leadingFg = Colors.white,
    this.borderRadius = 14,
    this.initiallyExpanded = false,
    this.enableSplash = true, // default on
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static const double _hPad = 14;
  static const double _vPad = 26;
  static const double _leadingSlot = 52;
  static const double _badgeSize = 36;

  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final tileContent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: _hPad, vertical: _vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _leadingSlot,
                child: Center(
                  child: Container(
                    width: _badgeSize,
                    height: _badgeSize,
                    decoration: BoxDecoration(
                      color: widget.leadingBg,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: widget.leadingNumber != null
                        ? Text(
                            widget.leadingNumber!,
                            style: TextStyle(
                              color: widget.leadingFg,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Icon(
                            widget.leadingIcon ?? Icons.category_outlined,
                            color: widget.leadingFg,
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style: theme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 6),
                      Text(widget.subtitle, style: theme.labelSmall),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),

              //Expand button
              // AnimatedRotation(
              //   duration: const Duration(milliseconds: 200),
              //   turns: _expanded ? 0.5 : 0.0,
              //   child: const Icon(Icons.keyboard_arrow_down_rounded,
              //       color: Color(0xFF5E6763)),
              // ),
            ],
          ),

          // Expanded Content
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: !_expanded || widget.children.isEmpty
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: _ExpandedBody(
                      dashColor: widget.dashColor,
                      leftIndentFromTile: _leadingSlot - 10,
                      children: widget.children,
                    ),
                  ),
          ),
        ],
      ),
    );

    return Material(
      color: widget.tileBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: BorderSide(color: widget.borderColor, width: 1),
      ),
      child: widget.enableSplash
          ? InkWell(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              onTap: _toggle,
              child: tileContent,
            )
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _toggle,
              child: tileContent,
            ),
    );
  }
}

class _ExpandedBody extends StatelessWidget {
  final Color dashColor;
  final double leftIndentFromTile;
  final List<ChildItem> children;

  const _ExpandedBody({
    required this.dashColor,
    required this.leftIndentFromTile,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: leftIndentFromTile - 18,
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
        Padding(
          padding: EdgeInsets.only(left: leftIndentFromTile - 16),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++)
                _ChildRow(
                  item: children[i],
                  dashColor: dashColor,
                  isLast: i == children.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChildRow extends StatelessWidget {
  final ChildItem item;
  final Color dashColor;
  final bool isLast;

  const _ChildRow({
    required this.item,
    required this.dashColor,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _HorizontalDashByBorder(
            color: dashColor,
            width: 50,
            thickness: 2,
            dash: 6,
            gap: 6,
          ),
          const SizedBox(width: 2),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${item.no}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2422),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.text,
              style: theme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Color(0xFF8D9691)),
        ],
      ),
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
