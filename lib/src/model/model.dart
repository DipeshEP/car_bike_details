class Vehicle{
  String? v_no;
  String ?v_Brnd;
  String ? V_name;
  String?V_ful;
  Vehicle({
    this.v_no, this.v_Brnd,this.V_name,this.V_ful
});
  factory Vehicle.fromJson(Map<String,dynamic>responseData){
    return  Vehicle(
      v_no: responseData['VehicleNo'],
      v_Brnd: responseData['VehicleBrand'],
      V_name: responseData['VehicleName'],
      V_ful: responseData['VehicleFuel']
    );
  }
}