#define R 7
#define S 5
#define T 13


long A[R][S][T];

long store_ele (long i, long j, long k, long *dest)
{
  *dest = A[i][j][k];
  return sizeof(A);
}

