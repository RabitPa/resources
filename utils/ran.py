#!/usr/bin/python

import string
import random

def generate_random_string():
    chars = string.letters + string.digits
    return "".join(random.sample(chars, 8))

if __name__ == '__main__':
    for i in range(0, 20):
        print generate_random_string()
