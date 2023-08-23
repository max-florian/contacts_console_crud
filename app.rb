require "csv"

contacts = []

option = 0
option2 = 0

while !(option == 6) 
    puts "-----------------------------------------------------"
    puts "CRUD Menu"
    puts "1 - Create contact"
    puts "2 - Read contact(s)"
    puts "3 - Update contact"
    puts "4 - Delete contact"
    puts "5 - Generate contacts report"
    puts "Input a number between 1 to 5 or 6 to leave"
    option = gets.chomp.to_i

    case option
    when 1
        puts "-----------------------------------------------------"
        puts "Add first name"
        option1name = gets.chomp
        puts "Add last name"
        option1lastname = gets.chomp
        puts "Add e-mail"
        option1email = gets.chomp
        puts "Add telephone"
        option1telephone = gets.chomp.to_i

        contact_hash = { "first_name" => option1name, "last_name" => option1lastname, "e-mail" => option1email, "telephone" => option1telephone }
        contacts.push(contact_hash);
        
    when 2
        puts "-----------------------------------------------------"
        puts "1 - Get contact by e-mail"
        puts "2 - Get all the contacts"
        puts "6 - Leave"
        option2 = gets.chomp.to_i
        if option2 == 1
            puts "-----------------------------------------------------"
            puts "Input contact e-mail"
            option21 = gets.chomp
            contact2 = contacts.select {|contact| contact["e-mail"] == option21}
            puts "Contact:"
            contact2.each do |key, value|
                puts (key.to_s + ': ' + value.to_s)
            end
        elsif option2 == 2
            contacts.each_with_index do |contact,i|
                puts "----------------------------------"
                puts "Contact # #{i}"
                contact.each do |key, value|
                    puts (key.to_s + ': ' + value.to_s)
                end
            end
        else
            break
        end
    when 3
        puts "-----------------------------------------------------"
        puts "Input the contact's e-mail you want to update"
        option3 = gets.chomp
        contacts.each do |contact|
            if contact["e-mail"] == option3
                
                puts "What element would you like to update?"
                puts "1 - First name"
                puts "2 - Last name"
                puts "3 - E-mail"
                puts "4 - Telephone"

                case option32
                when 1
                    puts "Insert new first name (old one is: #{contact["first_name"]})"
                    option33 = gets.chomp
                    contact["first_name"] = option33
                when 2
                    puts "Insert new last name (old one is: #{contact["last_name"]})"
                    option33 = gets.chomp
                    contact["last_name"] = option33
                when 3
                    puts "Insert new e-mail (old one is: #{contact["e-mail"]})"
                    option33 = gets.chomp
                    contact["e-mail"] = option33
                when 4
                    puts "Insert new telephone (old one is: #{contact["telephone"]})"
                    option33 = gets.chomp.to_i
                    contact["telephone"] = option33
                else
                    puts "That wasn't a valid option"
                    break
                end

                break
            end
        end

    when 4
        puts "-----------------------------------------------------"
        puts "Input the contact's e-mail you want to delete"
        option4 = gets.chomp
        contacts.each_with_index do |contact,i|cle
            if contact["e-mail"] == option4
                #contacts.delete(i)
                puts "User deleted:\n #{contacts.delete_at(i)}"
                break
            end
        end
    when 5
        puts "-----------------------------------------------------"
        puts "Se generó reporte"
        file = "contacts.csv"
        CSV.open( file, 'w' ) do |writer|
            contacts.each_with_index do |c,i|
                writer << [i,c["first_name"], c["last_name"], c["e-mail"], c["telephone"]]
            end
        end
    when 6
        break
    else
        puts "-----------------------------------------------------"
        puts "Input a valid option"
    end
end