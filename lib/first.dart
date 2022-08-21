import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AssetsAudioPlayer player = AssetsAudioPlayer();
   bool playinggg = false;
  @override
  void initState()
  {
    super.initState();
    player.open(Audio("asset/Kesariya.mp3"),autoStart: false);
  }
   void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    player.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(title: const Text("Playing music using Flutter API")),
      backgroundColor: Colors.deepPurple[50],
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[Image.network("asset/dil_na_jaaneya.jpg",width: 250,height: 250,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
            InkWell(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tooltip(child: Icon(CupertinoIcons.backward_fill,size: 30,color: Colors.blue[300])
              , message: "Click to rewind",),
            ),
            onTap:() {
              player.seekBy(Duration(seconds: -10));
              
            }
            ),
            SizedBox(height: 10),
            InkWell(
            onTap:() async {
             setState(()
              {
                if(player.isPlaying.value == playinggg)
                {
                  player.play();
                }
                else
                {
                  player.pause();
                }
              });
            }, 
            // onHover: (isHovering)
            // {
            //   if(isHovering)
            //   {r
            //     SnackBar: Text("Double tap to play from beginning");
            //   }
            // },
            child: Tooltip(
              child: Icon(
                player.isPlaying.value
                  ? CupertinoIcons.pause_circle_fill
                  : CupertinoIcons.arrowtriangle_right_circle_fill ,size: 40,color: Colors.blue ),
                  message: "CLick thrice to play from beginning",
            ),
            onDoubleTap: () {
              player.open(Audio("asset/DilNaJaaneya.mp3"),autoStart: false);

            },
            ),

              InkWell(child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tooltip(child: Icon(CupertinoIcons.forward_fill,size: 30,color: Colors.blue[300]),
                message: "CLick to forward",),
              ),
              onTap: () {
                player.seekBy(const Duration(seconds: 10));
              },
            //   onHover: (isHovering)
            // {
            //   if(isHovering)
            //   {
            //     SnackBar: Text("Double tap to play from beginning");
            //   }
            // }
              ),
            ],
          ),
        )
     ] )
    );
  }
}
