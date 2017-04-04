class Legalstatus < ActiveRecord::Migration[5.0]
  def self.up
    @now = DateTime.now.to_s(:db)
    @s = "insert into legalstatuses (id, text, created_at, updated_at) values ('G', 'Duldung', \"" + @now + "\", \"" + @now + "\")"
    execute @s

  end
  def self.down
    @s = "delete from legalstatuses where id = 'G'"
    execute @s
  end
end
