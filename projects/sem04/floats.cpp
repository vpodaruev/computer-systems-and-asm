#include <fstream>
#include <iostream>
#include <iomanip>
#include <vector>
#include <string>
#include <iterator>
#include <stdexcept>


unsigned int to_machine (float x)
{
  void* addr = &x;
  return *static_cast<int*>(addr);
}


float to_float (unsigned int x)
{
  void* addr = &x;
  return *static_cast<float*>(addr);
}


void to_machine (const std::string& filebase)
{
  std::string infile = filebase +".in";
  std::ifstream ifs {infile};
  if (!ifs)
    throw std::runtime_error {"Can't open file: "+ infile};

  std::string outfile = filebase +".out";
  std::ofstream ofs {outfile};
  if (!ofs)
    throw std::runtime_error {"Can't open file: "+ outfile};

  float x{};
  ofs << std::hex << std::uppercase;
  while (ifs >> x)
    ofs << to_machine(x) <<"\n";
}


void to_float (const std::string& filebase)
{
  std::string infile = filebase +".in";
  std::ifstream ifs {infile};
  if (!ifs)
    throw std::runtime_error {"Can't open file: "+ infile};

  std::string outfile = filebase +".out";
  std::ofstream ofs {outfile};
  if (!ofs)
    throw std::runtime_error {"Can't open file: "+ outfile};

  unsigned int x{};
  ifs >> std::hex;
  while (ifs >> x)
    ofs << to_float(x) <<"\n";
}


int main ()
{
  try
  {
    to_machine ("floats");
  }
  catch (std::exception& e)
  {
    std::cerr << e.what() << std::endl;
  }

  try
  {
    to_float ("machines");
  }
  catch (std::exception& e)
  {
    std::cerr << e.what() << std::endl;
  }
}
