require 'csv'

class Gossip
  attr_accessor :content, :author

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
  
    CSV.read("./db/gossip.csv").each do |ligne| 
      all_gossips << Gossip.new(ligne[0], ligne[1])
    end 
  
    return all_gossips
  end

  def self.find(id)
    all_gossips = [] #sur le même principe que self.all, on créé un array avec tous les gossips, mais cette fois ci, on ne récupèrera que celui qui nous intéresse
    CSV.read("./db/gossip.csv").each do |ligne| 
      all_gossips << Gossip.new(ligne[0], ligne[1])
    end 
    return all_gossips[id-1] #le -1 permet de compenser le décalage créé par les headers
  end

  def self.update(id, gossip_author, gossip_content)
    all_gossips = self.all


    all_gossips[id.to_i-1].author = gossip_author #le -1 permet de compenser le décalage créé par les headers
    all_gossips[id.to_i-1].content = gossip_content
    
    CSV.open("./db/gossip.csv", "w") {|csv| all_gossips.each{|gossip| gossip.save}} #on itère sur chaque élément du fichier et CSV, 
    #et sur chacun de ces éléments on fait une nouvelle sauvegarde de chaque élément : mais le seul qui change est celui modifié ligne 39 et 40

  end

end