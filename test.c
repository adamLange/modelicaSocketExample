#include <stdio.h>

double interp(double a, double b)
{
  return (a+b)/3.;
}

int main(void) {
    double interpValue;
    interpValue = interp(1,2);
    printf("Hello World: %6.2f\n",interpValue);
    return 0;
}
