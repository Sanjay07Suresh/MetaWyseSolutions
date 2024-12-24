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

// Pin Definitions
#define SW RB0     // Switch input
#define LED RD0    // LED output

// Debounce Configuration
#define DEBOUNCE_TIME_MS 50 // Debounce time in milliseconds

// Function Prototypes
void debounceDelay();

// Main Function
void main() {
    // Configure I/O
    TRISBbits.TRISB0 = 1; // Configure RB0 as input
    TRISDbits.TRISD0 = 0; // Configure RD0 as output
    OPTION_REGbits.nRBPU = 0; // Enable PORTB pull-ups
    LED = 0; // Initialize LED state as OFF

    // Variables
    unsigned char buttonState = 0; // Current button state
    unsigned char buttonPrevState = 1; // Previous button state
    unsigned char pressCount = 0; // Counter for button presses

    while (1) {
        // Read the current state of the button
        buttonState = SW;

        // Check if the button state has changed (falling edge detection)
        if (buttonPrevState == 1 && buttonState == 0) {
            debounceDelay(); // Apply debounce delay
            if (SW == 0) {   // Confirm the button is still pressed
                pressCount++; // Increment the press count
            }
        }

        // Update LED state on two button presses
        if (pressCount == 2) {
            LED = !LED; // Toggle LED
            pressCount = 0; // Reset press count
        }

        buttonPrevState = buttonState; // Update previous button state
    }
}

// Debounce Delay Function
void debounceDelay() {
    __delay_ms(DEBOUNCE_TIME_MS);
}
