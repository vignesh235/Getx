import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Audioplayerview extends StatefulWidget {
  const Audioplayerview({super.key});

  @override
  State<Audioplayerview> createState() => _AudioplayerviewState();
}

class _AudioplayerviewState extends State<Audioplayerview> {
  List<String> audioList = [
    "sounds/audio1.mp3",
    "sounds/audio2.mp3",
    "sounds/audio3.mp3"
  ];
  Map<int, dynamic> pickedList = {};
  late File file;

  final AudioPlayer audioPlayer = AudioPlayer();
  bool isAudioPlaying = false;
  static const Color vbBlue = Color(0xff24215A);
  double indicatorValue = 0.0;
  double maxDuration = 0.0;
  bool playFromPickedFile = false;
  int playingIndex = 0;
  @override
  void initState() {
    super.initState();
    setAudioSource();
    // audioPlayer.setSourceUrl(url); // equivalent to setSource(UrlSource(url));
    audioStreams();
  }

  void audioStreams() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        log("Audio is playing");
      } else if (event == PlayerState.paused) {
        log("Audio is paused");
      } else if (event == PlayerState.stopped) {
        log("Audio stopped");
      }
    });

    audioPlayer.onDurationChanged.listen((Duration totalDuration) {
      maxDuration = totalDuration.inSeconds.toDouble();
      log("macduration:$maxDuration");
    });
    audioPlayer.onPositionChanged.listen((Duration duration) {
      if (maxDuration > 0) {
        double progress = duration.inSeconds.toDouble() / maxDuration;

        setState(() {
          indicatorValue = progress;
        });
      }
    });
  }

  void setAudioSource() async {
    // await audioPlayer.setSource(AssetSource(audioList.first));
  }

  void pickFiles() async {
    pickedList.clear();
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.audio, allowMultiple: true);

    if (result != null) {
      if (result.files.length > 1) {
        result.files.asMap().forEach((index, file) {
          pickedList[index] = file.path;
        });
        audioPlayer.setSourceDeviceFile(pickedList[playingIndex]);
      } else {
        file = File(result.files.single.path!);
        audioPlayer.setSourceDeviceFile(file.path);
      }

      playFromPickedFile = true;
    } else {
      // User canceled the picker
      log("user cancelled the file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: vbBlue,
        // appBar: AppBar(
        //   backgroundColor: Colors.,
        //   title: const Text("Audio Player"),
        //   centerTitle: true,
        // ),
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "assets/images/music.png",
                              fit: BoxFit.fill,
                              width: Get.width * 0.7,
                            ),
                            Positioned.fill(
                                child: CircularProgressIndicator(
                              value: indicatorValue,
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await choosePreviousFile();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            IconButton(
                              onPressed: () async {
                                if (audioPlayer.source == null &&
                                    playFromPickedFile) {
                                  Get.snackbar("No files to play",
                                      "Please select some audio to play",
                                      colorText: Colors.white);
                                  return;
                                }
                                if (isAudioPlaying) {
                                  await audioPlayer.pause();
                                } else {
                                  await audioPlayer.resume();
                                }

                                setState(() {
                                  isAudioPlaying = !isAudioPlaying;
                                });
                              },
                              icon: Icon(isAudioPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle_sharp),
                              color: Colors.white,
                            ),
                            IconButton(
                                onPressed: () async {
                                  await chooseNextFile();
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Divider(),
                        ElevatedButton(
                            onPressed: () async {
                              await audioPlayer.pause();
                              pickFiles();
                            },
                            child: Text("Pick file")),
                        ElevatedButton(
                            onPressed: () async {
                              await audioPlayer.pause();
                              playFromPickedFile = false;
                              playingIndex = 0;
                            },
                            child: Text("Play from added assets")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> choosePreviousFile() async {
    if (playFromPickedFile) {
      if (pickedList.isNotEmpty) {
        await audioPlayer.pause();

        playingIndex--;
        if (playingIndex <= 0) {
          playingIndex = pickedList.length;
        }
        await audioPlayer.play(DeviceFileSource(pickedList[playingIndex]));
      }
    } else {
      playingIndex--;
      if (playingIndex <= 0) {
        playingIndex = audioList.length;
      }
      await audioPlayer.play(AssetSource(audioList[playingIndex]));
    }
  }

  Future<void> chooseNextFile() async {
    if (playFromPickedFile) {
      if (pickedList.isNotEmpty) {
        await audioPlayer.pause();

        playingIndex++;
        if (playingIndex >= pickedList.length) {
          playingIndex = 0;
        }
        await audioPlayer.play(DeviceFileSource(pickedList[playingIndex]));
      }
    } else {
      playingIndex++;
      if (playingIndex >= audioList.length) {
        playingIndex = 0;
      }
      await audioPlayer.play(AssetSource(audioList[playingIndex]));
    }
  }
}
