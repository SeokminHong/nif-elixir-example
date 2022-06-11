#include <stdlib.h>
#include "calc.h"

int add_int(int a, int b)
{
    return a + b;
}

int div_int(int a, int b)
{
    return a / b;
}

double div_double(double a, double b)
{
    return a / b;
}

void panic()
{
    exit(1);
}
