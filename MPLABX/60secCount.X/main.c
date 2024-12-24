#pragma config FOSC = HS
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF
#pragma config BOREN = ON
#pragma config CPD = OFF
#pragma config LVP = OFF
#pragma config WRT = OFF
#pragma config DEBUG = OFF

#include <xc.h>
#define _XTAL_FREQ 20000000
#define sw RB0 //Pushbutton 

volatile unsigned int overflowCount = 0; 
volatile unsigned int seconds = 0; //to keep track of the seconds elapsed
volatile unsigned char buttonPresses = 0; // to keep track of the button presses in 60 secs
unsigned char prevButtonState = 1; // previous button state to be compared with current button state

void ser_int();
void tx(unsigned char);
void txstr(const char*);
void timer1Init();
void interrupt_init();
void buttonISR();

void main() {
    TRISCbits.TRISC7 = 1;
    TRISCbits.TRISC6 = 0;
    TRISBbits.TRISB0 = 1;
    OPTION_REGbits.nRBPU = 0;
    ser_int();
    timer1Init();
    interrupt_init();

    while (1) {
        if (seconds >= 60) {
            seconds = 0;
            txstr("Button Presses in the last 60 seconds: ");
            tx((buttonPresses / 10) + '0');
            tx((buttonPresses % 10) + '0');
            tx('\n');
            buttonPresses = 0;
        }
    }
}

void ser_int() {
    TXSTA = 0x20;
    RCSTA = 0x90;
    SPBRG = 31;
}

void tx(unsigned char a) {
    while (!TXIF);
    TXREG = a;
}

void txstr(const char *a) {
    while (*a) {
        tx(*a++);
    }
}

void timer1Init() {
    T1CON = 0x31;
    PIE1bits.TMR1IE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;
}

void interrupt_init() {
    INTCONbits.GIE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.INTE = 1;
    OPTION_REGbits.INTEDG = 0;
    INTCONbits.INTF = 0;
}

void __interrupt() ISR() {
    if (TMR1IF) {   // Timer1 interrupt
        TMR1IF = 0;
        overflowCount++;
        if (overflowCount == 9) {
            overflowCount = 0;
            seconds++;
        }
    }

    if (INTCONbits.INTF) {   // RB0 (external interrupt)
        buttonISR();
        INTCONbits.INTF = 0;
    }
}

void buttonISR() {
    unsigned char currentButtonState = sw;
    if (prevButtonState == 1 && currentButtonState == 0) {
        __delay_ms(50);
        if (sw == 0) {
            buttonPresses++;
            txstr("Button Press Detected. Count: ");
            tx((buttonPresses / 10) + '0');
            tx((buttonPresses % 10) + '0');
            tx('\n');
        }
    }
    prevButtonState = currentButtonState;
}
