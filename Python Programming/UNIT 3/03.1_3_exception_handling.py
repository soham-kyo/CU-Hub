# Exception 1: ValueError
try:
    number = int(input("Enter an integer: "))
    print("You entered:", number)
except ValueError:
    print("Invalid input! Please enter an integer.")

# Exception 2: ZeroDivisionError
try:
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))
    result = num1 / num2
    print("Result:", result)
except ZeroDivisionError:
    print("Error! Division by zero is not allowed.")