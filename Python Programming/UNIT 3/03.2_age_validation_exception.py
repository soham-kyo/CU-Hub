class AgeError(Exception):
    pass

try:
    age = int(input("Enter your age: "))
    if age < 18:
        raise AgeError("Age must be 18 or above.")
    print("Age is valid. You are eligible.")
except AgeError as e:
    print("Age Error:", e)