input = ARGV.first;
require 'csv'

i = 0;
a = 0;
b = 0;
header = 0;

while i < 1 do
	puts " ingrese su cedula"
	cedula = STDIN.gets.chomp;

	puts " ingrese su nombre"
	nombre = STDIN.gets.chomp;

	puts " ingrese su edad"
	edad = STDIN.gets.chomp;

	puts " desea guardar (yes/no)"
	choise = STDIN.gets.chomp;

	if File.exist?(input)
		if choise == "yes"
				CSV.open(input, 'a+') do |csv|
				csv << [cedula,nombre,edad]
				end
			else
				i = i + 1
		end
	
	else
		if choise == "yes"
				CSV.open(input, 'a+') do |csv|
				csv << ['cedula','nombre','edad']
				csv << [cedula,nombre,edad];
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
busqueda = STDIN.gets.chomp;
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
busqueda = STDIN.gets.chomp;
puts ""
table = CSV.parse(File.read(input), headers: true)

table.each do |n|

	if table[a]['cedula'] == busqueda

			copy = CSV.parse(File.read(input), headers: true)
			File.delete(input)
			CSV.open(input, 'a+') do |csv|
			csv << ['cedula','nombre','edad']

			copy.each do |m|
				
				if copy[b]['cedula'] == busqueda 

					puts " ingrese su cedula"
					cedula = STDIN.gets.chomp;

					puts " ingrese su nombre"
					nombre = STDIN.gets.chomp;

					puts " ingrese su edad"
					edad = STDIN.gets.chomp;

					CSV.open(input, 'a+')
					csv << [cedula,nombre,edad];
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

delete = CSV.parse(File.read(input), headers: true)
puts delete
#-----v3.0.0----borrar----------------------------------------------------------------

puts "introduzca el numero de cedula que desea eliminar ";
busqueda = STDIN.gets.chomp;
puts ""

delete.each do |n|

	if delete[a]['cedula'] == busqueda

			copy = CSV.parse(File.read(input), headers: true)
			File.delete(input)
			CSV.open(input, 'a+') do |csv|
			csv << ['cedula','nombre','edad']

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