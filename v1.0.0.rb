input = ARGV.first;
require 'csv'
require 'io/console'
require_relative 'clases.rb'

STDIN.echo = false

i = 0;
a = 0;
b = 0;
header = 0;
word = ""
x = 0
data = 0;

ask = Read.new()

while(1)

    puts "seleccione una opcion"

    puts "[1] añadir"
    puts "[2] buscar"
    puts "[3] editar"
    puts "[4] eliminar"
    puts "[5] finalizar"
    puts""

    make = ask.read_int("",0);

  case make.to_i

  when 1 #añadir

                ask.save("",0,0)
                cedula = ask.cedula
                nombre = ask.nombre
                edad = ask.edad
                sex = ask.sex
                civilState = ask.civilState
                grade = ask.nivel
                ahorros = ask.ahorros
                data = ask.data
                pass = ask.pass
                confirm = ask.confirm
                              

                    if File.exist?(input)
                      if pass == confirm && pass != ""

                          CSV.open(input, 'a+') do |csv|
                          csv << [cedula,nombre,edad,ahorros,grade,sex,civilState,data,pass,confirm];
                          end
                        else
                          i = i + 1
                      end
                    
                    else
                      if pass == confirm && pass != ""
                          CSV.open(input, 'a+') do |csv|
                          csv << ['cedula','nombre','edad','ahorros','grado','sexo','estadoCivil','data','contraseña','confirmacion']
                          csv << [cedula,nombre,edad,ahorros,grade,sex,civilState,data,pass,confirm];
                          end
                        else
                          i = i + 1   
                      end
                    end

                          data = 0
                          table = CSV.parse(File.read(input), headers: true);
                          puts""
                          puts table;
                    puts ""

  when 2 #buscar

    table = CSV.parse(File.read(input), headers: true)

    puts table
    puts""

    puts "introduzca el numero de cedula que desea buscar ";
    busqueda = ask.read_int(word,x);
    puts ""

    table.each do |n|

    	if table[a]['cedula'] == busqueda
    		puts table[a]
    	end

    	a = a + 1
    end
    	a = 0

  when 3 #editar

    puts "introduzca el numero de cedula que desea editar ";
    busqueda = ask.read_int(word,x);
    puts ""
    table = CSV.parse(File.read(input), headers: true)

    table.each do |n|

    	if table[a]['cedula'] == busqueda

    			copy = CSV.parse(File.read(input), headers: true)
    			File.delete(input)
    			CSV.open(input, 'a+') do |csv|
    			csv << ['cedula','nombre','edad','ahorros','grado','sexo','estadoCivil','data','contraseña','confirmacion']

    			copy.each do |m|
    				
    				if copy[b]['cedula'] == busqueda 

                    puts""
                    ask.save("",0,0)
                    puts""
                cedula = ask.cedula
                nombre = ask.nombre
                edad = ask.edad
                sex = ask.sex
                civilState = ask.civilState
                grade = ask.nivel
                ahorros = ask.ahorros
                data = ask.data
                pass = ask.pass
                confirm = ask.confirm

    					CSV.open(input, 'a+')
    					csv << [cedula,nombre,edad,ahorros,grade,sex,civilState,data,pass,confirm];
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
    puts""

    delete = CSV.parse(File.read(input), headers: true);
    puts delete

  when 4 #borrar

    puts "introduzca el numero de cedula que desea eliminar ";
    busqueda = ask.read_int(word,x);
    puts ""
    delete = CSV.parse(File.read(input), headers: true);

    delete.each do |n|

        if delete[a]['cedula'] == busqueda

                copy = CSV.parse(File.read(input), headers: true);
                File.delete(input)
                CSV.open(input, 'a+') do |csv|
                csv << ['cedula','nombre','edad','ahorros','grado','sexo','estadoCivil','data','contraseña','confirmacion']

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

  when 5 #cerrar

    break

  end

end