import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class ProfileMenuWidget extends StatefulWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.endIcon,
    this.expandedContent,
    this.textColor,
    this.onPress,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool endIcon;
  final VoidCallback? onPress;
  final Widget? expandedContent;
  final Color? textColor;

  @override
  _ProfileMenuWidgetState createState() => _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState extends State<ProfileMenuWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpandedState() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: widget.endIcon || widget.onPress == null
              ? _toggleExpandedState
              : widget.onPress,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: gradientEnd.withOpacity(0.25),
            ),
            child: Icon(widget.icon, color: gradientEnd),
          ),
          title: Text(
            widget.title,
            style:
                TextStyle(fontWeight: FontWeight.w400, color: widget.textColor),
          ),
          trailing: widget.endIcon
              ? RotationTransition(
                  turns: _animation,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.pink.withOpacity(0.25),
                    ),
                    child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_right_outlined,
                        size: 18.0,
                        color: Colors.white),
                  ),
                )
              : null,
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1.0,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              child: widget.expandedContent,
            ),
          ),
        ),
      ],
    );
  }
}
