struct ACE
{
  long v;
  struct ACE *p;
};

long test (struct ACE *ptr);


long test (struct ACE *ptr)
{
  long res = 1;
  for ( ; ptr; ptr = ptr->p)
    res *= ptr->v;

  return res;
}

