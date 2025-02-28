def convert (message, k):
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    result = ""
    for characters in message:
        position = alphabet.index(characters)
        new_position = (position - k) % 26
        result += alphabet[new_position]
    return result
print(convert("VTAOG", 2))
