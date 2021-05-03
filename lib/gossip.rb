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

    def self.update(id, gossip_author, gossip_content)
        all_gossips = self.all


        all_gossips[id.to_i - 1].author = gossip_author #le -1 permet de compenser le décalage créé par les headers
        all_gossips[id.to_i - 1].content = gossip_content
    
        CSV.open("/home/thomasmichonneau/Bureau/THP/THPJ19/the_gossip_project_sinatra/db/gossip.csv", "w") {|csv| all_gossips.each{|gossip| gossip.save}} #on itère sur chaque élément du fichier et CSV, 
        #et sur chacun de ces éléments on fait une nouvelle sauvegarde de chaque élément : mais le seul qui change est celui modifié ligne 39 et 40

    end
end
