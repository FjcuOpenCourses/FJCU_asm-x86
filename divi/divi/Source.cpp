#include<iostream>
#include<stdlib.h>
using namespace std;
int main() {
	long long  int arr[1000000001];
	arr[1] = 1;
	for (int i = 2; i <= 10000; i++)
		arr[i] = 2;
	for (long long int i = 2; i <= 1000000001; i++) {
		for (long long int j = i + i; j <= 1000000001; j += i) {
			arr[j]++;
		}
	}
	long long int number;
	scanf("%lld", &number);
	for (long long int i = 0; i < number; i++) {
		long long int a, b, maximum = 0, location;
		scanf("%lld%lld", &a, &b);
		if (a > b) {
			int h = a;
			a = b;
			b = h;
		}
		for (long long int j = a; j <= b; j++) {
			if (arr[j] > maximum) {
				maximum = arr[j];
				location = j;
			}
		}
		printf("Between %lld and %lld, %lld has a maximum of %lld divisors.\n", a, b, location, maximum);

	}
	return 0;
}
