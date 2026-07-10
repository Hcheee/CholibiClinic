import re
import os

filepath = '../DB_10.7.sql'

# Try to read the file
with open(filepath, 'rb') as f:
    raw_content = f.read()

# Decode assuming utf-16
try:
    content = raw_content.decode('utf-16')
except UnicodeDecodeError:
    content = raw_content.decode('utf-8', errors='ignore')

# Regex to find CREATE DATABASE ... GO and replace it
pattern = re.compile(r'(CREATE DATABASE \[HospitalDB\]).*?(?=GO\s+IF)', re.DOTALL | re.IGNORECASE)
new_content = pattern.sub(r'\1\nGO\n', content)

# Write back in utf-8 with BOM so SSMS and everything else reads it perfectly
with open(filepath, 'w', encoding='utf-8-sig') as f:
    f.write(new_content)

print("Fixed the file!")
