;Tobias, Justin -TGI1

#define __SFR_OFFSET 0 

#include "avr/io.h"

.global calculate
calculate:

  ldi r16, 0x00
  out DDRA, r16
  out PORTA, r16
  out DDRB, r16
  out PORTA, r16
  out DDRD, r16
  ;PORTD = 0xff

  out DDRC, r16
  out PORTC, r16

  
  ldi r16, 0xff
  out PORTD, r16
  sts DDRL, r16
  sts PORTL, r16



waitBitEnterBtn:

  in r17, PIND
  cpi r17, 0b01111111
  breq loadBits
  
rjmp waitBitEnterBtn



loadBits:

  in r18, PINA
  in r19, PINB

  ldi r16, 0b10000000
  sts PORTL, r16





ldi r26, 0xE8
ldi r27, 0x03
markeAussen:

  ldi r28, 0xA0
  ldi r29, 0x0F
  markeInnen:

    sbiw r28, 1
    brne markeInnen

  sbiw r26, 1
  brne markeAussen
      
  

  


waitArithmeticOperationBtn:

  in r17, PIND
  cpi r17, 0b01111111
  breq loadArithmeticOperation
  
rjmp waitArithmeticOperationBtn



loadArithmeticOperation:

  in r20, PINB
  lsl r20
  lsl r20
  lsl r20
  lsl r20
  lsl r20
  lsl r20
  lsl r20
  cpi r20, 0b10000000
  breq mulFunc




;addFunc:
  add r18, r19

  ldi r16, 0x00
  sts PORTL, r16
  sts DDRL, r16

  ldi r16, 0xff
  out DDRC, r16
  out PORTC, r18  
   
ret


mulFunc:
  mul r18, r19

  ldi r16, 0x00
  sts DDRL, r16 
  sts PORTL, r16

  ldi r16, 0xff
  out DDRC, r16
  out PORTC, r0  
  
ret
