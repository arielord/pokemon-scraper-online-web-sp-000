class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end
  
  def self.find(id, db)
    attribute = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    Pokemon.new(id: attribute[0], name: attribute[1], type: attribute[2], db: db, hp: 60)
  end
end
