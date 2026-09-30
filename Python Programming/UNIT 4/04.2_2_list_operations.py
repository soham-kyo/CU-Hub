numbers = [10, 20, 30, 40, 50]
print("Original list:", numbers)

numbers.append(60)
print("After append:", numbers)

numbers.insert(2, 25)
print("After insert:", numbers)

numbers.remove(40)
print("After remove:", numbers)

print("First element:", numbers[0])
print("Last element:", numbers[-1])