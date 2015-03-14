
# Profiling #
Profiling results:

## 20.07.09 ##
Profile for **opera** test pair using -02 compiler option:
### Before optimizing mod2 function ###
  * **Server**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name
 50.00      0.46     0.46        1   460.01   890.03  match_sums
 31.52      0.75     0.29  8849944     0.00     0.00  update_checksum1
  8.70      0.83     0.08 17699888     0.00     0.00  getminuspower
  4.35      0.87     0.04  8850498     0.00     0.00  map_ptr
  2.17      0.89     0.02   138441     0.00     0.00  md5_process
  2.17      0.91     0.02                             mod2
  1.09      0.92     0.01        1    10.00    10.00  unmap_file
```

  * **Client**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name
 57.14      0.12     0.12     2983     0.04     0.04  get_checksum2
 42.86      0.21     0.09     2983     0.03     0.03  get_checksum1
```

### After optimizing mod2 function ###
  * **Server**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 40.30      0.27     0.27  8849944     0.00     0.00  update_checksum1
 23.88      0.43     0.16        1   160.00   640.02  match_sums
 16.42      0.54     0.11 17699888     0.00     0.00  getminuspower
 11.94      0.62     0.08  8850506     0.00     0.00  map_ptr
  2.99      0.64     0.02   138441     0.00     0.00  md5_process
  2.99      0.66     0.02                             mod2
  1.49      0.67     0.01       88     0.11     0.11  read_loop
```

  * **Client**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 71.43      0.10     0.10     2983     0.03     0.03  get_checksum1
 14.29      0.12     0.02     2983     0.01     0.01  get_checksum2
 14.29      0.14     0.02        1    20.00   140.00  recv_generator
```

## 21.07.09 ##
Now we use -O1 compiler option. **NOTE**: implementation of "--random" option has been changed.
  * **Server**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  us/call  us/call  name    
 25.93      0.14     0.14                             match_sums
 20.37      0.25     0.11  8849944     0.01     0.03  update_checksum1
 14.82      0.33     0.08  8849944     0.01     0.01  getminuspower
 14.82      0.41     0.08                             map_ptr
 12.96      0.48     0.07 17713111     0.00     0.00  mod1
  5.56      0.51     0.03                             md5_process
  3.70      0.53     0.02                             main
  1.85      0.54     0.01     4333     2.31     2.31  writefd_unbuffered
```

  * **Client**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 28.57      0.04     0.04  8851928     0.00     0.00  mod1
 28.57      0.08     0.04     2983     0.01     0.03  get_checksum1
 21.43      0.11     0.03  8854911     0.00     0.00  mod2
 21.43      0.14     0.03     2983     0.01     0.02  get_checksum2
```

## 25.07.09 ##
We made an optimisation of get\_checksum2. Unfortunately, the same changes for get\_checksum1 seems harder to implement.
  * **Server**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 44.26      0.27     0.27        1   270.01   595.02  match_sums
 21.31      0.40     0.13  8849944     0.00     0.00  update_checksum1
 17.21      0.51     0.11 17713111     0.00     0.00  mod1
  5.74      0.54     0.04  8850507     0.00     0.00  map_ptr
  5.74      0.58     0.04  8849944     0.00     0.00  getminuspower
  3.28      0.60     0.02   138441     0.00     0.00  md5_process
  1.64      0.61     0.01                             child_main
```

  * **Client**:
```
 %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 44.45      0.04     0.04     2983     0.01     0.02  get_checksum1
 33.33      0.07     0.03  8851928     0.00     0.00  mod1
 11.11      0.08     0.01  4428947     0.00     0.00  mod2
 11.11      0.09     0.01     2983     0.00     0.01  get_checksum2
```

## 13.08.09 (optimise number of mod1 calls. Not in SVN yet!) ##
Here is the results for different test pairs. Pay attantion at the _number of calls_.

### Opera ###

  * **Server**:
```
  %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 31.95      0.23     0.23        1   230.01   699.36  hash_search
 16.67      0.35     0.12  8849944     0.00     0.00  update_checksum1
 13.19      0.45     0.10  8855904     0.00     0.00  mod1
 12.50      0.54     0.09  8850507     0.00     0.00  map_ptr
 12.50      0.63     0.09   138441     0.00     0.00  md5_process
  6.94      0.68     0.05  8849944     0.00     0.00  getminuspower
  3.47      0.70     0.03       14     1.79     1.79  get_checksum2
  1.39      0.71     0.01        1    10.00    10.00  map_file
  1.39      0.72     0.01        1    10.00    10.00  md5_begin
........................................................................
  0.00      0.72     0.00     5278     0.00     0.00  mod2
```

  * **Client**:
```
  %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 60.00      0.06     0.06     2983     0.02     0.03  get_checksum1
 30.00      0.09     0.03  2230880     0.00     0.00  mod1
 10.00      0.10     0.01  1127372     0.00     0.00  mod2
........................................................................
  0.00      0.10     0.00     2983     0.00     0.00  get_checksum2
```

### Samba (new!) ###

  * **Server**:
```
  %   cumulative   self              self     total           
 time   seconds   seconds    calls   s/call   s/call  name    
 37.38      2.34     2.34        1     2.34     6.20  hash_search
 16.13      3.35     1.01  1738561     0.00     0.00  md5_process
 13.74      4.21     0.86 61473168     0.00     0.00  mod1
  9.58      4.81     0.60 44807456     0.00     0.00  update_checksum1
  6.87      5.24     0.43 44829638     0.00     0.00  map_ptr
  4.95      5.55     0.31     6553     0.00     0.00  get_checksum2
  4.95      5.86     0.31     6304     0.00     0.00  get_checksum1
  3.35      6.07     0.21 44807456     0.00     0.00  getminuspower
  1.92      6.19     0.12  8676172     0.00     0.00  mod2
```

  * **Client**:
```
  %   cumulative   self              self     total           
 time   seconds   seconds    calls   s/call   s/call  name    
 30.09      0.36     0.36    10552     0.00     0.00  get_checksum2
 27.12      0.68     0.32    10552     0.00     0.00  get_checksum1
 23.31      0.95     0.28 27877712     0.00     0.00  mod1
 19.49      1.18     0.23 13981064     0.00     0.00  mod2
```

**NB1**: Compiler optimisation option was set to 0.

**NB2**: For tne checksum2 we read 2 bytes instead of 1 that makes the difference.