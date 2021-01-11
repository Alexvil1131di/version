class Read

	word = ""
	x = 0
	data = 0

	def read_string(word,x)  
	  while (x < 1)

	    input = STDIN.getc.chr

	    if input >= 'a' && input <= 'z'
	    printf input
	    word = "#{word}"+"#{input}"

	    elsif input == "\b"
	    printf "\b \b" 
	    input = "\b \b"
	    word = "#{word}"+"#{input}"

	    elsif input == "\n"
	    puts""
	    x = x + 1

	    elsif input == " "
	    printf " "
	    word = "#{word}"+"#{input}"
	    end

	    
	  end
	  return "#{word}"
	end

	def read_int(word,x)  
	  while (x < 1)

	    input = STDIN.getc.chr

	    if input >= '0' && input <= '9'
	    printf input
	    word = "#{word}"+"#{input}"

	    elsif input == "\b"
	    printf "\b \b" 
	    input = "\b \b"
	    word = "#{word}"+"#{input}"

	    elsif input == "\n"
	    puts""
	    x = x + 1
	    end

	    
	  end
	  return word.chomp
	end

	def read_dec(word,x)  
	  while (x < 1)

	    input = STDIN.getc.chr

	    if input >= '0' && input <= '9' || input == '.'
	    printf input
	    word = "#{word}"+"#{input}"

	    elsif input == "\b"
	    printf "\b \b" 
	    input = "\b \b"
	    word = "#{word}"+"#{input}"

	    elsif input == "\n"
	      puts""
	    x = x + 1
	    end

	    
	  end
	  return word.to_f
	end

	def read_pass(word,x)  
	  while (x < 1)

	    input = STDIN.getc.chr

	    if input >= 'a' && input <= 'z' || input >= '0' && input <= '9'
	    printf "#"
	    word = "#{word}"+"#{input}"

	    elsif input == "\b"
	    printf "\b \b" 
	    input = "\b \b"
	    word = "#{word}"+"#{input}"

	    elsif input == "\n"
	      puts""
	    x = x + 1
	    end

	  end
	  return word
	end
	
	def save(word,x,data)

				puts " ingrese su cedula"

                @cedula = read_int(word,x);

                puts " ingrese su nombre"
                @nombre = read_string(word,x);

                puts "ingrese su edad"
                edad = read_int(word,x);

                @data = data
                @data = @data | edad.to_i
                @data = @data << 4

                puts "ingrese su sexo M/F"
                sex = read_string(word,x);

                if sex == "f" 
                 @data = @data | 8
                end

                puts "ingrese su estado civil (casado/soltero)"
                civilState = read_string(word,x);

                if civilState == "soltero"
                  @data = @data | 4
                end

                puts "ingrese su nivel educativo (inicial/medio/grado/postgrado)"
                grade = read_string(word,x);

                if grade == "medio"
                  @data = @data | 1
                elsif grade == "grado"
                  @data = @data | 2
                elsif grade == "postgrado"
                  @data = @data | 3
                end

                puts " ingrese el monto de sus ahorros"
                @ahorros = read_dec(word,x);

                if @data.to_i & 1 == 1 
                @nivel = "medio"
                elsif @data.to_i & 2 == 2
                @nivel = "grado"
                elsif @data.to_i  & 3 == 3
                @nivel = "postgrado"
                elsif @data.to_i  & 3 == 0 
                @nivel = "inicial"
                end

                if @data.to_i & 4 == 4 
                @civilState = "soltero"
                elsif @data.to_i & 4 == 0
                @civilState = "casado" 
                end

                if @data.to_i & 8 == 8
                @sex = "femenino"
                elsif @data.to_i & 8 == 0
                @sex = "masculino" 
                end

                @edad = @data >> 4    

                puts " escriba su contraseña"
				@pass = read_pass(word,x)

				puts " confirme su contraseña"
				@confirm = read_pass(word,x);

                
	end

	attr_reader :cedula, :nombre, :edad, :ahorros, :nivel, :sex, :civilState, :data, :pass, :confirm

end


