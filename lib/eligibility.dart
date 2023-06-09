import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'elegibility_screen_providor.dart';

class EligibilityScreen extends StatelessWidget {
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
        create: (context)=>EligibilityScreenProvider(),
      child: Builder(
        builder: (context){
          return Scaffold(
            appBar: AppBar(title: Text("Providor Demo"),),
            body: Container(

              color: Colors.grey,
              padding: EdgeInsets.all(16),
              child: Form(
                child: Consumer<EligibilityScreenProvider>(
                  builder: (context, provider, child){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: provider.isEligible? Colors.green:Colors.redAccent,
                        ),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(height: 16,),

                        TextFormField(
                          controller: ageController,
                          decoration: InputDecoration(
                            hintText: "Give youe age",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 16,),

                        Container(
                          width: 350,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: (){
                             final int age = int.parse(ageController.text.trim());
                             provider.checkEligibility(age);
                            },
                            child: Text("Click"),
                          ),
                        ),
                        SizedBox(height: 16,),

                        SizedBox(height: 16,),

                        Text(provider.message)

                      ],
                    );
                  }
                )


              ),
            ),
          );
        },
      ),
    );

  }
}
