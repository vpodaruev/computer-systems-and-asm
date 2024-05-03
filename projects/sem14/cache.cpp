#include <algorithm>
#include <array>
#include <iostream>
#include <iterator>
#include <limits>
#include <random>
#include <stdexcept>
#include <vector>

#include "timer.h"


struct Data
{
  const int id;
  std::array<char, LINE_SIZE> line {};

  Data (const int an_id) : id{ an_id }  { }
};


auto generate_data (size_t n, int high = std::numeric_limits<int>::max())
{
  std::default_random_engine ran{};
  std::uniform_int_distribution<> uni{ 0, high };

  std::vector<Data> data;
  data.reserve (n);
  for (size_t i = 0; i < n; ++i)
  {
    int id = uni (ran);
    data.emplace_back (id);
  }

  return data;
}


auto get_order_1 (const std::vector<Data>& data)
{
  std::vector<const Data*> ord;
  ord.reserve (data.size());

  std::transform (data.begin(), data.end(), std::back_inserter(ord),
                  [] (const Data& x) { return &x; });

  std::sort (ord.begin(), ord.end(),
             [] (const auto& p, const auto& q) { return p->id < q->id; });

  return ord;
}


auto get_order_2 (const std::vector<Data>& data)
{
  std::vector<std::pair<const Data*, size_t>> ord;
  ord.reserve (data.size());

  std::transform (data.begin(), data.end(), std::back_inserter(ord),
                  [] (const Data& x)
  {
    return std::make_pair (&x, x.id);
  });

  std::sort (ord.begin(), ord.end(),
             [] (const auto& p, const auto& q)
  {
    return p.second < q.second;
  });

  std::vector<const Data*> out;
  out.reserve (ord.size());
  for (const auto& p : ord)
    out.emplace_back (p.first);

  return out;
}


void test (size_t n)
{
  auto data = generate_data (n);

  std::vector<const Data*> ord;

  std::cout << sizeof(Data) <<" "<< data.size() << std::flush;
  for (auto& get_order : {get_order_1, get_order_2})
  {
    Timer timer;
    auto tmp = get_order (data);
    timer.stop();

    if (ord.empty())
      ord = tmp;
    else if (ord != tmp)
      throw std::runtime_error{"sorting order not the same"};

    std::cout <<" "<< timer.elapsed() << std::flush;
  }
  std::cout << std::endl;
}


int main ()
try
{
  std::vector<size_t> lengths {
    200, 500, 1'000,
    5'000, 10'000, 50'000, 100'000,
    200'000, 500'000, 800'000, 1'000'000,
  };

  for (size_t n : lengths)
    test (n);
}
catch (std::exception& e)
{
  std::cerr << e.what() << std::endl;
}
catch (...)
{
  std::cerr <<"Ooops! Unknown exception..."<< std::endl;
}
