struct Record
{
  int i;
  int j;
  int a[2];
  int *p;
};


void compute (struct Record *r)
{
  r->p = &r->a[r->i + r->j];
}

