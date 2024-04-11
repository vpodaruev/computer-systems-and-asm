struct Test
{
  int *p;
  struct
  {
    int x;
    int y;
  } s;
  struct Test *next;
};


void st_init (struct Test *st)
{
  st->s.y = st->s.x;
  st->p = &st->s.y;
  st->next = st;
}

