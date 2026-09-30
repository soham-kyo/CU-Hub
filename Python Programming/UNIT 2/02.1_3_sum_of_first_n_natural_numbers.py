print("--- Sum of First n Natural Numbers ---")
n = int(input("Enter the value of n: "))
i = 1
sum = 0

while i <= n:
    sum = sum + i
    i += 1

print("Sum of first", n, "natural numbers =", sum)