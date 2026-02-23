// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SkeletonLoader extends StatefulWidget {
  const SkeletonLoader({
    super.key,
    this.width,
    this.height,
    this.layoutPreset = 'listItem',
    this.lineCount = 3,
    this.baseColor,
    this.highlightColor,
    this.shimmerSpeed = 1500,
    this.borderRadius = 8.0,
    this.showAvatar = false,
    this.avatarSize = 48.0,
    this.lineSpacing = 12.0,
    this.animate = true,
  });

  final double? width;
  final double? height;
  final String layoutPreset;
  final int lineCount;
  final Color? baseColor;
  final Color? highlightColor;
  final int shimmerSpeed;
  final double borderRadius;
  final bool showAvatar;
  final double avatarSize;
  final double lineSpacing;
  final bool animate;

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Color get _baseColor => widget.baseColor ?? Colors.grey.shade300;

  Color get _highlightColor => widget.highlightColor ?? Colors.grey.shade100;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.shimmerSpeed),
    );
    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    if (widget.animate) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(SkeletonLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.animate && _controller.isAnimating) {
      _controller.stop();
    }
    if (widget.shimmerSpeed != oldWidget.shimmerSpeed) {
      _controller.duration = Duration(milliseconds: widget.shimmerSpeed);
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ── Shimmer Bone ──────────────────────────────────────────
  Widget _buildBone({
    double? width,
    double height = 16,
    bool isCircle = false,
    double? radius,
  }) {
    final effectiveRadius = radius ?? widget.borderRadius;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: isCircle ? height : width,
          height: height,
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                isCircle ? null : BorderRadius.circular(effectiveRadius),
            gradient: widget.animate
                ? LinearGradient(
                    begin: Alignment(_animation.value - 1, 0),
                    end: Alignment(_animation.value + 1, 0),
                    colors: [
                      _baseColor,
                      _highlightColor,
                      _baseColor,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  )
                : null,
            color: widget.animate ? null : _baseColor,
          ),
        );
      },
    );
  }

  // ── Layout: Text Lines ────────────────────────────────────
  Widget _buildTextLines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.lineCount, (index) {
        // Last line is shorter for a natural look
        final isLast = index == widget.lineCount - 1;
        return Padding(
          padding: EdgeInsets.only(
            bottom: index < widget.lineCount - 1 ? widget.lineSpacing : 0,
          ),
          child: _buildBone(
            width: isLast ? 150 : double.infinity,
            height: 14,
          ),
        );
      }),
    );
  }

  // ── Layout: List Item ─────────────────────────────────────
  Widget _buildListItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildBone(height: widget.avatarSize, isCircle: true),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildBone(width: 180, height: 16),
              SizedBox(height: widget.lineSpacing),
              _buildBone(width: 120, height: 12),
            ],
          ),
        ),
      ],
    );
  }

  // ── Layout: Card ──────────────────────────────────────────
  Widget _buildCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image placeholder
        _buildBone(
          width: double.infinity,
          height: 180,
          radius: widget.borderRadius,
        ),
        const SizedBox(height: 16),
        // Title
        _buildBone(width: 200, height: 18),
        SizedBox(height: widget.lineSpacing),
        // Subtitle
        _buildBone(width: double.infinity, height: 13),
        SizedBox(height: widget.lineSpacing * 0.6),
        _buildBone(width: 250, height: 13),
        const SizedBox(height: 16),
        // Action row
        Row(
          children: [
            _buildBone(width: 80, height: 32, radius: 16),
            const SizedBox(width: 12),
            _buildBone(width: 80, height: 32, radius: 16),
          ],
        ),
      ],
    );
  }

  // ── Layout: Profile ───────────────────────────────────────
  Widget _buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar
        _buildBone(height: widget.avatarSize * 1.8, isCircle: true),
        const SizedBox(height: 16),
        // Name
        _buildBone(width: 160, height: 20),
        SizedBox(height: widget.lineSpacing),
        // Bio line 1
        _buildBone(width: 220, height: 13),
        SizedBox(height: widget.lineSpacing * 0.6),
        // Bio line 2
        _buildBone(width: 180, height: 13),
        const SizedBox(height: 20),
        // Stats row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatBlock(),
            const SizedBox(width: 32),
            _buildStatBlock(),
            const SizedBox(width: 32),
            _buildStatBlock(),
          ],
        ),
      ],
    );
  }

  Widget _buildStatBlock() {
    return Column(
      children: [
        _buildBone(width: 40, height: 18),
        const SizedBox(height: 6),
        _buildBone(width: 56, height: 11),
      ],
    );
  }

  // ── Layout: Custom (Avatar + Lines) ───────────────────────
  Widget _buildCustom() {
    if (widget.showAvatar) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBone(height: widget.avatarSize, isCircle: true),
          const SizedBox(width: 16),
          Expanded(child: _buildTextLines()),
        ],
      );
    }
    return _buildTextLines();
  }

  // ── Build ─────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (widget.layoutPreset.toLowerCase()) {
      case 'listitem':
        content = _buildListItem();
        break;
      case 'card':
        content = _buildCard();
        break;
      case 'profile':
        content = _buildProfile();
        break;
      case 'text':
        content = _buildTextLines();
        break;
      case 'custom':
      default:
        content = _buildCustom();
        break;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16),
      child: content,
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
