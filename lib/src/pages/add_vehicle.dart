import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehicledetails/src/pages/homepage.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController vehicleNoController= TextEditingController();
  String? selectedBrand="Honda";
  String? selectedVehicleType="Bike";
  String? selectedFuelType = "Petrol";
  final BrandName = ['BMW', 'Honda','Toyota','Tata' ,'kia','Java'];
  final VehicleType = ['Bike', 'Car'];
  final fuelType = ['Diesel', 'Petrol'];
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Vehicle Registration Form "),
        centerTitle: true,
      ),
      body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("Enter Vehicle Number:", style: TextStyle(fontSize: 18),),

                VehicleNoTextFormField(),
                SizedBox(
                  height: 20,
                ),
               Text("Brand Name",style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
               CustomDropDownList(
                 items: BrandName,
                 itemSelected: selectedBrand,
               ),
                SizedBox(
                  height: 20,
                ),
              Text("Vehicle Type",style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
              CustomDropDownList(
                items: VehicleType,
                itemSelected: selectedVehicleType,
              ),
                SizedBox(
                  height: 20,
                ),
                Text("Fuel Type",style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                CustomDropDownList(
                  items: fuelType,
                  itemSelected: selectedFuelType,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                  ),
                  child: ElevatedButton(onPressed: (){
                    // print(vehicleNoController.text);
                    // print(selectedBrand);
                    // print(selectedVehicleType);
                    // print(selectedFuelType);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },

                      child: Text("Submit",style: TextStyle( fontSize: 20),)),
                )
              ],
            ),
          ),
      ),
    );
  }


  VehicleNoTextFormField() {
    return Column(
      children: [

        SizedBox(height: 10),
        TextFormField(
          controller: vehicleNoController,
          decoration: InputDecoration(
              hintText: "Vehicle No",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black))),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Vehicle Number ";
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

}

class CustomDropDownList extends StatefulWidget {
  CustomDropDownList({Key? key, required this.items, this.itemSelected}) : super(key: key);
  String? itemSelected;
  final List<String> items;
  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  String ? demmivar;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide())),
        value: widget.itemSelected,
        items: widget.items
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList(),
        onChanged: (e) {
          setState(() {
            widget.itemSelected = e;
            demmivar=widget.itemSelected;
          });

        });
  }
}
