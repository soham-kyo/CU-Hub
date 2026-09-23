#include <stdio.h>
int main() {
    int r1, c1, r2, c2;

    printf("Enter rows and columns of Matrix A: ");
    scanf("%d %d", &r1, &c1);

    printf("Enter rows and columns of Matrix B: ");
    scanf("%d %d", &r2, &c2);

    int A[r1][c1], B[r2][c2];

    printf("\nEnter elements of Matrix A:\n");
    for (int i = 0; i < r1; i++) {
        for (int j = 0; j < c1; j++) {
            scanf("%d", &A[i][j]);
        }
    }

    printf("\nEnter elements of Matrix B:\n");
    for (int i = 0; i < r2; i++) {
        for (int j = 0; j < c2; j++) {
            scanf("%d", &B[i][j]);
        }
    }

    if (r1 == r2 && c1 == c2) {
        int sum[r1][c1];

        printf("\nMatrix Addition:\n");
        for (int i = 0; i < r1; i++) {
            for (int j = 0; j < c1; j++) {
                sum[i][j] = A[i][j] + B[i][j];
                printf("%d ", sum[i][j]);
            }
            printf("\n");
        }
    } else {
        printf("\nMatrix Addition is not possible.\n");
    }

    if (c1 == r2) {
        int product[r1][c2];

        for (int i = 0; i < r1; i++) {
            for (int j = 0; j < c2; j++) {
                product[i][j] = 0;
                for (int k = 0; k < c1; k++) {
                    product[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        printf("\nMatrix Multiplication:\n");
        for (int i = 0; i < r1; i++) {
            for (int j = 0; j < c2; j++) {
                printf("%d ", product[i][j]);
            }
            printf("\n");
        }
    } else {
        printf("\nMatrix Multiplication is not possible.\n");
    }

    return 0;
}