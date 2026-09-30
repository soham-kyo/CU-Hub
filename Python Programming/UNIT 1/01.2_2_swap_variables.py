print("--- Swapping Two Variables ---")
a = input("Enter value for first variable (a): ")
b = input("Enter value for second variable (b): ")

print("\nOriginal Values:")
print("a =", a)
print("b =", b)

temp = a
a = b
b = temp

print("\nAfter Swapping using Temporary Variable:")
print("a =", a)
print("b =", b)

x = 10
y = 20
print("\nOriginal Values (x =", x, ", y =", y, ")")
x, y = y, x
print("After Swapping without Temporary Variable:")
print("x =", x, ", y =", y)

p = 15
q = 25
print("\nOriginal Values (p =", p, ", q =", q, ")")
p = p + q
q = p - q
p = p - q
print("After Swapping using Arithmetic Method:")
print("p =", p, ", q =", q)