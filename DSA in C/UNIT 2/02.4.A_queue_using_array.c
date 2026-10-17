#include <stdio.h>
#define MAX 100
int queue[MAX];
int front = -1, rear = -1;
void enqueue(int value)
{
    if (rear == MAX - 1)
    {
        printf("Queue Overflow\n");
    }
    else if (front == -1)
    {
        front = 0;
        queue[++rear] = value;
        printf("%d inserted\n", value);
    }
    else
    {
        queue[++rear] = value;
        printf("%d inserted\n", value);
    }
}
void dequeue()
{
    if (front == -1)
    {
        printf("Queue Underflow\n");
    }
    else if (front == rear)
    {
        printf("%d deleted\n", queue[front]);
        front = rear = -1;
    }
    else
    {
        printf("%d deleted\n", queue[front]);
        front++;
    }
}
void peek()
{
    if (front == -1)
    {
        printf("Queue is empty\n");
    }
    else
    {
        printf("Front element: %d\n", queue[front]);
    }
}
void display()
{
    int i;
    if (front == -1)
    {
        printf("Queue is empty\n");
    }
    else if (front == rear)
    {
        printf("Queue: %d\n", queue[front]);
    }
    else
    {
        printf("Queue: ");

        for (i = front; i <= rear; i++)
        {
            printf("%d ", queue[i]);
        }
        printf("\n");
    }
}
int main()
{
    int choice, value;
    while (1)
    {
        printf("\n--- QUEUE MENU ---\n");
        printf("1. Enqueue\n");
        printf("2. Dequeue\n");
        printf("3. Peek\n");
        printf("4. Display\n");
        printf("5. Exit\n");
        printf("Enter choice: ");
        scanf("%d", &choice);
        switch (choice)
        {
            case 1:
                printf("Enter value: ");
                scanf("%d", &value);
                enqueue(value);
                break;
            case 2:
                dequeue();
                break;
            case 3:
                peek();
                break;
            case 4:
                display();
                break;
            case 5:
                return 0;
            default:
                printf("Invalid choice\n");
        }
    }
}