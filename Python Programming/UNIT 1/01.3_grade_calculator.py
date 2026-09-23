def calculate_grade(marks):
    if marks >= 90:
        return "A"
    elif marks >= 80:
        return "B"
    elif marks >= 70:
        return "C"
    elif marks >= 60:
        return "D"
    else:
        return "F"

print("--- Grade Calculator ---")
marks = float(input("Enter your marks: "))

if 0 <= marks <= 100:
    grade = calculate_grade(marks)
    print("Your marks:", marks)
    print("Your grade:", grade)
else:
    print("Invalid marks! Please enter marks between 0 and 100.")