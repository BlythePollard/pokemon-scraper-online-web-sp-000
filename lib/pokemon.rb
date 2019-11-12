class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize (id=nil, name=nil, type=nil, db=nil)
    @id=id 
    @name=name 
    @type=type
    @db=db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, self.name, self.type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")
  end
end
