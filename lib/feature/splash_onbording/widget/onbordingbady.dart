import 'package:flutter/material.dart';
import 'package:truetone/core/utiles/app_textstyle.dart';


class Onbordingbady extends StatefulWidget {
  const Onbordingbady({super.key});

    static String id = "onbording";

  @override
  State<Onbordingbady> createState() => _OnbordingbadyState();
}

class _OnbordingbadyState extends State<Onbordingbady> {
  PageController _pageController=PageController();
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
        children: [
          Expanded(child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
           setState(() {
             index=value;
           });
            },
            children: [
             

               Container(
                 
                      child:Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                     
                        Image.asset("assets/images/onp1.png",
                          height: MediaQuery.of(context).size.height *.33,
                         width: MediaQuery.of(context).size.width *.6,
                          ),
                                 Container(height: 10,),
                         
                          Center(child: Text("Difference between ",style:TextstyleConst.texts28.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)
                         ,textAlign:TextAlign.center ,)),
                          Center(child: Text(" real and feke sound",style:TextstyleConst.texts28.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)
                         ,textAlign:TextAlign.center ))
                      ],
                    ),),


                       Container(
                      padding: EdgeInsets.all(10),
                      child:Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                     
                        Image.asset("assets/images/onp2.png",
                       height: 200,
                          ),
                            Image.asset("assets/images/onp22.png",
                       height: 70,
                          ),
                                 Container(height: 30,),
                         
                          Center(child: Text("Detect artificial voices  ",style:TextstyleConst.texts28.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)
                         ,textAlign:TextAlign.center ,)),
                          Center(child: Text("and protect yourself",style:TextstyleConst.texts28.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)
                         ,textAlign:TextAlign.center ))
                      ],
                    ),),


                       Container(
                      padding: EdgeInsets.all(10),
                      child:Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                     
                        Image.asset("assets/images/onp1.png",
                          height: MediaQuery.of(context).size.height *.33,
                         width: MediaQuery.of(context).size.width *.6,
                          ),
                                 Container(height: 10,),
                         
                          Center(child: Text("Quick identification of the  ",style:TextstyleConst.texts28.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)
                         ,textAlign:TextAlign.center ,)),
                          Center(child: Text(" sound's source using Ai",style:TextstyleConst.texts28.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)
                         ,textAlign:TextAlign.center ))
                      ],
                    ),),

            ],
          )),


//عايز اقلل المسافه دي اي الحل
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customindicator(actaive: index==0),
              SizedBox(width: 5,),
               customindicator(actaive: index==1),
                    SizedBox(width: 5,),
                customindicator(actaive: index==2),

          ],),
SizedBox(height: 20,),
          
          Padding(
            padding: const EdgeInsets.only(bottom:5,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                 
                  child: Container(
                    height: MediaQuery.of(context).size.height *.06,
                    width: MediaQuery.of(context).size.width *.88,
                    decoration: BoxDecoration(
                           color: Color(0xff2D3ECF),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: MaterialButton(onPressed:(){
                   
 if(index==2){
                    //gorouter.of  =>>>>>>>>>>>>>>>>>>>>>>>home scaren
                    }
                       _pageController.jumpToPage(index+1,);

                    },
                  
                               
                    child: Text(index==2?"Get start":"Next",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:MediaQuery.of(context).size.height *.2,)
        ],
      ),
    );
  }
}




class customindicator extends StatelessWidget {
  final  bool actaive;
  const customindicator({super.key, required this.actaive});
 

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration:Duration(milliseconds: 250),
    height: 10,
    width: actaive?30:10,
    decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(100)
     ,color:actaive?Color(0xff2D3ECF):const Color.fromARGB(235, 158, 158, 158)
     
    ),
    );
  }
}