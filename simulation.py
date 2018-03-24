import matplotlib.pyplot as plt
import numpy as np
from random import *
import math
import plotly
plotly.tools.set_credentials_file(username=os.environ['PLOTLY_USERNAME'], api_key=os.environ['PLOTLY_API_KEY'])

import plotly.plotly as py
# Learn about API authentication here: https://plot.ly/python/getting-started
# Find your api_key here: https://plot.ly/settings/api

rectangle_height = 100
rectangle_width = 200

distances = []
for _ in range(10000):
  point_a_x = random() * rectangle_width
  point_a_y = random() * rectangle_height

  point_b_x = random() * rectangle_width
  point_b_y = random() * rectangle_height

  distance = math.sqrt((point_a_x - point_b_x)**2 + (point_a_x - point_b_x)**2)
  distances.append(distance)

plt.hist(distances)
plt.title("Distance Between two random points in a rectangle")
plt.xlabel("Distance")
plt.ylabel("Frequency")

fig = plt.gcf()

plot_url = py.plot_mpl(fig, filename='mpl-basic-histogram')
