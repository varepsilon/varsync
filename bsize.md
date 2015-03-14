[MainPage](MainPage.md)

# Mathematical models #

Mathematical model was exhaustively studied in [Andrew Tridgell's PhD thesis](http://samba.org/~tridge/phd_thesis.pdf) in chapter 3.3, page 58 (_page 67_ in pdf file). He shows that the best choice for block size is the **square root of file size**.

# Experimental results #

Most experimental results shows that computational complexity of algorithm depends on block size very little. But communicational complexity does depend on it.

## Results for opera test pair ##
Here you can see graph for opera test pair.

![http://chuklin.narod.ru/samba_bsizes.png](http://chuklin.narod.ru/samba_bsizes.png)

More information can be found in [gnumeric file](http://varsync.googlecode.com/svn/trunk/trunk/benchmark/bsize/blocksizes.gnumeric).

These results show that the original choice is pretty good. We tried to use block length 4 times smaller (see [gnumeric file](http://varsync.googlecode.com/svn/trunk/trunk/benchmark/bsize/blocksizes.gnumeric)) and found that for big files this gives about 2 times optimization in speedup due to some looses in computational complexity. You could examine this results [here](http://code.google.com/p/varsync/wiki/stats2#Block_size_4_times_smaller).