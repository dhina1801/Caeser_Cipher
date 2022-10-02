def caeser_cipher(text, key)
    alph = ("a".."z").to_a
    cap_alph = ("A".."Z").to_a
    converted_text = text.split("").map { |ch|
    if alph.include?(ch)
        alph.find_index(ch) + 1
    elsif cap_alph.include?(ch)
        cap_alph.find_index(ch).to_f + 1
    else
        ch
    end
    }
    converted_text.map! { |num|
        if (num.kind_of? Integer) || (num.kind_of? Float)
            num + key
        else
            num
        end
    }
    converted_text.map! { |num|
        if num.to_i > 26
            num - 26
        else
            num
        end
    }
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

puts "Enter the word to be converted to Caeser's code"
word = gets.chomp
puts "Enter the shift factor"
key = gets.chomp.to_i

caeser_cipher(word, key)
        