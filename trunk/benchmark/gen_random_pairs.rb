#!/usr/bin/ruby

# Script for generating random test pairs
# Copyright: Aleksandr Chuklin, 2009

BMTMP_ROOT = "/home/fenix/docs/tmp/bmtmp"
ORIGINAL_DIR = BMTMP_ROOT + "/" + "original"
WIKIDB = BMTMP_ROOT + "/../ruwiki-20081228-pages-articles.xml"

QUANTITY = 10
CHARS = 128
SEED = 42

require "open3"

rndPairsList = "TEST_PAIRS_LIST = ["
MIN_SIZE = 1_000_000
MAX_SIZE = 100 * MIN_SIZE
srand(SEED)
for i in 1..QUANTITY do
    size = MIN_SIZE + rand(MAX_SIZE - MIN_SIZE)
    basicFileName = "urandom" + size.to_s
    puts("Generating " + basicFileName + "...")
    rndPairsList += "\"" + basicFileName + "\", "
    file1Name = ORIGINAL_DIR + "/" + basicFileName + "_old"
    file2Name = ORIGINAL_DIR + "/" + basicFileName + "_new"
    Open3::popen3("head -c " + size.to_s + 
        " /dev/urandom >" + file1Name) do |stdin, stdout, stderr|
          puts(stdout.read.strip)
          puts(stderr.read.strip)
    end 

# Make second file another size in order to force synchronization
# (No "uptodate" suppositions from rsync)
    Open3::popen3("head -c " + (size + 1).to_s +
        " /dev/urandom >" + file2Name) do |stdin, stdout, stderr|
          puts(stdout.read.strip)
          puts(stderr.read.strip)
    end 
end
rndPairsList[-2..-1] = "]"
puts(rndPairsList)

