#include <stdio.h>
#include <time.h>

int main() {
    int n;
    printf("Fib: ");
    scanf("%d", &n);
    clock_t start = clock();
    long long a = 0, b = 1;
    if (n >= 0) printf("Fib(0) = 0\n");
    if (n >= 1) printf("Fib(1) = 1\n");
    for (int i = 2; i <= n; i++) {
        long long c = a + b;
        printf("Fib(%d) = %lld\n", i, c);
        a = b;
        b = c;
    }
    clock_t end = clock();
    double time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Time taken: %f seconds\n", time_taken);
    return 0;
}