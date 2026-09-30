import 'package:flutter/material.dart';
import '../theme/user_profile_styles.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color headerColor;
  final List<Widget> children;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.headerColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: UserProfileStyles.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: headerColor),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: headerColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class ReadonlyField extends StatelessWidget {
  final String label;
  final String value;

  const ReadonlyField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: UserProfileStyles.labelStyle),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: UserProfileStyles.scaffoldBg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: UserProfileStyles.borderSide),
          ),
          child: Text(
            value,
            style: UserProfileStyles.valueStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class RoleChip extends StatelessWidget {
  final String label;

  const RoleChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: UserProfileStyles.osnocBgBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: UserProfileStyles.chipBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 12, color: UserProfileStyles.osnocLightBlue),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: UserProfileStyles.chipText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}