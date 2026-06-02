import matplotlib.pyplot as plt
import numpy as np

# List:
# 16 A+
# 15 A
# 14 A-
# 13 B +
# 12 B
# 11 B -
# 10 C +
# 9 C
# 8 C -
# 7 D +
# 6 D
# 5 D -
# 4 E +
# 3 E
# 2 E -
# 1 U

# (5 x 3) + 1

x = np.array([1, 2, 3, 4, 5, 6, 7, 8])
y = np.array([13, 16, 9, 8, 3, 10, 4, 12])

plt.plot(x, y)

plt.xlabel("Grades (16 is A+, 1 is U)")
plt.ylabel("First test to latest test")

plt.show()
