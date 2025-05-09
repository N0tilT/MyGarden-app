import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PlantDetailPage extends StatefulWidget {
  final Plant plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plant.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: _syncPhotos,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Секция с фотографиями
            _buildPhotoSlider(),
            
            // Индикатор страниц
            _buildPageIndicator(),
            
            // Информация о растении
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.plant.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow('Группа', widget.plant.group),
                  _buildInfoRow('Семейство', widget.plant.family),
                  _buildInfoRow('Дата посадки', widget.plant.plantingDate),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhoto,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildPhotoSlider() {
    return SizedBox(
      height: 300,
      child: widget.plant.photos.isEmpty
          ? _buildEmptyPhotoPlaceholder()
          : PageView.builder(
              controller: _pageController,
              itemCount: widget.plant.photos.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final photo = widget.plant.photos[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: photo.isSynced
                        ? CachedNetworkImage(
                            imageUrl: photo.serverUrl!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )
                        : Image.file(File(photo.localPath), fit: BoxFit.cover),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.plant.photos.length, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
          ),
        );
      }),
    );
  }

  Widget _buildEmptyPhotoPlaceholder() {
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
            Icon(Icons.photo_camera, size: 50, color: Colors.grey[400]),
            Text(
              'Добавьте первое фото',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Future<void> _addPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final File imageFile = File(image.path);
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final Directory appDir = await getApplicationDocumentsDirectory();
    final File savedImage = await imageFile.copy('${appDir.path}/$fileName');

    final Photo newPhoto = Photo(
      plantId: widget.plant.id,
      localPath: savedImage.path,
      isSynced: false,
      createdAt: DateTime.now(),
    );

    setState(() {

    widget.plant.photos.add(newPhoto);
    });
  }

  Future<void> _syncPhotos() async {
    // Логика синхронизации
  }
}

// Модели данных
class Plant {
  final String id;
  final String name;
  final String group;
  final String family;
  final String plantingDate;
  final String description;
  final List<Photo> photos;

  Plant({
    required this.id,
    required this.name,
    required this.group,
    required this.family,
    required this.plantingDate,
    required this.description,
    required this.photos,
  });
}

class Photo {
  final int? id;
  final String plantId;
  final String localPath;
  final String? serverUrl;
  final bool isSynced;
  final DateTime createdAt;

  Photo({
    this.id,
    required this.plantId,
    required this.localPath,
    this.serverUrl,
    required this.isSynced,
    required this.createdAt,
  });
}
