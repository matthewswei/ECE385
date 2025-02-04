// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

/*
int main()
{
	int i = 0;
	volatile unsigned int *LED_PIO = (unsigned int*)0x30; //make a pointer to access the PIO block

	*LED_PIO = 0; //clear all LEDs
	while ( (1+1) != 3) //infinite loop
	{
		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO |= 0x1; //set LSB
		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO &= ~0x1; //clear LSB
	}
	return 1; //never gets here
}
*/

int main()
{
	volatile unsigned int *LED_PIO = (unsigned int*)0x30;
	volatile unsigned int *SW_PIO = (unsigned int*)0x60;
	volatile unsigned int *ACC_PIO = (unsigned int*)0x50;

	*LED_PIO = 0;
	while ( (1+1) != 3)
	{
		if (*ACC_PIO) {
			*LED_PIO += *SW_PIO;
			if (*LED_PIO>=256) {
				*LED_PIO-=256;
			}
			while (*ACC_PIO);
		}
	}
	return 1; //never gets here
}
