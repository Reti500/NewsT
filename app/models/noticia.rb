class Noticia < ActiveRecord::Base
	belongs_to :user
	belongs_to :categoria

	has_many :asignarTags
	has_many :tags, through: :asignarTags

	has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
