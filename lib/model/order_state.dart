class OrderState{
  int state_id;
  String state_name;
  String state_description;
  String state_color;
  String state_bgcolor;

  OrderState(
      {this.state_id, this.state_name, this.state_description,this.state_color,this.state_bgcolor});

  factory OrderState.fromJson(Map<String, dynamic> parsedJson){
    String color;
    String bgcolor;
    String description;
    var id ;
    
    if (parsedJson == null){
      id = null;
      return OrderState(
        state_id: 0,
        state_name: 'รอจัดยา',
        state_description: 'รอจัด',
        state_color: '#FFFFFF', 
        state_bgcolor: '#0000FF'
    );
    }else{
      id = parsedJson['state_id'];
      if (id == 1){
        color= '#FFFFFF'; 
        bgcolor= '#FF0000';
        description = 'กำลังจัด';
      }else if (id ==2 ){
        color= '#FFFFFF'; 
        bgcolor= '#FF0000';
        description = 'กำลังจัด';
      }else if (id ==3 ){
        color= '#000000'; 
        bgcolor= '#FFFF00';
        description = 'กำลังตรวจสอบ';
      }else if (id ==4 ){
        color= '#FFFFFF'; 
        bgcolor= '#066D24';
        description = 'รอเรียกคิว';
      }else if (id ==5 ){
        color= '#FFFFFF'; 
        bgcolor= '#066D24';
        description = 'รอเรียกคิว';
      }else if (id ==6 ){  
        color= '#FFFFFF';       
        bgcolor = parsedJson['state_color'];
        description = parsedJson['state_description'];
      }else if (id ==7 ){
        color= '#FFFFFF'; 
        bgcolor = parsedJson['state_color'];
        description = parsedJson['state_description'];
      }else{
        color= '#FFFFFF'; 
        bgcolor = parsedJson['state_color'];
        description = parsedJson['state_description'];
      }
    }
    
    return OrderState(
        state_id: parsedJson['state_id'],
        state_name: parsedJson['state_name'],
        state_description: description,
        state_color: color,
        state_bgcolor: bgcolor
    );
  }
}


