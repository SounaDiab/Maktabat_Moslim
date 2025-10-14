import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final Function(double) onFontSizeChange;
  final Function(bool) onSoundToggle;
  final VoidCallback onLongPress;
  double fontSize;
  final bool isSoundAvailable;

  CustomBottomNavigationBar({
    Key? key,
    required this.onBack,
    required this.onNext,
    required this.onFontSizeChange,
    required this.onSoundToggle,
    required this.fontSize,
    required this.onLongPress,
    this.isSoundAvailable = true,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

// double _fontSize = 18;
// double _fontSizeTablet = 30;

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool _isSoundPlaying = false;
  // bool _isSoundNotEmpty = false;

  void _handleSoundToggle() {
    setState(() {
      _isSoundPlaying = !_isSoundPlaying;
    });
    widget.onSoundToggle(_isSoundPlaying);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    void _handleFontSizeToggle() {
      widget.onFontSizeChange(widget.fontSize);
    }

    return BottomAppBar(
      height: isTablet ? 100 : 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // زر الرجوع (السابق)
          _buildNavigationItem(
            icon: Icons.arrow_back_ios,
            label: 'السابق',
            onTap: widget.onBack,
            onLongPress: () {},
          ),

          // زر تغيير حجم الخط
          _buildNavigationItem(
            icon: Icons.text_increase,
            label: 'حجم الخط',
            onTap: _handleFontSizeToggle,
            isActive: widget.fontSize == 20.0,
            onLongPress: widget.onLongPress,
          ),

          // زر التحكم في الصوت
          if (widget.isSoundAvailable)
            _buildNavigationItem(
              icon: _isSoundPlaying ? Icons.volume_up : Icons.volume_off,
              label: _isSoundPlaying ? 'صوت' : 'كتم',
              onTap: _handleSoundToggle,
              isActive: _isSoundPlaying,
              onLongPress: () {},
            ),

          // زر التالي
          _buildNavigationItem(
            icon: Icons.arrow_forward_ios,
            label: 'التالي',
            onTap: widget.onNext,
            onLongPress: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required VoidCallback onLongPress,
    bool isActive = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.blue : Colors.grey,
              size: isTablet ? 40 : 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey,
                fontSize: isTablet ? 20 : 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
