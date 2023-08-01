
_Manual:

;Traffic Light.c,25 :: 		void Manual(){
;Traffic Light.c,26 :: 		M_Counter = 1 ;
	MOVLW      1
	MOVWF      _M_Counter+0
	MOVLW      0
	MOVWF      _M_Counter+1
;Traffic Light.c,27 :: 		portb = 0x00 ;
	CLRF       PORTB+0
;Traffic Light.c,28 :: 		West_Yellow = 0 ;
	BCF        PORTC+0, 5
;Traffic Light.c,29 :: 		West_Red = 1 ;
	BSF        PORTC+0, 4
;Traffic Light.c,30 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,31 :: 		South_Red = 0 ;
	BCF        PORTC+0, 7
;Traffic Light.c,32 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,33 :: 		South_Green = 1 ;
	BSF        PORTD+0, 1
;Traffic Light.c,34 :: 		while( M_A_SW == 1 ){
L_Manual0:
	BTFSS      PORTD+0, 2
	GOTO       L_Manual1
;Traffic Light.c,35 :: 		M_SW_Cur = M_SW ;
	MOVLW      0
	BTFSC      PORTD+0, 3
	MOVLW      1
	MOVWF      _M_SW_Cur+0
	CLRF       _M_SW_Cur+1
;Traffic Light.c,36 :: 		if( M_SW_Cur == 1 && M_SW_Lst == 0 ){
	MOVLW      0
	XORWF      _M_SW_Cur+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual44
	MOVLW      1
	XORWF      _M_SW_Cur+0, 0
L__Manual44:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual4
	MOVLW      0
	XORWF      _M_SW_Lst+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual45
	MOVLW      0
	XORWF      _M_SW_Lst+0, 0
L__Manual45:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual4
L__Manual38:
;Traffic Light.c,37 :: 		++M_Counter ;
	INCF       _M_Counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _M_Counter+1, 1
;Traffic Light.c,38 :: 		if( M_Counter == 1 ){
	MOVLW      0
	XORWF      _M_Counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual46
	MOVLW      1
	XORWF      _M_Counter+0, 0
L__Manual46:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual5
;Traffic Light.c,39 :: 		West_Yellow = 0 ;
	BCF        PORTC+0, 5
;Traffic Light.c,40 :: 		West_Red = 1 ;
	BSF        PORTC+0, 4
;Traffic Light.c,41 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,42 :: 		South_Red = 0 ;
	BCF        PORTC+0, 7
;Traffic Light.c,43 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,44 :: 		South_Green = 1 ;
	BSF        PORTD+0, 1
;Traffic Light.c,45 :: 		}
L_Manual5:
;Traffic Light.c,46 :: 		if( M_Counter == 2 ){
	MOVLW      0
	XORWF      _M_Counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual47
	MOVLW      2
	XORWF      _M_Counter+0, 0
L__Manual47:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual6
;Traffic Light.c,47 :: 		West_Yellow = 1 ;
	BSF        PORTC+0, 5
;Traffic Light.c,48 :: 		West_Red = 0 ;
	BCF        PORTC+0, 4
;Traffic Light.c,49 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,50 :: 		South_Red = 1 ;
	BSF        PORTC+0, 7
;Traffic Light.c,51 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,52 :: 		South_Green = 0 ;
	BCF        PORTD+0, 1
;Traffic Light.c,53 :: 		for( index = 0 ; index <= 3 ; ++index ){
	CLRF       _index+0
	CLRF       _index+1
L_Manual7:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _index+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual48
	MOVF       _index+0, 0
	SUBLW      3
L__Manual48:
	BTFSS      STATUS+0, 0
	GOTO       L_Manual8
;Traffic Light.c,54 :: 		portb = Number[index];
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _Number+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,55 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Manual10:
	DECFSZ     R13+0, 1
	GOTO       L_Manual10
	DECFSZ     R12+0, 1
	GOTO       L_Manual10
	DECFSZ     R11+0, 1
	GOTO       L_Manual10
	NOP
	NOP
;Traffic Light.c,53 :: 		for( index = 0 ; index <= 3 ; ++index ){
	INCF       _index+0, 1
	BTFSC      STATUS+0, 2
	INCF       _index+1, 1
;Traffic Light.c,56 :: 		}
	GOTO       L_Manual7
L_Manual8:
;Traffic Light.c,57 :: 		}
L_Manual6:
;Traffic Light.c,58 :: 		if( M_Counter == 3 ){
	MOVLW      0
	XORWF      _M_Counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual49
	MOVLW      3
	XORWF      _M_Counter+0, 0
L__Manual49:
	BTFSS      STATUS+0, 2
	GOTO       L_Manual11
;Traffic Light.c,59 :: 		West_Yellow = 0 ;
	BCF        PORTC+0, 5
;Traffic Light.c,60 :: 		West_Red = 0 ;
	BCF        PORTC+0, 4
;Traffic Light.c,61 :: 		West_Green = 1 ;
	BSF        PORTC+0, 6
;Traffic Light.c,62 :: 		South_Red = 0 ;
	BCF        PORTC+0, 7
;Traffic Light.c,63 :: 		South_Yellow = 1 ;
	BSF        PORTD+0, 0
;Traffic Light.c,64 :: 		South_Green = 0 ;
	BCF        PORTD+0, 1
;Traffic Light.c,65 :: 		for( index = 0 ; index <= 3 ; ++index ){
	CLRF       _index+0
	CLRF       _index+1
L_Manual12:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _index+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual50
	MOVF       _index+0, 0
	SUBLW      3
L__Manual50:
	BTFSS      STATUS+0, 0
	GOTO       L_Manual13
;Traffic Light.c,66 :: 		portb = Number[index];
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _Number+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,67 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Manual15:
	DECFSZ     R13+0, 1
	GOTO       L_Manual15
	DECFSZ     R12+0, 1
	GOTO       L_Manual15
	DECFSZ     R11+0, 1
	GOTO       L_Manual15
	NOP
	NOP
;Traffic Light.c,65 :: 		for( index = 0 ; index <= 3 ; ++index ){
	INCF       _index+0, 1
	BTFSC      STATUS+0, 2
	INCF       _index+1, 1
;Traffic Light.c,68 :: 		}
	GOTO       L_Manual12
L_Manual13:
;Traffic Light.c,69 :: 		M_Counter = 0 ;
	CLRF       _M_Counter+0
	CLRF       _M_Counter+1
;Traffic Light.c,70 :: 		}
L_Manual11:
;Traffic Light.c,71 :: 		}
L_Manual4:
;Traffic Light.c,72 :: 		M_SW_Lst = M_SW_Cur ;
	MOVF       _M_SW_Cur+0, 0
	MOVWF      _M_SW_Lst+0
	MOVF       _M_SW_Cur+1, 0
	MOVWF      _M_SW_Lst+1
;Traffic Light.c,73 :: 		portb = Number[0];
	MOVF       _Number+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,74 :: 		}
	GOTO       L_Manual0
L_Manual1:
;Traffic Light.c,75 :: 		}
L_end_Manual:
	RETURN
; end of _Manual

_Automatic:

;Traffic Light.c,77 :: 		void Automatic(){
;Traffic Light.c,79 :: 		West_Red = 0 ;
	BCF        PORTC+0, 4
;Traffic Light.c,80 :: 		West_Yellow = 1 ;
	BSF        PORTC+0, 5
;Traffic Light.c,81 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,83 :: 		South_Red = 1 ;
	BSF        PORTC+0, 7
;Traffic Light.c,84 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,85 :: 		South_Green = 0 ;
	BCF        PORTD+0, 1
;Traffic Light.c,86 :: 		while( M_A_SW == 0 ){
L_Automatic16:
	BTFSC      PORTD+0, 2
	GOTO       L_Automatic17
;Traffic Light.c,87 :: 		for( index = 0 ; index < 39 && M_A_SW == 0 ; ++index ){
	CLRF       _index+0
	CLRF       _index+1
L_Automatic18:
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic52
	MOVLW      39
	SUBWF      _index+0, 0
L__Automatic52:
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic19
	BTFSC      PORTD+0, 2
	GOTO       L_Automatic19
L__Automatic42:
;Traffic Light.c,88 :: 		portb = Number[index];
	MOVF       _index+0, 0
	MOVWF      R0+0
	MOVF       _index+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _Number+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Traffic Light.c,89 :: 		if( index <= 3 ){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _index+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic53
	MOVF       _index+0, 0
	SUBLW      3
L__Automatic53:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic23
;Traffic Light.c,90 :: 		West_Yellow = 1 ;
	BSF        PORTC+0, 5
;Traffic Light.c,91 :: 		West_Red = 0 ;
	BCF        PORTC+0, 4
;Traffic Light.c,92 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,93 :: 		South_Red = 1 ;
	BSF        PORTC+0, 7
;Traffic Light.c,94 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,95 :: 		South_Green = 0 ;
	BCF        PORTD+0, 1
;Traffic Light.c,96 :: 		}
L_Automatic23:
;Traffic Light.c,97 :: 		if( index >= 4 && index <= 23 ){
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic54
	MOVLW      4
	SUBWF      _index+0, 0
L__Automatic54:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic26
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _index+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic55
	MOVF       _index+0, 0
	SUBLW      23
L__Automatic55:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic26
L__Automatic41:
;Traffic Light.c,98 :: 		West_Yellow = 0 ;
	BCF        PORTC+0, 5
;Traffic Light.c,99 :: 		West_Red = 0 ;
	BCF        PORTC+0, 4
;Traffic Light.c,100 :: 		West_Green = 1 ;
	BSF        PORTC+0, 6
;Traffic Light.c,101 :: 		South_Red = 1 ;
	BSF        PORTC+0, 7
;Traffic Light.c,102 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,103 :: 		South_Green = 0 ;
	BCF        PORTD+0, 1
;Traffic Light.c,104 :: 		}
L_Automatic26:
;Traffic Light.c,105 :: 		if( index >= 24 && index <= 26 ){
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic56
	MOVLW      24
	SUBWF      _index+0, 0
L__Automatic56:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic29
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _index+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic57
	MOVF       _index+0, 0
	SUBLW      26
L__Automatic57:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic29
L__Automatic40:
;Traffic Light.c,106 :: 		West_Yellow = 0 ;
	BCF        PORTC+0, 5
;Traffic Light.c,107 :: 		West_Red = 1 ;
	BSF        PORTC+0, 4
;Traffic Light.c,108 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,109 :: 		South_Red = 0 ;
	BCF        PORTC+0, 7
;Traffic Light.c,110 :: 		South_Yellow = 1 ;
	BSF        PORTD+0, 0
;Traffic Light.c,111 :: 		South_Green = 0 ;
	BCF        PORTD+0, 1
;Traffic Light.c,112 :: 		}
L_Automatic29:
;Traffic Light.c,113 :: 		if( index >= 27 && index <= 38 ){
	MOVLW      128
	XORWF      _index+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic58
	MOVLW      27
	SUBWF      _index+0, 0
L__Automatic58:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic32
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _index+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic59
	MOVF       _index+0, 0
	SUBLW      38
L__Automatic59:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic32
L__Automatic39:
;Traffic Light.c,114 :: 		West_Yellow = 0 ;
	BCF        PORTC+0, 5
;Traffic Light.c,115 :: 		West_Red = 1 ;
	BSF        PORTC+0, 4
;Traffic Light.c,116 :: 		West_Green = 0 ;
	BCF        PORTC+0, 6
;Traffic Light.c,117 :: 		South_Red = 0 ;
	BCF        PORTC+0, 7
;Traffic Light.c,118 :: 		South_Yellow = 0 ;
	BCF        PORTD+0, 0
;Traffic Light.c,119 :: 		South_Green = 1 ;
	BSF        PORTD+0, 1
;Traffic Light.c,120 :: 		}
L_Automatic32:
;Traffic Light.c,121 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Automatic33:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic33
	DECFSZ     R12+0, 1
	GOTO       L_Automatic33
	DECFSZ     R11+0, 1
	GOTO       L_Automatic33
	NOP
	NOP
;Traffic Light.c,87 :: 		for( index = 0 ; index < 39 && M_A_SW == 0 ; ++index ){
	INCF       _index+0, 1
	BTFSC      STATUS+0, 2
	INCF       _index+1, 1
;Traffic Light.c,122 :: 		}
	GOTO       L_Automatic18
L_Automatic19:
;Traffic Light.c,123 :: 		}
	GOTO       L_Automatic16
L_Automatic17:
;Traffic Light.c,124 :: 		}
L_end_Automatic:
	RETURN
; end of _Automatic

_main:

;Traffic Light.c,126 :: 		void main() {
;Traffic Light.c,127 :: 		trisb = 0;
	CLRF       TRISB+0
;Traffic Light.c,128 :: 		trisc = 0;
	CLRF       TRISC+0
;Traffic Light.c,129 :: 		trisd = 0b00001100;
	MOVLW      12
	MOVWF      TRISD+0
;Traffic Light.c,130 :: 		portc = 0xff ;
	MOVLW      255
	MOVWF      PORTC+0
;Traffic Light.c,131 :: 		while(1){
L_main34:
;Traffic Light.c,132 :: 		if( M_A_SW == 0 ) Automatic();
	BTFSC      PORTD+0, 2
	GOTO       L_main36
	CALL       _Automatic+0
	GOTO       L_main37
L_main36:
;Traffic Light.c,133 :: 		else Manual();
	CALL       _Manual+0
L_main37:
;Traffic Light.c,134 :: 		}
	GOTO       L_main34
;Traffic Light.c,135 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
