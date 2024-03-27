long loop_while (long a, long b)
{
  long result = 0;

  while (a > b)
  {
    result = result + (a + b);
    a = a - 1;
  }

  return result;
}

