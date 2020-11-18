#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern "C" void Source();
extern "C" int isDivided(int x,int y);


int isDivided(int x,int y) {
	
	if (x % y != 0) {
		return 1;
	}
	else
		return 0;
}


int main() {

	Source();//call the asm function
	return 0;
}