#include <stdio.h>
int main()
{
    int Arr[6] = {1, 2, 3, 4, 5, 6};
    int low = 0;
    int high = 5;
    int mid, key;
    printf("Enter searching element: ");
    scanf("%d", &key);
    while (low <= high)
    {
        mid = (low + high) / 2;
        if (key == Arr[mid])
        {
            printf("Element %d found at index %d.\n", key, mid);
            return 0;
        }
        else if (key < Arr[mid])
        {
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }
    printf("Element not found.\n");
    return 0;
}