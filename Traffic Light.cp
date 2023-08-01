#line 1 "D:/Faculty/Training/ES/Project/Traffic Light.c"




int M_Counter , M_SW_Cur = 0 , M_SW_Lst = 0 ;

int index ;









int Number[] = { 0x00 , 0x01 , 0x02 , 0x03 , 0x04 , 0x05 ,
 0x06 , 0x07 , 0x08 , 0x09 , 0x10 , 0x11 ,
 0x12 , 0x13 , 0x14 , 0x15 , 0x16 , 0x17 ,
 0x18 , 0x19 , 0x20 , 0x21 , 0x22 , 0x23 ,
 0x24 , 0x25 , 0x26 , 0x27 , 0x28 , 0x29 ,
 0x30 , 0x31 , 0x32 , 0x33 , 0x34 , 0x35 ,
 0x36 , 0x37 , 0x38 };

void Manual(){
 M_Counter = 1 ;
 portb = 0x00 ;
  portc.b5  = 0 ;
  portc.b4  = 1 ;
  portc.b6  = 0 ;
  portc.b7  = 0 ;
  portd.b0  = 0 ;
  portd.b1  = 1 ;
 while(  portd.b2  == 1 ){
 M_SW_Cur =  portd.b3  ;
 if( M_SW_Cur == 1 && M_SW_Lst == 0 ){
 ++M_Counter ;
 if( M_Counter == 1 ){
  portc.b5  = 0 ;
  portc.b4  = 1 ;
  portc.b6  = 0 ;
  portc.b7  = 0 ;
  portd.b0  = 0 ;
  portd.b1  = 1 ;
 }
 if( M_Counter == 2 ){
  portc.b5  = 1 ;
  portc.b4  = 0 ;
  portc.b6  = 0 ;
  portc.b7  = 1 ;
  portd.b0  = 0 ;
  portd.b1  = 0 ;
 for( index = 0 ; index <= 3 ; ++index ){
 portb = Number[index];
 delay_ms(1000);
 }
 }
 if( M_Counter == 3 ){
  portc.b5  = 0 ;
  portc.b4  = 0 ;
  portc.b6  = 1 ;
  portc.b7  = 0 ;
  portd.b0  = 1 ;
  portd.b1  = 0 ;
 for( index = 0 ; index <= 3 ; ++index ){
 portb = Number[index];
 delay_ms(1000);
 }
 M_Counter = 0 ;
 }
 }
 M_SW_Lst = M_SW_Cur ;
 portb = Number[0];
 }
}

void Automatic(){

  portc.b4  = 0 ;
  portc.b5  = 1 ;
  portc.b6  = 0 ;

  portc.b7  = 1 ;
  portd.b0  = 0 ;
  portd.b1  = 0 ;
 while(  portd.b2  == 0 ){
 for( index = 0 ; index < 39 &&  portd.b2  == 0 ; ++index ){
 portb = Number[index];
 if( index <= 3 ){
  portc.b5  = 1 ;
  portc.b4  = 0 ;
  portc.b6  = 0 ;
  portc.b7  = 1 ;
  portd.b0  = 0 ;
  portd.b1  = 0 ;
 }
 if( index >= 4 && index <= 23 ){
  portc.b5  = 0 ;
  portc.b4  = 0 ;
  portc.b6  = 1 ;
  portc.b7  = 1 ;
  portd.b0  = 0 ;
  portd.b1  = 0 ;
 }
 if( index >= 24 && index <= 26 ){
  portc.b5  = 0 ;
  portc.b4  = 1 ;
  portc.b6  = 0 ;
  portc.b7  = 0 ;
  portd.b0  = 1 ;
  portd.b1  = 0 ;
 }
 if( index >= 27 && index <= 38 ){
  portc.b5  = 0 ;
  portc.b4  = 1 ;
  portc.b6  = 0 ;
  portc.b7  = 0 ;
  portd.b0  = 0 ;
  portd.b1  = 1 ;
 }
 delay_ms(1000);
 }
 }
}

void main() {
 trisb = 0;
 trisc = 0;
 trisd = 0b00001100;
 portc = 0xff ;
 while(1){
 if(  portd.b2  == 0 ) Automatic();
 else Manual();
 }
}
