import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theming/text_styles.dart';
import '../cubit/add_post_cubit.dart';
import '../cubit/add_post_states.dart';

class AddPhotoItem extends StatelessWidget {
  const AddPhotoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostStates>(
      builder: (context, state) {
        var cubit = AddPostCubit.get(context);
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Choose image source'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('Camera'),
                        onTap: () {
                          Navigator.of(context).pop();
                          cubit.imagePickerPhoto(ImageSource.camera);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.image),
                        title: const Text('Gallery'),
                        onTap: () {
                          Navigator.of(context).pop();
                          cubit.imagePickerPhoto(ImageSource.gallery);
                        },
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Column(
            children: [
              cubit.imageFile == null
                  ? Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image,
                      size: 70,
                    ),
                  ),
                  Text(
                    'Add Photo',
                    style: TextStyles.font25BlackMedium,
                  ),
                  const Divider(color: Colors.black),
                ],
              )
                  : Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(cubit.imageFile!),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
