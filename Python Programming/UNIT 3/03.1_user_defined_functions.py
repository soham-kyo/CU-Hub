def add(a, b):
    return a + b

def greet(name, message="Welcome to Python"):
    print(name, message)

def student(name, age):
    print("Name:", name)
    print("Age:", age)

def total(*numbers):
    return sum(numbers)

print("Addition:", add(10, 20))
greet("Soham")
student(age=21, name="Soham")
print("Total:", total(10, 20, 30, 40, 50))