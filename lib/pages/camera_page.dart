import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:explore/screens/camera_view_screen.dart';
import 'package:explore/screens/video_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../screens/camera_screen.dart';

class CameraPage extends StatefulWidget {
const CameraPage({required this.cameras});


final List<CameraDescription> cameras; 

  @override
  State<CameraPage> createState() => _CameraPageState();
}


  

class _CameraPageState extends State<CameraPage> {
   late CameraController _cameraController;
  late Future<void> cameraValue;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  bool isRecording = false;
  int popTime = 0;

   
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

        
void onImageSend(String path,String message) async{
      print('hey there,it\'s working $message');
    /*   for(int i=0;i < popTime; i++){
        Navigator.pop(context);
      } */
      setState(() {
        popTime = 0;
      }); 

    var request = http.MultipartRequest(
      'POST',Uri.parse('http://192.168.43.199:5000/routes/addImage'));
      request.files.add(await http.MultipartFile.fromPath('img', path));
      request.headers.addAll(
        {'content-type':'multipart/form-data',
        });
       /*  http.StreamedResponse response = await request.send(); // to the backend user response
        var httpResponse = await http.Response.fromStream(response);
        var data = json.decode(httpResponse.body);
        print(data['path']); */
        await request.send().then((response) {
        http.Response.fromStream(response).then((value) {
        print(value.statusCode);    
        print(value.body);
        });
        });
    } 

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onImageSend: onImageSend,
          )
        ));

  }
  }

