text = "Python is easy to learn"

print("Uppercase:", text.upper())
print("Lowercase:", text.lower())

words = text.split()
print("After split:", words)

joined_text = "-".join(words)
print("After join:", joined_text)

replaced_text = text.replace("easy", "powerful")
print("After replace:", replaced_text)