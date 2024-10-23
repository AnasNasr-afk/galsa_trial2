import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galsa_trial2/features/add_post_screen/cubit/add_post_states.dart';
import 'package:galsa_trial2/features/home_screen/models/post_model.dart';
import 'package:image_picker/image_picker.dart';

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostCubit() : super(AddPostInitialState());

  static AddPostCubit get(context) => BlocProvider.of(context);

  var titleController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  var addressController = TextEditingController();

  List<PostModel> posts = [];
  File? imageFile;
  ImagePicker imagePicker = ImagePicker();

  void imagePickerPhoto(ImageSource source) async {
    emit(AddPhotoLoadingState());
    try {
      var pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        debugPrint('Image selected: ${pickedFile.path}');
        emit(AddPhotoSuccessState());
      } else {
        debugPrint('Picked file is empty');
        emit(AddPhotoErrorState());
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      emit(AddPhotoErrorState());
    }
  }

  void createPost({
    required String price,
    required String title,
    required String address,
    required String description, required File image,
  }) async {
    if (imageFile == null) {
      debugPrint('No image selected!');
      emit(AddPostErrorState());
      return;
    }

    emit(AddPostLoadingState());
    debugPrint('Starting image upload...');

    try {
      final ref = FirebaseStorage.instance.ref().child('posts/${Uri.file(imageFile!.path).pathSegments.last}');
      final uploadTask = ref.putFile(imageFile!);
      final snapshot = await uploadTask;

      final downloadUrl = await snapshot.ref.getDownloadURL();
      debugPrint('Image uploaded successfully. Download URL: $downloadUrl');

      // Create PostModel and save to Firestore
      PostModel postModel = PostModel(
        image: downloadUrl, // Use the download URL here
        price: price,
        title: title,
        location: address,
        description: description,
      );

      await FirebaseFirestore.instance.collection('posts').add(postModel.toMap());
      debugPrint('Post added to Firestore successfully');
      emit(AddPostSuccessState());
    } catch (error) {
      debugPrint('Error creating post: $error');
      emit(AddPostErrorState());
    }
  }

}