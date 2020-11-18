#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern "C" void Source();
extern "C" int isPrime(int x);


int isPrime(int x) {
	int a, b;
	b = (int)sqrt(x);
	if (x < 2)
		return 0;

	for (a = 2; a <= b; a++) {//check the prime number
		if (x % a == 0) {
			return 0;
		}
	}
	return 1;
}


int main() {

	Source();//call the asm function
	return 0;
}