require 'pry'
require 'csv'

class Gossip 
    attr_reader :author, :content
    
    def initialize(author, content)
         @author = author
         @content = content
     end

    def save
        CSV.open("/home/thomasmichonneau/Bureau/THP/THPJ18/db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end    
    end

    def self.all
        all_gossips = []

        CSV.read("/home/thomasmichonneau/Bureau/THP/THPJ19/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
      
        return all_gossips
    end

    def self.find(id)
        all_gossips = []
        
        CSV.read("/home/thomasmichonneau/Bureau/THP/THPJ19/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end

        return all_gossips[id - 1]
       
        
    end
    
end

#binding.pry