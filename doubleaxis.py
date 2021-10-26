import pandas as pd
import numpy as np
from matplotlib import pyplot as plt


def main():

	file_path = ""
	file_name = ""

	fullpath = file_path+file_name

	df = pd.read_csv(fullpath, usecols=[0,1], names=['temp', 'hum'])

	temperature = df['temp'].tolist()
	humidity = df['hum'].tolist()

	n = np.arange(0, len(temperature), 1)

	fig, ax1 = plt.subplots()

	ax2 = ax1.twinx()
	ax1.plot(n, temperature, 'r-')
	ax2.plot(n, humidity, 'b-')

	plt.show()

if __name__ == '__main__':
	main()
