file = open("sample.txt", "r")
content = file.read()
lines = content.splitlines()
words = content.split()
characters = len(content)

print("Number of lines:", len(lines))
print("Number of words:", len(words))
print("Number of characters:", characters)

file.close()