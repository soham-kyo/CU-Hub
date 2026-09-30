age = 25
height = 5.9
name = "Alice"
is_student = True

print("Original Values and Types:")
print("age =", age, "-> Type:", type(age))
print("height =", height, "-> Type:", type(height))
print("name =", name, "-> Type:", type(name))
print("is_student =", is_student, "-> Type:", type(is_student))

print("\nType Conversion Examples:")
height_int = int(height)
print("float to int:", height, "->", height_int)

age_float = float(age)
print("int to float:", age, "->", age_float)

age_str = str(age)
print("int to string:", age, "->", age_str, "Type:", type(age_str))

num_str = "100"
num_int = int(num_str)
print("string to int:", num_str, "->", num_int)

print("bool(0) =", bool(0))
print("bool(25) =", bool(25))