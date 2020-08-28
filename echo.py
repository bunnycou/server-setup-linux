# import
from os import path, remove

# m/s/b
userin = input("M inecraft, S team, or B oth: ")[0,0].lower

print("\nReading . . .\n")
# open the files to be potentially converted if they exist
if path.exists("setupmc.sh"): mct = open("setupmc.sh")

if path.exists("setupsteam.sh"): sts = open("steamsetup.sh")

print("Writing . . .\n")
if userin == "m":
    # delete existing text and create a new one
    if path.exists("mccreate.txt"): remove("mccreate.txt")
    mcc = open("mccreate.txt", "a")

    # write first line that has the > instead of >>
    mcc.write(f"echo '#!/bin/sh' > ~/servers/minecraft/setup")

    # write the rest of the lines
    for x in mct[1:]:
        mcc.write(f"echo '{x}' >> ~/servers/minecraft/setup")
    print("Wrote mccreate.txt!")

elif userin == "s":
    # delete existing text and create a new one
    if path.exists("steamcreate.txt"): remove("steamcreate.txt")
    scc = open("steamcreate.txt", "a")

    # write first line that has the > instead of >>
    scc.write(f"echo '#!/bin/sh' > ~/servers/steam/setup")

    # write the rest of the lines
    for x in sts[1:]:
        scc.write(f"echo '{x}' >> ~/servers/steam/setup")
    print("Wrote steamcreate.txt!")

elif userin == "b":
    # delete existing text and create a new one
    if path.exists("mccreate.txt"): remove("mccreate.txt")
    mcc = open("mccreate.txt", "a")
    if path.exists("steamcreate.txt"): remove("steamcreate.txt")
    scc = open("steamcreate.txt", "a")

    # write first line that has the > instead of >>
    mcc.write(f"echo '#!/bin/sh' > ~/servers/minecraft/setup")
    scc.write(f"echo '#!/bin/sh' > ~/servers/steam/setup")

    # write the rest of the lines
    for x in mct[1:]:
        mcc.write(f"echo '{x}' >> ~/servers/minecraft/setup")
    for x in sts[1:]:
        scc.write(f"echo '{x}' >> ~/servers/steam/setup")
    print("Wrote both files!")

else:
    print("Invalid Option Provided, please type m, s, or b")