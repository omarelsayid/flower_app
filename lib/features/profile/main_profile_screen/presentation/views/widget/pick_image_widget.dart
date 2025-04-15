import 'dart:io';

import 'package:flower_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.imageFile,
    required this.onPressed,
    this.isImageUploaded = false,
    this.imagePath,
  });
  final File? imageFile;
  final void Function()? onPressed;
  final bool isImageUploaded;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffF7F7FC),
            radius: 50,
            backgroundImage:
                imageFile != null
                    ? FileImage(imageFile!)
                    : isImageUploaded
                    ? NetworkImage(imagePath!)
                    : AssetImage(ImageAssets.profileImage),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: CircleAvatar(
              backgroundColor: const Color(0xffF7F7FC),
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.camera_alt, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
