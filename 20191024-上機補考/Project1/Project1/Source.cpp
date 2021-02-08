#include <iostream>
#include <stdlib.h>
#include <stdio.h>

using namespace std;

extern "C" void asmMain();

int main() {
	asmMain();

	return 0;
}