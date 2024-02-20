#include <iostream>

int main ()
{
  double a = (1. + 1.e-20) - 1.;

  std::cout.precision(15);
  std::cout <<"a = "<< a << std::endl;
}

