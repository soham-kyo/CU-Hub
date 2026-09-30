my_tuple = (10, 20, 30, 40, 50)
print("Tuple:", my_tuple)
print("First Element:", my_tuple[0])
print("Tuple Slicing:", my_tuple[1:4])

tuple2 = (60, 70)
print("Tuple Concatenation:", my_tuple + tuple2)
print("Tuple Repetition:", tuple2 * 2)

try:
    my_tuple[0] = 100
except TypeError:
    print("Tuple is immutable and cannot be modified.")