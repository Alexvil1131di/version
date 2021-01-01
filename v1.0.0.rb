input = ARGV.first;
require 'csv'
require 'io/console'

STDIN.echo = false

i = 0;
a = 0;
b = 0;
header = 0;
word = ""
x = 0
data = 0;

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
  return word.chomp
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


while i < 1 do
  puts " ingrese su cedula"
  cedula = read_int(word,x);

  puts " ingrese su nombre"
  nombre = read_string(word,x);

  puts "ingrese su edad"
  edad = read_int(word,x);

  data = data | edad.to_i
  data = data << 4

  puts "ingrese su sexo m/f"
  sex = read_string(word,x);

  if sex == "f" 
   data = data | 8
  end

  puts "ingrese su estado civil (casado/soltero)"
  civilState = read_string(word,x);

  if civilState == "soltero"
    data = data | 4
  end

  puts "ingrese su nivel educativo (inicial/medio/grado/postgrado)"
  grade = read_string(word,x);

  if grade == "medio"
    data = data | 1
  elsif grade == "grado"
    data = data | 2
  elsif grade == "postgrado"
    data = data | 3
  end

  puts " ingrese el monto de sus ahorros"
  ahorros = read_dec(word,x);

  puts " escriba su contraseña"
  pass = read_pass(word,x)

  puts " confirme su contraseña"
  confirm = read_pass(word,x);

  if data.to_i & 1 == 1 
  nivel = "medio"
  elsif data.to_i & 2 == 2
  nivel = "grado"
  elsif data.to_i  & 3 == 3
  nivel = "postgrado"
  elsif data.to_i  & 3 == 0 
  nivel = "inicial"
  end

  if data.to_i & 4 == 4 
  civilState = "soltero"
  elsif data.to_i & 4 == 0
  civilState = "casado" 
  end

  if data.to_i & 8 == 8
  sex = "femenino"
  elsif data.to_i & 8 == 0
  sex = "masculino" 
  end

  edad = data >> 4
                  

	if File.exist?(input)
		if pass == confirm && pass != ""

				CSV.open(input, 'a+') do |csv|
				csv << [cedula,nombre,edad,ahorros,grade,sex,civilState];
				end
			else
				i = i + 1
		end
	
	else
		if pass == confirm && pass != ""
				CSV.open(input, 'a+') do |csv|
				csv << ['cedula','nombre','edad','ahorros','grado','sexo','estadoCivil']
				csv << [cedula,nombre,edad,ahorros,grade,sex,civilState];
				end
			else
				i = i + 1		
		end
	end
end

#-----v2.00----------------------------------------------------------------------------------------

table = CSV.parse(File.read(input), headers: true)

puts table
puts""

puts "introduzca el numero de cedula que desea buscar ";
busqueda = read_int(word,x);
puts ""

table.each do |n|

	if table[a]['cedula'] == busqueda
		puts table[a]
	end

	a = a + 1
end
	a = 0

#-----v3.0.0---editar---------------------------------------------------------------------------

puts "introduzca el numero de cedula que desea editar ";
busqueda = read_int(word,x);
puts ""
table = CSV.parse(File.read(input), headers: true)

table.each do |n|

	if table[a]['cedula'] == busqueda

			copy = CSV.parse(File.read(input), headers: true)
			File.delete(input)
			CSV.open(input, 'a+') do |csv|
			csv << ['cedula','nombre','edad','ahorros','grado','sexo','estadoCivil']

			copy.each do |m|
				
				if copy[b]['cedula'] == busqueda 

                puts " ingrese su cedula"
                cedula = read_int(word,x);

                puts " ingrese su nombre"
                nombre = read_string(word,x);

                puts " ingrese su edad"
                edad = read_int(word,x)

                data = data | edad.to_i
                data = data << 4

                puts "ingrese su sexo (M/F)"
                sex == read_string(word,x);

                if sex == "F"
                    data | 8
                end

                puts " ingrese el estado civil (casado/soltero)"
                civilState = read_string(word,x);

                if civilState == "soltero"
                    data = data | 4
                end

                puts "ingrese su nivel educativo (inicial/medio/grado/postgrado)"
                grade = read_string(word,x);

                if grade == "medio"
                    data = data | 1
                elsif grade == "grado"
                    data = data | 2
                elsif grade == "postgrado"
                    data = data | 3
                end

                puts " ingrese monto de ahorros"
                ahorros = read_dec(word,x)


                if data.to_i & 1 == 1
                    grade = "medio"
                elsif data.to_i & 2 == 2
                    grade = "grado"
                elsif data.to_i & 3 == 3
                    grade = "postgrado"
                elsif data.to_i & 3 == 0
                    grade = "inicial"
                end

                if data.to_i & 4 == 4
                    civilState = "soltero"
                elsif data.to_i & 4 == 0
                    civilState = "casado"
                end

                 if data.to_i & 8 == 8
                    sex = "Femenino"
                elsif data.to_i & 8 == 0
                    sex = "masculino"
                end
                    
                edad = data >> 4


					CSV.open(input, 'a+')
					csv << [cedula,nombre,edad,ahorros,grade,sex,civilState];
					b = b + 1;
				
				else 
					CSV.open(input, 'a+')
					csv << copy[b]
					b = b + 1;	
				end
			end
	end
	
end
a = a + 1
end

a = 0

delete = CSV.parse(File.read(input), headers: true);
puts delete
#-----v3.0.0----borrar----------------------------------------------------------------

puts "introduzca el numero de cedula que desea eliminar ";
busqueda = read_int(word,x);
puts ""

delete.each do |n|

    if delete[a]['cedula'] == busqueda

            copy = CSV.parse(File.read(input), headers: true);
            File.delete(input)
            CSV.open(input, 'a+') do |csv|
            csv << ['cedula','nombre','edad','ahorros','grado','sexo','estadoCivil']

            copy.each do |m|
                
                if copy[b]['cedula'] == busqueda 

                    b = b + 1;
                
                else 
                    CSV.open(input, 'a+')
                    csv << copy[b]
                    b = b + 1;  
                end
            end
    end
    
end
a = a + 1
end

delete = CSV.parse(File.read(input), headers: true)
puts delete