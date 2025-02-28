list_a = [1, 2, 3, 5, 6, 8, 9]
list_b = [3, 2, 1, 5, 6, 0]

result = []

for number in list_a:
    if number in list_b:
        result.append(number)
print(result)
