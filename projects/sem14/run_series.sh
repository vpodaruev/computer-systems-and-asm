#!/bin/env bash
# ==============
out_file="cache.log"
line_max=9000
n_runs=5
# ==============

echo "out_file = '$out_file'"
echo "line_max = $line_max"
echo "n_runs = $n_runs"

# temporary output file
tmp_file="${out_file}.tmp"

# header
echo '"line_size" "n" "get_order_1" "get_order_2"' > $tmp_file

# compile and run
echo -n "line_size = ["
for (( sz = 8; sz <= line_max; sz *= 2 ))
do
	line_size=$((sz - 4))  # subtract the size of `id`
	echo -n "${line_size}, "
	g++ -O3 -DLINE_SIZE="$line_size" -o prog cache.cpp
	for (( i = 0; i <= n_runs; ++i ))
	do
		./prog >> $tmp_file
	done
done
echo "]"

# clean up
rm ./prog
mv $tmp_file $out_file
