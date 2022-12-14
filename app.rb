def caeser_cipher(text, key)
    alph = ("a".."z").to_a
    cap_alph = ("A".."Z").to_a
    # to convert into array
    converted_text = text.split("").map { |ch|
        #for lowercase letters 
    if alph.include?(ch)
        alph.find_index(ch) + 1
        #for uppercase letters
    elsif cap_alph.include?(ch)
        cap_alph.find_index(ch).to_f + 1 #coverted to float to differentiate uppercase and lowercase
    else #for numbers and punctuation 
        ch
    end
    }
    converted_text.map! { |num|
        if (num.kind_of? Integer) || (num.kind_of? Float)
            (num + key) % 26
        else
            num
        end
    }

    #for final conversion to caeser's code as an array then converted to string using "puts"
    converted_text.map! { |num|
        if num.kind_of? Integer
            alph[num - 1]
        elsif num.kind_of? Float
            cap_alph[num.to_i - 1]
        else
            num
        end
    }
    puts "Your Caeser's code of \"#{text}\" is \"#{converted_text.join("")}\""
end
# prompt user for entering the data
puts "Enter the word to be converted to Caeser's code"
word = gets.chomp
puts "Enter the shift factor"
key = gets.chomp.to_i

caeser_cipher(word, key)     