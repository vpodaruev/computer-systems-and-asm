long test (long x, long y)
{
  long val = 12 + y;

  if (x < 0)
  {
    if (x < y)
      val = y - x;
    else
      val = y & x;
  }
  else if (y > 10)
    val = x + y;

  return val;
}

