#!/usr/bin/python3

import argparse, pathlib
import pandas as pd



parser = argparse.ArgumentParser (description="Make a TeX table from data columns")
parser.add_argument ("files", nargs="+", type=pathlib.Path,
                     help="Filename with data columns")

args = parser.parse_args()

t = pd.DataFrame ()
for filename in args.files :
  c = pd.read_table (filename)
  print (c)

# print (t)
