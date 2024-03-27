long loop_do_while (long x)
{
  long y = x * x;
  long *p = &x;
  long n = 4 * x;

  do
  {
    x += y;
    *p += 5;
    n -= 2;
  }
  while (n > 0);

  return x;
}
