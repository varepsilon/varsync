#!/usr/bin/ruby

# Benchmark script for comparison of different rsync implementations
# Copyright: Aleksandr Chuklin, 2009


# ================== OPTIONS FOR LOCAL MACHINE ================================
ROOT_DIR = "/home/fenix/progs/projects/varsync/trunk"
BMTMP_ROOT = "/home/fenix/docs/tmp/bmtmp"
ORIGINAL_DIR = BMTMP_ROOT + "/" + "original"  
SOURCE_DIR = BMTMP_ROOT + "/" + "source"  
DESTINATION_DIR = BMTMP_ROOT + "/" + "destination"  
SSH_USER = 'fenix'
SSH_SERVER = 'localhost'

# "oldorig" --- original unchanged rsync binary
# "orig" --- new binary with old options (backwards-compatible)
# "random" --- both weak and strong sums are random
# "randorig" --- weak sum is original while strong one is random

RSYNC_TYPES_LIST = ["random"]


# "ident" --- almost identical files (.xml)
# "rsync" --- rsync sources (.tar.gz) [3.0.6 -> 20090507NIGHTLY, 809 KB]
# "opera" --- opera qt3_amd64 binaries (.deb) [9.50 -> 9.51.2061, 8.9 MB]
# "samba" --- samba sources (.tar) [3.4.0rc1 -> 3.4.0, 111.3 MB]
# "rsyncdir" --- rsync sources (source tree) [3.0.6 -> 20090507NIGHTLY, 3 MB]
# "linux" --- linux sources (.tar) [2.6.29 -> 2.6.30, 353.2 MB]

TEST_PAIRS_LIST = ["linux"] 

SIZES = [700, 1000, 4698, 5000, 10000, 15000, 18792, 20000, 
  50000, 100000]

RSYNC_ORIG_VERSION = "3.0.6"
RSYNC_ORIG_BIN = ROOT_DIR + "/" + "orig/rsync-#{RSYNC_ORIG_VERSION}/rsync"
RSYNC_RANDOM_BIN = ROOT_DIR + "/" + "rsync"
RSYNC_OLDORIG_OPTS = "-avv --stats --rsync-path='#{RSYNC_ORIG_BIN}'" 
RSYNC_ORIG_OPTS = "-avv --stats --rsync-path='#{RSYNC_RANDOM_BIN}'" 
RSYNC_RANDOM_OPTS = "-avv --stats " \
                    "--rsync-path='#{RSYNC_RANDOM_BIN} --random2 --random' " \
                    "--random2 --random"
RSYNC_RANDORIG_OPTS = "-avv --stats " \
                    "--rsync-path='#{RSYNC_RANDOM_BIN} --random2' " \
                    "--random2"
#==============================================================================

require 'benchmark'
require 'ping'
require 'fileutils'
require 'open3'

# test on different pairs
TEST_PAIRS_LIST.each do |test_pair|
  # compare original rsync with other methods
  RSYNC_TYPES_LIST.each do |rsync_type|
    begin
      original_old = ORIGINAL_DIR + "/" + test_pair + "_old"
      original_new= ORIGINAL_DIR + "/" + test_pair + "_new"
      old = DESTINATION_DIR + "/" + test_pair + "_old"
      new = SOURCE_DIR + "/" + test_pair + "_new"
      rsync_targets = "#{new} #{SSH_USER}@#{SSH_SERVER}:#{old} "
      if rsync_type == "oldorig" 
        rsync_cmd = "#{RSYNC_ORIG_BIN} #{RSYNC_OLDORIG_OPTS} "
      elsif rsync_type == "orig"
        rsync_cmd = "#{RSYNC_RANDOM_BIN} #{RSYNC_ORIG_OPTS} " 
      elsif rsync_type == "random"
        rsync_cmd = "#{RSYNC_RANDOM_BIN} #{RSYNC_RANDOM_OPTS} "
      elsif rsync_type == "randorig"
        rsync_cmd = "#{RSYNC_RANDOM_BIN} #{RSYNC_RANDORIG_OPTS} "
      else 
        raise NotImplementedError, "Error. No such rsync type: #{rsync_type}"
      end

      SIZES.each do |size|
        printf("\t Stats for *%s* rsync on %s test pair:\n", 
             rsync_type.capitalize, test_pair)
        puts("Block size: #{size}")
        rsync_run_cmd = rsync_cmd + "--block-size=#{size.to_s} "
        rsync_run_cmd += rsync_targets
        # prepare test_pair:
          # TODO: correct directory handling (trailing slash)
        FileUtils.rm_rf(old)
        FileUtils.cp_r(original_old, old)
#      FileUtils.rm_rf(new)
#      FileUtils.cp_r(original_new, new)
        # now run rsync itself
        run_time = Benchmark.realtime do
          # puts("Starting command: #{rsync_cmd}")
          Open3::popen3(rsync_run_cmd) do |stdin, stdout, stderr|
            puts(stdout.read.strip)
            puts(stderr.read.strip)
          end 
        end
        puts("Execution time: #{run_time}")
      end
    rescue NotImplementedError => message
      puts(message)
    end
  end
end

# Please, don't remove modeline
# vim:fenc=utf-8:ft=ruby:ai:si:ts=2:sw=2:et:fdm=syntax:

