#include <cmath>
#include <iostream>


extern "C" bool is_divide (long x, long n);


bool is_prime (long x)
{
  for (long i = 2; i <= std::sqrt(x); ++i)
    if (is_divide (x, i))
      return false;

  return true;
}


int main ()
{
  for (long x : {2, 3, 4, 5, 6, 7, 9, 13, 18, 17})
    std::cout << x <<" is prime = "
	      << std::boolalpha << is_prime (x) << std::endl;
}

