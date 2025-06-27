from string import ascii_lowercase
import plotly.express as px
import pandas as pd


def histogram(characters: list[str]):
    df = pd.DataFrame({"letter": characters})
    fig = px.histogram(
        df,
        x="letter",
        category_orders={"letter": list(ascii_lowercase)},
    )
    fig.show()


def shift_lowercase_letter(character: str, count: int) -> str:
    return chr((ord(character) - ord("a") + count) % 26 + ord("a"))


def caesar_encrypt(characters: list[str]) -> list[str]:
    """
    Only works with an array of lowercase ascii letters
    """

    return [shift_lowercase_letter(character, 5) for character in characters]


def main():
    with open("die_verwandlung.txt", "r") as file:
        text = "".join(file.readlines())

    text = (
        text.lower()
        .replace("ä", "ae")
        .replace("ö", "oe")
        .replace("ü", "ue")
        .replace("ß", "ss")
    )

    characters = [character for character in list(text) if character in ascii_lowercase]
    encrypted_characters = caesar_encrypt(characters)

    histogram(characters)
    histogram(encrypted_characters)


if __name__ == "__main__":
    main()
