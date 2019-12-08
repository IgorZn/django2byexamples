class Poem:
    def __init__(self, title: str) -> None:
        self.title = title
    def indent(self, spaces: int):
        """Indent the poem with the specified number of spaces."""
        self.title = " " * spaces + self.title
        return self
    def suffix(self, author: str):
        """Suffix the poem with the author name."""
        self.title = f"{self.title} - {author}"
        return self


po = Poem
print(
	po('Story about piska')
	.suffix('Goo')
	.suffix('and Poo')
	.indent(4)
	.title
)
