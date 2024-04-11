#include <iostream>
#include <memory>

int main ()
{
  auto heap = std::make_unique<long>();
  std::cout <<"heap address is "<< heap.get() << std::endl;
}
