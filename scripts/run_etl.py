import os

print("Starting local ETL trigger script...")

command = "python etl/main.py"
print(f"Command: {command}")

os.system(command)
