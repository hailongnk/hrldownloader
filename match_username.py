import sys

nargs = len(sys.argv)
if (nargs < 3):
  print("error: missing arguments....\n")
  print("usage: match_username.py source_file_list")
  print("   source      path to usernames source file list")
  print(" e.g: python match_username.py week1/q1.log week1/q2.log")
  sys.exit()


# Get source files
print("Matching usernames from source files:")
# intermediate list for further purposes
sources = []
for i in range(1, nargs):
  print(" %d. %s" % (i, sys.argv[i]))
  sources.append(sys.argv[i])

# parsing usernames
users = []
for f in sources:
  print("=== Reading %s ===" % (f))
  current_users = []
  with open(f, 'r') as reader:
    current_users = reader.readline().split()
  users.append(set(current_users)) # cast to set
  print(" total usernames: ", len(current_users))
  print(" first user:", current_users[0])
  print(" last user:", current_users[-1])

# matching usernames
print("=== matched among %d set(s) ===" % (len(users)))
matched = set.intersection(*users)
print(matched)
