#!/usr/bin/env ruby

require "optparse"
require "date"
require 'fileutils'

options = {snapshot_folder: 'snapshot', keep: 5}

ARGV.options do |opts|
  opts.banner = "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] FILE"

  opts.separator ""
  opts.separator "Specific Options:"

  opts.on( "-d", "--snapshot-folder FOLDER", String,
           "Folder to put the snapshots" ) do |opt|
    options[:snapshot_folder] = opt
  end

  opts.on( "-k", "--keep NUMBER", Integer,
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

def prepare_snapshot_folder folder
  unless File.exists?(folder)
    FileUtils.mkdir_p(folder)
  end
  unless File.directory?(folder)
    puts "snapshot folder `#{folder}` is not a directory."
    exit 1
  end
end

def remove_old_snapshots folder, filename, keep
  basename, _ext = filename.split('.')
  snapshots = Dir["#{folder}/#{basename}.*"].sort
  files_to_delete = snapshots[0..-(keep+1)]
  files_to_delete.each { |e| FileUtils.rm e }
end

file_to_snapshot = ARGV.shift
exit 0 unless file_to_snapshot

basedir = File.dirname File.expand_path(file_to_snapshot)
snapshot_folder = File.join basedir, options[:snapshot_folder]
snapshot_name = File.join snapshot_folder, snapshot_filename(file_to_snapshot)

prepare_snapshot_folder snapshot_folder

FileUtils.cp(file_to_snapshot, snapshot_name)
FileUtils.chown nil, 'btsync', snapshot_name
FileUtils.chmod 'g+w', snapshot_name

remove_old_snapshots snapshot_folder, File.basename(file_to_snapshot, '.'), options[:keep]
