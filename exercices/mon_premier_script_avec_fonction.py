import unittest
from typing import List

MIN_LENGTH = 7


def count_names_longer_than(names: List[str], min_length: int = MIN_LENGTH) -> int:
    return sum(1 for name in names if len(name) > min_length)


class TestCountNames(unittest.TestCase):
    def test_count_names_longer_than(self):
        names = ["Guillaume", "Gilles", "Juliette", "Antoine", "François", "Cassandre"]
        result = count_names_longer_than(names)
        self.assertEqual(result, 4)


if __name__ == "__main__":
    unittest.main()