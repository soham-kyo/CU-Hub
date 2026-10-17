#include <stdio.h>
#include <stdlib.h>
typedef struct Node
{
    int data;
    struct Node *next;
} Node;
Node *front = NULL;
Node *rear = NULL;
void enqueue(int value)
{
    Node *newNode;
    newNode = (Node *)malloc(sizeof(Node));
    newNode->data = value;
    newNode->next = NULL;
    if (front == NULL)
    {
        front = rear = newNode;
        printf("%d inserted\n", value);
    }
    else if (rear != NULL)
    {
        rear->next = newNode;
        rear = newNode;
        printf("%d inserted\n", value);
    }
    else
    {
        printf("Invalid queue\n");
    }
}
void dequeue()
{
    Node *temp;
    if (front == NULL)
    {
        printf("Queue Underflow\n");
    }
    else if (front == rear)
    {
        printf("%d deleted\n", front->data);
        free(front);
        front = rear = NULL;
    }
    else
    {
        temp = front;
        printf("%d deleted\n", front->data);
        front = front->next;
        free(temp);
    }
}
void peek()
{
    if (front == NULL)
    {
        printf("Queue is empty\n");
    }
    else
    {
        printf("Front element: %d\n", front->data);
    }
}
void display()
{
    Node *temp = front;
    if (front == NULL)
    {
        printf("Queue is empty\n");
    }
    else if (front == rear)
    {
        printf("Queue: %d\n", front->data);
    }
    else
    {
        printf("Queue: ");
        while (temp != NULL)
        {
            printf("%d ", temp->data);
            temp = temp->next;
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