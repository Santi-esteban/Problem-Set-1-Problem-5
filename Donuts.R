
# Using R, reproduce the Figure on the slide with the Law of Large Numbers
# following the instructions  presented in the previous slide.
# Note that the dashed horizontal lines are set a 0.49 and 0.51, respectively
# For replicability, set your seed to 12345 using set.seed(12345).

# Set the seed for reproducibility
set.seed(12345)

# Define the number of experiments
n_experiments <- 5000

# Simulate coin flips
flips <- sample(c("Heads", "Tails"), size = n_experiments, replace = TRUE)

# Calculate the cumulative number of heads
cumulative_heads <- cumsum(flips == "Heads")

# Compute the share of heads
share_of_heads <- cumulative_heads / (1:n_experiments)

# Plotting
library(ggplot2)
df <- data.frame(Flip = 1:n_experiments, ShareOfHeads = share_of_heads)

ggplot(df, aes(x = Flip, y = ShareOfHeads)) +
  geom_line(color = "blue") +
  geom_hline(yintercept = 0.5, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0.51, linetype = "dashed", color = "red") +
  geom_hline(yintercept = 0.49, linetype = "dashed", color = "green") +
  labs(title = "Law of Large Numbers: Share of Heads Over Time",
       x = "Number of Flips", y = "Share of Heads") +
  theme_minimal()