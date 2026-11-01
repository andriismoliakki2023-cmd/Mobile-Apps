import 'package:flutter/material.dart';
import 'package:lab_02/widgets/app_card.dart';
import 'package:lab_02/widgets/info_tile.dart';

/// Картка зі списком рядків [InfoTile], розділених лініями.
class InfoCard extends StatelessWidget {
  const InfoCard({required this.tiles, super.key});

  final List<InfoTile> tiles;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < tiles.length; i++) ...<Widget>[
            if (i > 0) const Divider(height: 1),
            tiles[i],
          ],
        ],
      ),
    );
  }
}
