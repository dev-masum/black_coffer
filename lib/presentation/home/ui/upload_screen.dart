import 'package:black_coffer/presentation/home/logic/post_form_cubit.dart';
import 'package:black_coffer/presentation/home/ui/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class PostVideoScreen extends StatefulWidget {
  final XFile xFile;
  final Position position;

  const PostVideoScreen({
    Key? key,
    required this.xFile,
    required this.position,
  }) : super(key: key);

  @override
  State<PostVideoScreen> createState() => _PostVideoScreenState();
}

class _PostVideoScreenState extends State<PostVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostFormCubit(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.cancel),
                  ),
                ),
              ],
            ),
            VideoPlayerWidget(
              xFile: widget.xFile,
            ),
            BlocBuilder<PostFormCubit, PostFormState>(
              builder: (context, state) {
                return TextFormField(
                  onChanged: (String value) {
                    context.read<PostFormCubit>().titleChanged(value);
                  },
                  decoration: InputDecoration(
                    errorText: state.isValidTitle ? null : "Can't be Empty",
                    hintText: "Title",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                );
              },
            ),
            BlocBuilder<PostFormCubit, PostFormState>(
              builder: (context, state) {
                return TextFormField(
                  onChanged: (String value) {
                    context.read<PostFormCubit>().categoryChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Category",
                    errorText: state.isValidCategory ? null : "Can't be Empty",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                );
              },
            ),
            BlocBuilder<PostFormCubit, PostFormState>(
              builder: (context, state) {
                return TextFormField(
                  onChanged: (String value) {
                    context.read<PostFormCubit>().descriptionChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Description",
                    errorText:
                        state.isValidDescription ? null : "Can't be Empty",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                );
              },
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText:
                    "location: latitude: ${widget.position.latitude} longitude: ${widget.position.longitude}",
              ),
            ),
            BlocBuilder<PostFormCubit, PostFormState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state.isValidDescription &&
                        state.isValidCategory &&
                        state.isValidTitle) {
                      print("Ready to post");
                      //TODO: postVideo();
                    }
                  },
                  child: const Text("Post"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
