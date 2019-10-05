require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir.entries(path).reject {|file| File.directory?(file) || file[0].include?('.')}
  end

  def import 
    file_list = []
    file_list <<  Dir.entries(path).reject {|file| File.directory?(file) || file[0].include?('.')}
    file_list.each {|filename| Song.create_from_filename(filename)}
  end
    
    
end