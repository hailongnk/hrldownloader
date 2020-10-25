import sys

nargs = len(sys.argv)
if (nargs != 3):
  print("usage: match_username.py source target")
  print("   source      path to usernames source file")
  print("   target      path to usernames target file")
  print(" e.g: python match_username.py week1/q1.log week1/q2.log")
  sys.exit()

# Get source and target files
q1 = sys.argv[1]
q2 = sys.argv[2]
print("Matching usernames between %s and %s" % (q1, q2))

print("Reading %s" % (q1))
q1_users = []
with open(q1, 'r') as reader:
  q1_users = reader.readline().split()

print("Reading %s" % (q2))
q2_users = []
with open(q2, 'r') as reader:
  q2_users = reader.readline().split()

print("=== %s ===" % (q1))
print("total usernames: ", len(q1_users))
print("first user:", q1_users[0])
print("last user:", q1_users[-1])

print("=== %s ===" % (q2))
print("total usernames: ", len(q2_users))
print("first user:", q2_users[0])
print("last user:", q2_users[-1])

print("=== matched ===")
matched = set.intersection(set(q1_users), set(q2_users))
print(matched)