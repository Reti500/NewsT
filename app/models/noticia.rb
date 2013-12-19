class Noticia < ActiveRecord::Base
	belongs_to :user
	belongs_to :categoria

	has_many :asignarTags
	has_many :tags, through: :asignarTags

	has_attached_file :imagen, :styles => { :small => "100x100" },
	    :storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    :dropbox_options => {
	    	:path => proc { |style| "Noticias/#{id}/#{style}/#{imagen.original_filename}" }
	    }
end
