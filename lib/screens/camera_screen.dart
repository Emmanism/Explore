import 'dart:math';
import 'package:camera/camera.dart';
import 'package:explore/screens/camera_view_screen.dart';
import 'package:explore/screens/video_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:explore/theme.dart';
import 'package:explore/widgets/actions_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({
    required this.onImageSend,
  });

  final Function onImageSend;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

  late List<CameraDescription> cameras ; 


class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  bool isRecording = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0],ResolutionPreset.high);
    cameraValue = _cameraController.initialize();

  }

   @override
  void dispose() {
     // TODO: implement dispose

      super.dispose();
    _cameraController.dispose();
    

  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.accent,
        elevation:0,
        centerTitle:false,
          title: const Text(
            'Explore',
            style:TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )
          ),
          actions:<Widget>[
                Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
             child:Center(
               child: ActionsButton(
                icon:CupertinoIcons.search,
                onTap:(){},
               ),
             ),
            ),
               PopupMenuButton(
                itemBuilder: (context) =>[
                   const PopupMenuItem(  
                      child: Text('Setting',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,  
                      fontSize: 14.0,      
                    )
                    ),
              ),
                ],
                 child: Padding(
                   padding: const EdgeInsets.only(
                    right:10.0,
                   ),
                   child: Center(
                    child: ActionsButton(
                      icon: CupertinoIcons.ellipsis_vertical,
                       onTap: (){},
                       ),
                             ),
                 ),
               ),
            

          ]
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder:(context,snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                // ignore: sized_box_for_whitespace
                return Container(
                  width:MediaQuery.of(context).size.width,  
                  height:MediaQuery.of(context).size.height,  
                  child: CameraPreview(_cameraController));
              } else{
                return const Center(
                  child:CircularProgressIndicator(),
                );
              }
            }),
            Positioned(
              bottom: 0.0,
              child: Container(
                color:Colors.black,
                width:MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                     IconButton(
                       icon: Icon(
                          flash ? Icons.flash_on :Icons.flash_off,
                          color: Colors.white,
                          size:28,
                       ),
                        onPressed: (){
                          setState(() {
                            flash = !flash;
                          });
                          flash ? _cameraController.setFlashMode(FlashMode.torch) :
                          _cameraController.setFlashMode(FlashMode.off);
                        },
                     ),
                      
                         GestureDetector(
                          onLongPress:() async{
                                await _cameraController.startVideoRecording(); 
                              setState(() {
                                isRecording = true;
                              });
                              
                          },
                          onLongPressUp:() async{
                            XFile videopath = await _cameraController.stopVideoRecording();
                            setState(() {
                              isRecording = true;
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(
                              builder: (builder) =>VideoViewScreen(
                                path:videopath.path
                              )));
                          },
                             onTap: (){
                              if(!isRecording) {
                                takePhoto(context);
                              }
                             },
                             child: isRecording
                             ? const Icon(
                              Icons.radio_button_on,
                              color: Colors.red,
                              size:80,
                           )
                             : const Icon(
                              Icons.panorama_fish_eye,
                              color: Colors.white,
                              size:70,
                             ),
                         ),
                        IconButton(
                          icon: Transform.rotate(
                            angle: transform,
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size:28,
                            ),
                          ),
                          onPressed: () async{
                            setState(() {
                              iscamerafront = !iscamerafront;
                              transform = transform + pi;
                            });
                            int cameraPos = iscamerafront ? 0 : 1;
                             _cameraController = CameraController(
                              cameras[cameraPos],ResolutionPreset.high);
                             cameraValue = _cameraController.initialize();
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                   const  Text('Hold for video,Tap for Photo',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    )
              
                  ],
                ),
                
              ),
            ),

        ],
      ),
    );
  }



  void takePhoto(BuildContext context) async {
    final path = join(
      (await getTemporaryDirectory()).path, '${DateTime.now()}.png');
    XFile picture =  await  _cameraController.takePicture();
     picture.saveTo(path);

    // ignore: use_build_context_synchronously
    Navigator.push(
      context, MaterialPageRoute(
        builder: (builder)=>  CameraViewScreen(
          path: path,
          onImageSend: widget.onImageSend,
          )
        ));

  }
}