module Concerns::Findable
   
  def self.find_by_name(name)
    target = @@all.select{|target| target.name == name}
    target[0]
  end
  
  
end