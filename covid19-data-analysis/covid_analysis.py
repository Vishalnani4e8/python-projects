import pandas as pd
import matplotlib.pyplot as plt

# Sample COVID-19 dataset
data = {
    "Country": ["India", "USA", "Brazil", "UK", "Russia"],
    "Confirmed": [45000000, 35000000, 30000000, 24000000, 22000000],
    "Recovered": [44000000, 34000000, 29000000, 23000000, 21000000],
    "Deaths": [530000, 610000, 660000, 190000, 380000]
}

df = pd.DataFrame(data)

print("COVID-19 Data")
print(df)

# Plot confirmed cases
plt.figure()
plt.plot(df["Country"], df["Confirmed"])
plt.title("COVID-19 Confirmed Cases by Country")
plt.xlabel("Country")
plt.ylabel("Confirmed Cases")
plt.show()
