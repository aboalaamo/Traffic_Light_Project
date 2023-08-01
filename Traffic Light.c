// Switches
#define         M_A_SW          portd.b2
#define         M_SW            portd.b3
// Manual Switch
int M_Counter , M_SW_Cur = 0 , M_SW_Lst = 0 ;
// Segment
int index ;
// West Leds
#define         West_Red        portc.b4
#define         West_Yellow     portc.b5
#define         West_Green      portc.b6
// South Leds
#define         South_Red       portc.b7
#define         South_Yellow    portd.b0
#define         South_Green     portd.b1

int Number[] = { 0x00 , 0x01 , 0x02 , 0x03 , 0x04 , 0x05 ,
                 0x06 , 0x07 , 0x08 , 0x09 , 0x10 , 0x11 ,
                 0x12 , 0x13 , 0x14 , 0x15 , 0x16 , 0x17 ,
                 0x18 , 0x19 , 0x20 , 0x21 , 0x22 , 0x23 ,
                 0x24 , 0x25 , 0x26 , 0x27 , 0x28 , 0x29 ,
                 0x30 , 0x31 , 0x32 , 0x33 , 0x34 , 0x35 ,
                 0x36 , 0x37 , 0x38  };

void Manual(){
     M_Counter = 1 ;
     portb = 0x00 ;
     West_Yellow = 0 ;
     West_Red = 1 ;
     West_Green = 0 ;
     South_Red = 0 ;
     South_Yellow = 0 ;
     South_Green = 1 ;
     while( M_A_SW == 1 ){
        M_SW_Cur = M_SW ;
        if( M_SW_Cur == 1 && M_SW_Lst == 0 ){
            ++M_Counter ;
            if( M_Counter == 1 ){
                West_Yellow = 0 ;
                West_Red = 1 ;
                West_Green = 0 ;
                South_Red = 0 ;
                South_Yellow = 0 ;
                South_Green = 1 ;
            }
            if( M_Counter == 2 ){
                West_Yellow = 1 ;
                West_Red = 0 ;
                West_Green = 0 ;
                South_Red = 1 ;
                South_Yellow = 0 ;
                South_Green = 0 ;
                for( index = 0 ; index <= 3 ; ++index ){
                     portb = Number[index];
                     delay_ms(1000);
                }
            }
            if( M_Counter == 3 ){
                West_Yellow = 0 ;
                West_Red = 0 ;
                West_Green = 1 ;
                South_Red = 0 ;
                South_Yellow = 1 ;
                South_Green = 0 ;
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
     // West
     West_Red = 0 ;
     West_Yellow = 1 ;
     West_Green = 0 ;
     // South
     South_Red = 1 ;
     South_Yellow = 0 ;
     South_Green = 0 ;
     while( M_A_SW == 0 ){
        for( index = 0 ; index < 39 && M_A_SW == 0 ; ++index ){
            portb = Number[index];
            if( index <= 3 ){
                West_Yellow = 1 ;
                West_Red = 0 ;
                West_Green = 0 ;
                South_Red = 1 ;
                South_Yellow = 0 ;
                South_Green = 0 ;
            }
            if( index >= 4 && index <= 23 ){
                West_Yellow = 0 ;
                West_Red = 0 ;
                West_Green = 1 ;
                South_Red = 1 ;
                South_Yellow = 0 ;
                South_Green = 0 ;
            }
            if( index >= 24 && index <= 26 ){
                West_Yellow = 0 ;
                West_Red = 1 ;
                West_Green = 0 ;
                South_Red = 0 ;
                South_Yellow = 1 ;
                South_Green = 0 ;
            }
            if( index >= 27 && index <= 38 ){
                West_Yellow = 0 ;
                West_Red = 1 ;
                West_Green = 0 ;
                South_Red = 0 ;
                South_Yellow = 0 ;
                South_Green = 1 ;
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
              if( M_A_SW == 0 ) Automatic();
              else Manual();
     }
}