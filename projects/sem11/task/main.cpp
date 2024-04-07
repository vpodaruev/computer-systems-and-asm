#include <algorithm>
#include <iomanip>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

extern "C" __attribute__((sysv_abi)) int check_property (const char* s);

using PropertyUnitTest = std::pair<std::string, bool>;

void run (const PropertyUnitTest& test, size_t mw = 20)
{
  const auto& [s, ans] = test;  // since C++17
  std::cout << std::setw(mw) << std::left << s << "  " << std::setw(5)
            << std::boolalpha << ans << "  " << std::flush;

  bool res = check_property(&s[0]);

  std::cout << "[" << (res == ans ? "OK" : "FAILED") << "]" << std::endl;
}

size_t max_width (const std::vector<PropertyUnitTest>& tests)
{
  auto it = std::max_element(tests.begin(), tests.end(),
                             [] (const auto& p, const auto& q)
                             { return p.first.size() < q.first.size(); });
  if (it != tests.end())
    return it->first.size();

  throw std::runtime_error{"empty test sequence"};
}

int main ()
{
  std::vector<PropertyUnitTest> tests{
      {"", false},
      {"a", false},
      {"A", true},
      {"z", false},
      {"Z", true},
      {"\\\"", false},
      {"arjk402-1l5,cvFD.,", false},
      {"arjk402-1l5,cvFD", true},
      {"aA", true},
      {"zZ", true},
      {"AQ", true},
      {"A1", false},
      {"AAAAAAAAAAAAAAAAAA", false},
      {"ACDEFGHIJKLMNOPAAB", true},
      {"#{}()<>,`__../\\|\"'", false},
      {"A#{}()<>,`../\\|\"'A", false},
      {"a#{}()<>,`../\\|\"'A", true},
      {"'A'", false},
      {"'A'B", true},
      {"qDCBABCDA", false},
  };
  size_t mw = max_width(tests);

  for (const auto& t : tests)
    run(t, mw);
}
