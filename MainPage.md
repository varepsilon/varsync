_Welcome to the varsync wiki!_


Work is in progress now. Currently you can play with these options:
  * _--random_ **client and server** option
  * _--random2_ **client and server** option
  * _--small-blength_ **server** option
  * _--irreducible`_`poly_ **client and server** option

See **benchmark/run.rb** script to get to know how to use these options.


# Statistics #
Stats can be viewed [here](http://code.google.com/p/varsync/wiki/stats).
# Study of false alarms and bit-strength #
Graphics can be viewed [on EditGrid](http://www.editgrid.com/user/varepsilon/false-alarms)
# Profiling #
Profiling results can be viewed [here](http://code.google.com/p/varsync/wiki/profiling).
# Different implementations #
## Random implementation ##
Random implementation comprises this ideas:
  1. Random-based weak checksum (**--random** option).
  1. Random-based strong checksum (**--random2** option).
  1. Smaller block size (**--small-blength** option) for better speedup.
First idea aims to give easy-to-calculate **weak checksum** with the same rolling property (see [original implementation](http://rsync.samba.org/tech_report/node3.html)) based on random-generated numbers. More information about the idea can be found [here](http://code.google.com/p/varsync/wiki/idea).

Second idea is about security despite it's being easy-to-calculate also. It uses the same technique as first idea but is more stronger. Opposite to the original md4/md5-based technique it doesn't rely on the strength of any sum: it is random =) But we do not completely rely on the randomness: we leave the file md5 checksum. So even if the gods will dislike us md5 can still help us!

## Irreducible polynomial hashing ##
The idea is that a hash value is a polynomial in a ring GF(2)`[`x`]`/q(x), which is obtained from word by treating it as a polynomial coefficients and performing factorization procedure. q(x) here is an irreducible polynomial

For exhaustive study of this and other ideas see article Lemire et al. «Recursive n-gram hashing is pairwise independent, at best»

# User guide #
With this package some test suite is also distributed. It can be found in benchmark/ directory. In order to perform tests similar to mine you should do following steps:
  * Read, understand and edit run.rb ruby script
  * Install ruby interpreter
  * Adjust ssh on your machine in order to login without password
  * (optional) edit run shell script
  * run!