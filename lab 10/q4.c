#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
int main(void)
{
    int led0 = 0;
    int led1 = 2;
    int led2 = 3;
    printf("wiringPi LED blinking\n");
    if (wiringPiSetup() == -1)
    {
        printf("Setup problem ... Abort!");
        exit(1);
    }
    pinMode(led0, OUTPUT);
    pinMode(led1, OUTPUT);
    pinMode(led2, OUTPUT);
    while (1)
    {
        for (int i = 0; i < 8; i++)
        {
            printf("%d %d %d %d\n", i, (i / 4) % 2, (i / 2) % 2, i % 2);
            digitalWrite(led0, (i / 4) % 2);
            digitalWrite(led1, (i / 2) % 2);
            digitalWrite(led2, i % 2);
            delay(1000);
        }
        printf("\n");
    }
    return 0;
}