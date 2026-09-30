numbers = [15, 25, 10, 40, 30, 20]
total = 0

for number in numbers:
    total += number

average = total / len(numbers)

print("List:", numbers)
print("Sum:", total)
print("Average:", average)
print("Maximum:", max(numbers))
print("Minimum:", min(numbers))