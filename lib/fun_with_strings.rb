module FunWithStrings
  def palindrome?
    clean = self.downcase.gsub(/[^a-z]/,'')
    return clean == clean.reverse
  end
  def count_words
    clean = self.downcase
    clean_array = clean.split(' ')
    count = Hash.new(0)
    clean_array.each { |n|
      n = n.downcase.gsub(/(?=\S)(\W|\d)/, "")
      count[n] += 1 unless n.length == 0
      
    }
    return count
  end
  def anagram_groups
    clean = self.downcase
    words = clean.split(' ')
    compare_array = []
    return_array = Hash.new
 
    newWord = ""
    words.each { |word|
      temp_array = word.downcase.scan /\w/
      temp_array.sort!
   
      temp_array.each { |k|
        newWord += k
      }
      compare_array.push([newWord, word])
      newWord = ""
    }
 
   for i in 0..compare_array.length-1 do
     anArray = []
     compareWord = compare_array[i][0]
     for j in 0..compare_array.length-1 do
       if compareWord == compare_array[j][0]
         anArray.push(compare_array[j][1])
       end
    
     end
     return_array[anArray] = i
   end
 
   return_array.keys
    
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
