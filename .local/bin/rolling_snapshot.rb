#!/usr/bin/env ruby

require "optparse"
require "date"
require 'fileutils'

options = {snapshot_folder: 'snapshot', keep: 5}

ARGV.options do |opts|
  opts.banner = "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] FILE"

  opts.separator ""
  opts.separator "Specific Options:"

  opts.on( "-d", "--snapshot-folder", String,
           "Folder to put the snapshots" ) do |opt|
    options[:snapshot_folder] = opt
  end

  opts.on( "-k", "--keep", Integer,
           "snapshots to keep." ) do |opt|
    options[:keep] = opt.to_i
  end

  opts.separator "Common Options:"

  opts.on( "-h", "--help",
           "Show this message." ) do
    puts opts
    exit
  end

  begin
    opts.parse!
  rescue
    puts opts
    exit
  end
end

def snapshot_filename file
  name, ext = File.basename(file).split('.')
  if ext
    "#{name}.#{Date.today.iso8601}.#{ext}"
  else
    "#{name}.#{Date.today.iso8601}"
  end
end

def prepare_snapshot_folder basedir, folder
  folder = File.join basedir, folder
  unless File.exists?(folder)
    FileUtils.mkdir_p(folder)
  end
  unless File.directory?(folder)
    puts "snapshot folder `#{folder}` is not a directory."
    exit 1
  end
end

file_to_snapshot = ARGV.shift
exit 0 unless file_to_snapshot

basedir = File.dirname File.expand_path(file_to_snapshot)
snapshot_name = File.join basedir, options[:snapshot_folder], snapshot_filename(file_to_snapshot)

prepare_snapshot_folder basedir, options[:snapshot_folder]

FileUtils.cp(file_to_snapshot, snapshot_name, verbose: true )
