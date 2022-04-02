import 'dart:math';

import 'package:coder_push_interview/models/user_response_model.dart';
import 'package:coder_push_interview/screens/home_screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


class TinderCard extends StatefulWidget {
  TinderCard(this.userBasicInfo, this.isFront, {Key? key}) : super(key: key);
  UserBasicInfo userBasicInfo;
  bool isFront;
  final controller = Get.find<HomeScreenController>();
  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      widget.controller.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.user.)
    return SizedBox.expand(
      child: widget.isFront ? buildFrontCard() : buildCard(),
    );
  }

  Widget buildCard() {
    //print(widget.user.picture!);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.userBasicInfo.picture!),
              fit: BoxFit.cover,
              alignment: const Alignment(-0.3, 0),
            )), child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7,1],
            )
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              buildName(),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget buildFrontCard() => GestureDetector(
        child: LayoutBuilder(
          builder: (context, constraint) {
            final position =  widget.controller.position.value;
            final milis =  widget.controller.isDragging.value ? 0 : 400;
            final angle =  widget.controller.angle.value * pi / 180;
            final center = constraint.smallest.center(Offset.zero);
            final rotatedMatrix = Matrix4.identity()
              ..translate(center.dx, center.dy)
              ..rotateZ(angle)
              ..translate(-center.dx, -center.dy);
            return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: milis),
                transform: rotatedMatrix..translate(position.dx, position.dy),
                child: Stack(children: [
                  buildCard(),
                  buildStamps(),
                ],));
          },
        ),
        onPanStart: (details) {
          widget.controller.startPosition(details);
        },
        onPanUpdate: (details) {
          widget.controller.updatePosition(details);
        },
        onPanEnd: (details) {
          widget.controller.endPosition();
        },
      );

  buildStamps(){
    final status =  widget.controller.getStatus();
    final opacity =  widget.controller.getStatusOpacity();
    switch(status){
      case CardStatus.like:
        final child = buildStamp(angle:-0.5, color:Colors.green, text: 'LIKE', opacity: opacity);
        return Positioned(child: child, top: 30,left: 30,);
      case CardStatus.superLike:
        final child = buildStamp( color:Colors.blue, text: 'SUPER LIKE',opacity: opacity);
        return Positioned(child: child, bottom: 128,);
      case CardStatus.dislike:
         final child = buildStamp(angle:-0.5, color:Colors.red, text: 'DISLIKE',opacity: opacity);
        return Positioned(child: child, top: 30,right: 30,);
      default: return Container();
    }
  }
  buildStamp({double angle = 0, required Color color, required String text, required opacity}){
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 4),

          ),
          child: Text(
            text, textAlign: TextAlign.center,
            style: TextStyle(
              color: color, fontSize: 48, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  buildName(){
    return GetBuilder<HomeScreenController>(builder: (controller){
      return  Row(
        children: [
          Text("${widget.userBasicInfo.lastName}", style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(width: 16,),
          Text(
            controller.ageUserToShow.value>0 ? "${controller.ageUserToShow.value}" : "" ,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          )
        ],
      );
    },

    );
  }
}
