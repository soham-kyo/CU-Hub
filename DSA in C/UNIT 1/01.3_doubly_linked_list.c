#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *prev;
    struct Node *next;
} Node;

Node *head = NULL;

void create() {
    int n, data;
    Node *newNode, *temp;

    printf("Enter number of nodes: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        printf("Enter data: ");
        scanf("%d", &data);

        newNode = (Node *)malloc(sizeof(Node));
        newNode->data = data;
        newNode->prev = NULL;
        newNode->next = NULL;

        if (head == NULL) {
            head = newNode;
        } else {
            temp = head;
            while (temp->next != NULL)
                temp = temp->next;

            temp->next = newNode;
            newNode->prev = temp;
        }
    }
}

void insertBeginning() {
    Node *newNode = (Node *)malloc(sizeof(Node));

    printf("Enter data: ");
    scanf("%d", &newNode->data);

    newNode->prev = NULL;
    newNode->next = head;

    if (head != NULL)
        head->prev = newNode;

    head = newNode;
}

void insertLast() {
    int data;
    Node *newNode, *temp;

    printf("Enter data: ");
    scanf("%d", &data);

    newNode = (Node *)malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;

    if (head == NULL) {
        newNode->prev = NULL;
        head = newNode;
        return;
    }

    temp = head;
    while (temp->next != NULL)
        temp = temp->next;

    temp->next = newNode;
    newNode->prev = temp;
}

void deleteBeginning() {
    Node *temp;

    if (head == NULL) {
        printf("List is empty\n");
        return;
    }

    temp = head;
    head = head->next;

    if (head != NULL)
        head->prev = NULL;

    free(temp);
}

void deleteLast() {
    Node *temp;

    if (head == NULL) {
        printf("List is empty\n");
        return;
    }

    temp = head;
    while (temp->next != NULL)
        temp = temp->next;

    if (temp->prev == NULL) {
        head = NULL;
    } else {
        temp->prev->next = NULL;
    }

    free(temp);
}

void traverseForward() {
    Node *temp = head;

    if (head == NULL) {
        printf("List is empty\n");
        return;
    }

    printf("Forward: ");
    while (temp != NULL) {
        printf("%d ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

void traverseBackward() {
    Node *temp = head;

    if (head == NULL) {
        printf("List is empty\n");
        return;
    }

    while (temp->next != NULL)
        temp = temp->next;

    printf("Backward: ");
    while (temp != NULL) {
        printf("%d ", temp->data);
        temp = temp->prev;
    }
    printf("\n");
}

int main() {
    int choice;
    do {
        printf("\n--- Doubly Linked List ---\n");
        printf("1. Create\n");
        printf("2. Insert at Beginning\n");
        printf("3. Insert at Last\n");
        printf("4. Delete at Beginning\n");
        printf("5. Delete at Last\n");
        printf("6. Traverse Forward\n");
        printf("7. Traverse Backward\n");
        printf("8. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1: create(); break;
            case 2: insertBeginning(); break;
            case 3: insertLast(); break;
            case 4: deleteBeginning(); break;
            case 5: deleteLast(); break;
            case 6: traverseForward(); break;
            case 7: traverseBackward(); break;
            case 8: printf("Program ended\n"); break;
            default: printf("Invalid choice\n");
        }
    } while (choice != 8);

    return 0;
}