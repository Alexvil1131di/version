require 'csv'
require 'io/console'
require_relative 'clases.rb'


input = ARGV.first;
i = 0;
a = 0;
b = 0;
header = 0;
make = 0;


user = Read.new()

if File.exist?(input)

    table = CSV.parse(File.read(input), headers: true)

  end

while(1)

inf = 0
sup = table.length

      for i in 0..table.length
        for j in 0..table.length-2
          if table[j]['cedula'] > table[j+1]['cedula']
            aux = table[j]
            table[j] = table[j+1]
            table[j+1] = aux
          end
        end
      end

      if File.exist?(input)

        puts ""
        puts "tabla de usuarios"
        puts table
        puts ""

      end

    puts "seleccione una opcion"

    puts "[1] añadir"
    puts "[2] buscar"
    puts "[3] editar"
    puts "[4] eliminar"
    puts "[5] finalizar"
    puts""

    make = user.read_int("",0);


  case make.to_i

    when 1 #añadir

        user.save("",0,0)
        cedula = user.cedula
        nombre = user.nombre
        edad = user.edad
        sex = user.sex
        civilState = user.civilState
        nivel = user.nivel
        ahorros = user.ahorros
        data = user.data
        pass = user.pass
        confirm = user.confirm

        if File.exist?(input)
          if pass == confirm && pass != ""
              CSV.open(input, 'a+') do |csv|
              csv << [cedula,nombre,edad,ahorros,nivel,sex,civilState,pass,confirm,data]
              end
              i = i + 1   
            else
              puts "contraseña incorrecta"
              i = i + 1
          end
        
        else
          if pass == confirm && pass != ""
              CSV.open(input, 'a+') do |csv|
              csv << ['cedula','nombre','edad','ahorros','nivel','sexo','civilState','contraseña','Confirmacion','data']
              csv << [cedula,nombre,edad,ahorros,nivel,sex,civilState,pass,confirm,data]
              end
                
                 


            else
              puts "contraseña incorrecta"
               
          end
        end
          if File.exist?(input)

              table = CSV.parse(File.read(input), headers: true)

            end
                  
    when 2 #Buscar


      save = Array.new(5) {Array.new()}

      for i in 0..table.length-1
        place = table[i].hash % 5
        save[place].push(table[i])
        puts "#{table[i]}///#{place}"
        puts""
      end  

      for j in 0..table.length-1
        for i in 0..table.length-1
          print "#{save[j][i]}[#{j}][#{i}]\n"
          puts ""
        end
      end

      puts "introduzca el numero de cedula que desea buscar ";
      busqueda = user.read_int("",0);
      puts ""


      while (inf < sup) #busqueda binaria
        mitad = (inf +sup)/2

        if table[mitad]['cedula'] == busqueda
          print "cedula,nombre,edad,ahorros,nivel,sexo,civilState,contraseña,Confirmacion,data\n"
          print table[mitad]
          break
        end

        if table[mitad]['cedula'] > busqueda
          sup = mitad
          mitad = (inf +sup)/2
        end

        if table[mitad]['cedula'] < busqueda
          inf = mitad
          mitad = (inf +sup)/2
        end


      end
    
    when 3 #Editar

      puts "introduzca el numero de cedula que desea editar ";
      busqueda = user.read_int("",0);
      puts ""

        while (inf < sup) #busqueda binaria
           mitad = (inf +sup)/2

          if table[mitad]['cedula'] == busqueda

                  user.save("",0,0)
                  cedula = user.cedula
                  nombre = user.nombre
                  edad = user.edad
                  sex = user.sex
                  civilState = user.civilState
                  nivel = user.nivel
                  ahorros = user.ahorros
                  data = user.data
                  pass = user.pass
                  confirm = user.confirm        

                  table[mitad] = cedula,nombre,edad,ahorros,nivel,sex,civilState,pass,confirm,data
            break
          end

          if table[mitad]['cedula'] > busqueda
            sup = mitad
            mitad = (inf +sup)/2
          end

          if table[mitad]['cedula'] < busqueda
            inf = mitad
            mitad = (inf +sup)/2
          end
        end
     
     puts table

     puts ""
   
    when 4 #eliminar

      puts "introduzca el numero de cedula que desea eliminar ";
      busqueda = user.read_int("",0);
      puts ""

          while (inf < sup) #busqueda binaria
           mitad = (inf +sup)/2

          if table[mitad]['cedula'] == busqueda

                  del = table
                  File.chmod(0777, input)
                  File.delete(input);
                  CSV.open(input, 'a+') do |csv|
                  csv << ['cedula','nombre','edad','ahorros','nivel','sexo','civilState','contraseña','Confirmacion','data']

                      del.each do |m|
                          
                          if del[b]['cedula'] == busqueda 

                              b = b + 1;
                          
                          else 
                              CSV.open(input, 'a+')
                              csv << del[b]
                              b = b + 1;  
                          end
                      end
                  end

            table = CSV.parse(File.read(input), headers: true)
   

            break
          end

          if table[mitad]['cedula'] > busqueda
            sup = mitad
            mitad = (inf +sup)/2
          end

          if table[mitad]['cedula'] < busqueda
            inf = mitad
            mitad = (inf +sup)/2
          end
        end

        table = CSV.parse(File.read(input), headers: true)
   
    when 5 #salir

      break;

  end

end