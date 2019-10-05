require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir.entries(path).reject {|file| File.directory?(file) || file[0].include?('.')}
  end

  def self.import 
    file_list = []
    file_list <<  Dir.entries(path).reject {|file| File.directory?(file) || file[0].include?('.')}
    binding.pry
  end
    
    
end