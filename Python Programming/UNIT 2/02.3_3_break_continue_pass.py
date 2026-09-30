print("--- Demonstration of break, continue, and pass ---")

print("\nUsing break:")
for i in range(1, 11):
    if i == 6:
        break
    print(i, end=" ")

print("\n\nUsing continue:")
for i in range(1, 11):
    if i == 6:
        continue
    print(i, end=" ")

print("\n\nUsing pass:")
for i in range(1, 6):
    if i == 3:
        pass
    print(i, end=" ")
print()