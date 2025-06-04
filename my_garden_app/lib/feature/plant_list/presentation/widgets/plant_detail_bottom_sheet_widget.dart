import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_garden_app/feature/plant_list/presentation/pages/plant_card_page.dart';
import 'package:path_provider/path_provider.dart';

class PlantDetailSheet extends StatefulWidget {
  final Plant plant;

  const PlantDetailSheet({
    super.key,
    required this.plant,
  });

  @override
  State<PlantDetailSheet> createState() => _PlantDetailSheetState();
}

class _PlantDetailSheetState extends State<PlantDetailSheet> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _handleAddPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final File imageFile = File(image.path);
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final Directory appDir = await getApplicationDocumentsDirectory();
    final File savedImage = await imageFile.copy('${appDir.path}/$fileName');

    final Photo newPhoto = Photo(
      plantId: "0",
      localPath: savedImage.path,
      isSynced: false,
      createdAt: DateTime.now(),
    );

    setState(() {
      widget.plant.photos.add(newPhoto);
    });
  }

  void _handleSync() {}

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _PhotoSlider(photos: widget.plant.photos),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.plant.name,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _handleAddPhoto,
                  ),
                  IconButton(
                    icon: const Icon(Icons.sync),
                    onPressed: _handleSync,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(title: 'Группа', value: widget.plant.group),
                  _InfoRow(title: 'Семейство', value: widget.plant.family),
                  _InfoRow(
                    title: 'Дата посадки',
                    value: widget.plant.plantingDate,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Описание',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.plant.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoSlider extends StatefulWidget {
  final List<Photo> photos;

  const _PhotoSlider({required this.photos});

  @override
  State<_PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<_PhotoSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: widget.photos.isEmpty
              ? _buildEmptyState()
              : PageView.builder(
                  controller: _pageController,
                  itemCount: widget.photos.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(widget.photos[index].localPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 8),
        _PageIndicator(
          count: widget.photos.length,
          currentIndex: _currentPage,
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_camera, size: 40, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              'Нет фотографий',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const _PageIndicator({
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: index == currentIndex ? 16 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: index == currentIndex
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
