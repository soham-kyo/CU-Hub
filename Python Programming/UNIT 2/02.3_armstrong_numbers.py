print("--- Armstrong Numbers Between 1 and 1000 ---")

for number in range(1, 1001):
    temp = number
    digits = len(str(number))
    total = 0
    
    while temp > 0:
        digit = temp % 10
        total = total + digit ** digits
        temp = temp // 10
        
    if total == number:
        print(number, end=" ")
print()