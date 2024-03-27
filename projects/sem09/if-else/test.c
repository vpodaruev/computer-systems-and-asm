long test (long x, long y, long z)
{
  long val = z + y - x;

  if (z > 5)
  {
    if (y > 2)
      val = x * z;
    else
      val = x * y;
  }
  else if (z < 3)
    val = y * z;

  return val;
}

