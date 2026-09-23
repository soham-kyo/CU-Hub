#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int data;
    struct node *next;
} node;

node *head = NULL;

void create() {
    node *temp;
    int n, i;

    printf("Enter number of nodes: ");
    scanf("%d", &n);

    head = NULL;

    for (i = 1; i <= n; i++) {
        node *newnode = (node *)malloc(sizeof(node));

        printf("Enter data: ");
        scanf("%d", &newnode->data);

        newnode->next = NULL;

        if (head == NULL) {
            head = newnode;
            temp = newnode;
        } else {
            temp->next = newnode;
            temp = newnode;
        }
    }

    printf("Linked List Created Successfully.\n");
}

void insertBegin() {
    node *newnode;
    newnode = (node *)malloc(sizeof(node));

    printf("Enter data: ");
    scanf("%d", &newnode->data);

    newnode->next = head;
    head = newnode;

    printf("Node inserted successfully.\n");
}

void insertLast() {
    node *newnode, *temp;
    newnode = (node *)malloc(sizeof(node));

    printf("Enter data: ");
    scanf("%d", &newnode->data);

    newnode->next = NULL;

    if (head == NULL) {
        head = newnode;
    } else {
        temp = head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = newnode;
    }

    printf("Node inserted at last successfully.\n");
}

void deleteBegin() {
    node *temp;

    if (head == NULL) {
        printf("List is Empty.\n");
        return;
    }

    temp = head;
    head = head->next;

    printf("Deleted element = %d\n", temp->data);
    free(temp);
}

void deleteLast() {
    node *temp;

    if (head == NULL) {
        printf("List is Empty.\n");
        return;
    }

    if (head->next == NULL) {
        printf("Deleted element = %d\n", head->data);
        free(head);
        head = NULL;
        return;
    }

    temp = head;
    while (temp->next->next != NULL) {
        temp = temp->next;
    }

    printf("Deleted element = %d\n", temp->next->data);
    free(temp->next);
    temp->next = NULL;
}

void display() {
    node *temp = head;

    if (head == NULL) {
        printf("List is Empty.\n");
        return;
    }

    printf("Linked List: ");
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    int choice;

    while (1) {
        printf("\n----- MENU -----\n");
        printf("1. Create\n");
        printf("2. Insert at Beginning\n");
        printf("3. Insert at Last\n");
        printf("4. Delete from Beginning\n");
        printf("5. Delete from Last\n");
        printf("6. Display (Traverse Forward)\n");
        printf("7. Exit\n");

        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1: create(); break;
            case 2: insertBegin(); break;
            case 3: insertLast(); break;
            case 4: deleteBegin(); break;
            case 5: deleteLast(); break;
            case 6: display(); break;
            case 7: exit(0);
            default: printf("Invalid Choice\n");
        }
    }
    return 0;
}