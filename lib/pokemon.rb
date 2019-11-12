class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize (id=nil, name=nil, type=nil, db=nil)
    @id=id 
    @name=name 
    @type=type
    @db=db
  end
  
  def self.save(id, name, type)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(name, type, db)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")
  end
end
