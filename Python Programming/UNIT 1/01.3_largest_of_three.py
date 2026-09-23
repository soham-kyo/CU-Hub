def find_largest(a, b, c):
    if a > b:
        if a > c:
            return a
        else:
            return c
    else:
        if b > c:
            return b
        else:
            return c

print("--- Find Largest Among Three Numbers ---")
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))
num3 = float(input("Enter third number: "))

largest = find_largest(num1, num2, num3)
print("The largest number is:", largest)