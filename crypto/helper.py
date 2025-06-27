def pos(letter: str) -> int:
    """
    Calculate the position of a lowercase letter in the alphabet
    (A=0, equals offset in Viginere)
    """

    return ord(letter) - ord("a")


def rev(offset: int) -> str:
    return chr(offset + ord("a"))
