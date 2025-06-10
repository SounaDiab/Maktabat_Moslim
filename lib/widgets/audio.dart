import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/services.dart';

class Audio extends StatefulWidget {
  Audio({super.key, required this.music});
  String music;

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(
                          color: isPlaying ? Colors.red : Colors.blue))),
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(isTablet ? 10 : 0),
              ),
            ),
            onPressed: () async {
              if (isPlaying) {
                await player.stop();
              } else {
                await player.play(AssetSource(widget.music));
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Icon(
              isPlaying ? Icons.stop : Icons.play_arrow,
              color: isPlaying ? Colors.red : Colors.green,
              size: isTablet ? 80 : 30,
            ),
          ),
        ),
      ],
    );
  }
}

// class Audio extends StatefulWidget {
//   Audio({super.key, required this.music});
//   String music;

//   @override
//   State<Audio> createState() => _AudioState();
// }

// class _AudioState extends State<Audio> {
//   final AudioPlayer player = AudioPlayer();
//   bool isPlaying = false;

//   static const MethodChannel _channel = MethodChannel('audio_pad_channel');

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   Future<void> _handlePlayPADAudio(String filename) async {
//     try {
//       final String filePath =
//           await _channel.invokeMethod('loadAsset', {'filename': filename});
//       await player.play(DeviceFileSource(filePath));
//     } catch (e) {
//       print('Error playing PAD audio: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth >= 600;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: ElevatedButton(
//             style: ButtonStyle(
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                   side: BorderSide(color: isPlaying ? Colors.red : Colors.blue),
//                 ),
//               ),
//               padding: MaterialStateProperty.all<EdgeInsets>(
//                 EdgeInsets.all(isTablet ? 10 : 0),
//               ),
//             ),
//             onPressed: () async {
//               if (isPlaying) {
//                 await player.stop();
//               } else {
//                 await _handlePlayPADAudio(widget.music); // تشغيل من PAD
//               }
//               setState(() {
//                 isPlaying = !isPlaying;
//               });
//             },
//             child: Icon(
//               isPlaying ? Icons.stop : Icons.play_arrow,
//               color: isPlaying ? Colors.red : Colors.green,
//               size: isTablet ? 80 : 30,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
