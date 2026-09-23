#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int data;
    struct node *next;
} node;

node *top = NULL;

void push() {
    node *newnode;
    newnode = (node *)malloc(sizeof(node));

    printf("Enter data: ");
    scanf("%d", &newnode->data);

    newnode->next = top;
    top = newnode;

    printf("Element pushed successfully.\n");
}

void pop() {
    node *temp;
    if (top == NULL) {
        printf("Stack Underflow.\n");
        return;
    }

    temp = top;
    printf("Popped element = %d\n", temp->data);
    top = top->next;
    free(temp);
}

void peek() {
    if (top == NULL) {
        printf("Stack is Empty.\n");
        return;
    }
    printf("Top element = %d\n", top->data);
}

void display() {
    node *temp = top;
    if (top == NULL) {
        printf("Stack is Empty.\n");
        return;
    }

    printf("Stack: ");
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    int choice;
    while (1) {
        printf("\n----- STACK MENU -----\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. Peek\n");
        printf("4. Display\n");
        printf("5. Exit\n");
        printf("Enter choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1: push(); break;
            case 2: pop(); break;
            case 3: peek(); break;
            case 4: display(); break;
            case 5: exit(0);
            default: printf("Invalid Choice\n");
        }
    }
    return 0;
}