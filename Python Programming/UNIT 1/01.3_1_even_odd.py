def check_even_odd(num):
    if num % 2 == 0:
        return "Even"
    else:
        return "Odd"

print("--- Even or Odd Checker ---")
number = int(input("Enter a number: "))
result = check_even_odd(number)
print(number, "is", result)