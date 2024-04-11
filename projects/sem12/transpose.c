#define M 15

void transpose (long A[M][M])
{
  for (int i = 0; i < M; ++i)
  for (int j = 0; j < i; ++j)
  {
    long tmp = A[i][j];
    A[i][j] = A[j][i];
    A[j][i] = tmp;
  }
}

