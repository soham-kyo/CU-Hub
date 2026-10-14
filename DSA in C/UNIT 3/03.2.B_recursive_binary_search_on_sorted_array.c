#include <stdio.h>
int binarySearch(int Arr[], int low, int high, int key)
{
    if (low > high)
    {
        return -1;
    }
    int mid = (low + high) / 2;
    if (key == Arr[mid])
    {
        return mid;
    }
    else if (key < Arr[mid])
    {
        return binarySearch(Arr, low, mid - 1, key);
    }
    else {
        return binarySearch(Arr, mid + 1, high, key);
    }
}
int main()
{
    int Arr[6] = {1, 2, 3, 4, 5, 6};
    int low = 0;
    int high = 5;
    int key, result;
    printf("Enter searching element: ");
    scanf("%d", &key);
    result = binarySearch(Arr, low, high, key);
    if (result != -1)
    {
        printf("Element %d found at index %d.\n", key, result);
    }
    else
    {
        printf("Element not found\n");
    }
    return 0;
}