a = float(input("Enter first number (a): "))
b = float(input("Enter second number (b): "))

print("\nRelational Operators Results:")
print("a == b :", a == b)
print("a != b :", a != b)
print("a > b :", a > b)
print("a < b :", a < b)
print("a >= b :", a >= b)
print("a <= b :", a <= b)

print("\nLogical Operators with Conditional Statements:")
if a > 0 and b > 0:
    print("Both numbers are positive.")
elif a > 0 or b > 0:
    print("At least one number is positive.")
else:
    if not a == b:
        print("Both numbers are negative or zero.")
        print("The numbers are not equal.")
    else:
        print("The numbers are equal.")

print("\nNumber Comparison Results:")
if a > b:
    print(a, "is greater than", b)
elif a < b:
    print(a, "is less than", b)
else:
    print(a, "is equal to", b)