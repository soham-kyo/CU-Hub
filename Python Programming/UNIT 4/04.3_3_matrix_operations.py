matrix1 = [
    [1, 2],
    [3, 4]
]
matrix2 = [
    [5, 6],
    [7, 8]
]

addition = [
    [matrix1[i][j] + matrix2[i][j] for j in range(2)]
    for i in range(2)
]

print("Matrix Addition:")
for row in addition:
    print(row)

multiplication = [
    [0, 0],
    [0, 0]
]

for i in range(2):
    for j in range(2):
        for k in range(2):
            multiplication[i][j] += matrix1[i][k] * matrix2[k][j]

print("\nMatrix Multiplication:")
for row in multiplication:
    print(row)