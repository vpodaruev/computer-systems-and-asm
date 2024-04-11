#include <iostream>

int main ()
{
  auto code = reinterpret_cast<void*>(&main);
  std::cout <<"code address is "<< code << std::endl;
}
