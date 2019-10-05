require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir.entries(path).reject {|file| File.directory?(file) || file[0].include?('.')}
  end

end