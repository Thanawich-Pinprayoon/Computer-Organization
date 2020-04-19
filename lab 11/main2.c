#include<stdio.h>
#include<stdlib.h>
#include<wiringPi.h>
int led0 = 0;
int led1 = 2;
int led2 = 3;
int btn = 29;
int i = 0;
int fwd = 1;
unsigned long c, debounce = 200;
int base = 2000;
volatile int ms = 2000;
void halfms(void) {
    if(millis() - c > debounce){
        ms >>= 1;
        if(ms < base>>2) ms = base;
        printf("\t\tms: %d\n",ms);
        c = millis();
    }
}
int main (void) {
	printf("wiringPi LED blinking\n");
	if(wiringPiSetup() < 0){
		printf("Setup problem ... Abort!");
		return -1;
	}
	if ( wiringPiISR (btn, INT_EDGE_RISING, &halfms) < 0)
    {
        printf ( "Unable to setup ISR\n");
        return 1;
    }
	pinMode(led0, OUTPUT);
	pinMode(led1, OUTPUT);
	pinMode(led2, OUTPUT);
	printf("ms: %d\n",ms);
	while(1){
        printf("%d %d%d%d\n",i,(i & 0b100) >> 2,(i & 0b010)>>1,i & 0b001);
		digitalWrite(led0, (i & 4) >> 2);
		digitalWrite(led1, (i & 2)>>1);
		digitalWrite(led2,i & 1);
		delay(ms);
        if(fwd) {
            i++;
            if(i==7) {fwd = !fwd;printf("\n");}
        }
        else {
            i--;
            if(i==0) {fwd = !fwd;printf("\n");}
        }
	}
	return 0;
}

