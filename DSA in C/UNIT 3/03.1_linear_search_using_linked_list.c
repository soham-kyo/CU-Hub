#include <stdio.h>
#include <stdlib.h>
typedef struct Node
{
    int data;
    struct Node *next;
}node;
node *head=NULL;
void create()
{
    node *new,*temp;
    int n;
    printf("Enter no of nodes to be inserted: "),
scanf("%d",&n);
    head = NULL;
    for(int i=1;i<=n;i++)
    {
        new = (node *)malloc(sizeof(node));
        printf("enter data:");
        scanf("%d",&new->data);
        new ->next=NULL;
        if(head==NULL)
        {
            head=new;
            temp=new;
        }
        else
        {
            temp->next=new;
            temp=new;
        }
    }
}
int main()
{
    create();
    int key;
    printf("Enter number to find:"),
scanf("%d",&key);
    node *temp = head;
    int position = 1, found = 0;
    while(temp != NULL)
    {
        if(temp->data == key)
        {
            printf("Element %d found at position %d", key, position);
            found = 1;
            break;
        }
        temp = temp->next;
        position++;
    }
    if(found == 0)
    {
        printf("Element %d not found", key);
    }
    return 0;
}