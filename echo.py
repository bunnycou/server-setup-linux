# import
from os import path, remove

# m/s/b
userin = input("M inecraft, S team, or B oth: ")[0].lower()

print("\nReading . . .\n")
# open the files to be potentially converted if they exist
if path.exists("setupmc.sh"): mct = open("setupmc.sh").readlines()

if path.exists("setupsteam.sh"): sts = open("setupsteam.sh").readlines()

print("Writing . . .\n")
if userin == "m":
    # delete existing text and create a new one
    if path.exists("mccreate.txt"): remove("mccreate.txt")
    mcc = open("mccreate.txt", "a")

    # write the lines
    mcl = ["echo '#!/bin/sh' > ~/servers/minecraft/setup\n"] 
    for x in mct[1:]:
        mcl.append(f"echo '{x[:-1]}' >> ~/servers/minecraft/setup\n")
    mcc.writelines(mcl)
    print("Wrote mccreate.txt!")

elif userin == "s":
    # delete existing text and create a new one
    if path.exists("steamcreate.txt"): remove("steamcreate.txt")
    scc = open("steamcreate.txt", "a")

    # write the lines
    stl = ["echo '#!/bin/sh' > ~/servers/steam/setup\n"] 
    for x in sts[1:]:
        stl.append(f"echo '{x[:-1]}' >> ~/servers/steam/setup\n")
    scc.writelines(stl)
    print("Wrote steamcreate.txt!")

elif userin == "b":
    # delete existing text and create a new one
    if path.exists("mccreate.txt"): remove("mccreate.txt")
    mcc = open("mccreate.txt", "a")
    if path.exists("steamcreate.txt"): remove("steamcreate.txt")
    scc = open("steamcreate.txt", "a")

    # write the rest of the lines
    mcl = ["echo '#!/bin/sh' > ~/servers/minecraft/setup\n"] 
    for x in mct[1:]:
        mcl.append(f"echo '{x[:-1]}' >> ~/servers/minecraft/setup\n")
    mcc.writelines(mcl)
    stl = ["echo '#!/bin/sh' > ~/servers/steam/setup\n"] 
    for x in sts[1:]:
        stl.append(f"echo '{x[:-1]}' >> ~/servers/steam/setup\n")
    scc.writelines(stl)

    print("Wrote both files!")

else:
    print("Invalid Option Provided, please type m, s, or b")