print("--- Interest Calculation ---")
principal = float(input("Enter principal amount: "))
rate = float(input("Enter rate of interest: "))
time = float(input("Enter time period (in years): "))

simple_interest = (principal * rate * time) / 100
compound_interest = principal * ((1 + rate / 100) ** time) - principal

print("\nResults:")
print("Simple Interest =", simple_interest)
print("Compound Interest =", compound_interest)
print("Total Amount with Compound Interest =", principal + compound_interest)