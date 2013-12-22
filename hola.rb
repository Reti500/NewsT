@tag = []
@str = "#Esto es un #Hashtag de prueba #AprendoAProgramar#Ruby".split(" ")


# @str.each do |cad|
# 	if cad.include? "#"
# 		@tag << cad.split( /#(\S+)/ ).last
# 	end
# end



def getTags( palabras, tags )
	palabras.each do |p|
		if p.include? "#"
			minitag = p.split( /#(\S+)/ ).last
			unless minitag.include? "#"
				tags << minitag
			end
		end
	end
end

getTags( @str, @tag )
@tag