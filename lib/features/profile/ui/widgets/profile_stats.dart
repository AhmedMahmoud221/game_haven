import 'package:flutter/material.dart';
import 'package:game_haven/core/theming/styles.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _StatItem(label: 'Games', value: '42'),
        _StatItem(label: 'Achievements', value: '128'),
        _StatItem(label: 'Friends', value: '1.2k'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label, value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(value, style: TextStyles.font18WhiteMedium),
      Text(label, style: TextStyles.font13GreyRegular),
    ],
  );
}