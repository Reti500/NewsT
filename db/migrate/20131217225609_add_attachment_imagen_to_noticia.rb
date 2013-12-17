class AddAttachmentImagenToNoticia < ActiveRecord::Migration
  def self.up
    change_table :noticia do |t|
      t.attachment :imagen
    end
  end

  def self.down
    drop_attached_file :noticia, :imagen
  end
end
