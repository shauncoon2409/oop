#! /usr/local/rvm/rubies/ruby-2.1.1/bin/ruby
###str="ABAC ADBABACEB FBG"
$str="BT JPX RMLX PCUV AMLX ICVJP IBTWXVR CI M LMTR PMTN, MTN YVCJX CDXV MWMBTRJ JPX AMTNGXRJBAH UQCT JPX QGMRJXV CI JPX YMGG CI JPX HBTWR QMGMAX; MTN JPX HBTW RMY JPX QMVJ CI JPX PMTN JPMJ YVCJX. JPXT JPX HBTWR ACUTJXTMTAX YMR APMTWXN, MTN PBR JPCUWPJR JVCUFGXN PBL, RC JPMJ JPX SCBTJR CI PBR GCBTR YXVX GCCRXN, MTN PBR HTXXR RLCJX CTX MWMBTRJ MTCJPXV. JPX HBTW AVBXN MGCUN JC FVBTW BT JPX MRJVCGCWXVR, JPX APMGNXMTR, MTN JPX RCCJPRMEXVR. MTN JPX HBTW RQMHX, MTN RMBN JC JPX YBRX LXT CI FMFEGCT, YPCRCXDXV RPMGG VXMN JPBR YVBJBTW, MTN RPCY LX JPX BTJXVQVXJMJBCT JPXVXCI, RPMGG FX AGCJPXN YBJP RAM"

puts "Original string is #{$str}"

array = Array.new
joined = Array.new

###array = @@str.split(//)
###array.each_with_index { | item, index |
###  first_char = array[index] 
######  last_char = array[index+1]
###  #if /(?<=\b)[A-Z](?=\b)/.match first_char
###  #if /(?<=J)[A-Z](?=X)/.match first_char
###  #if /(?<=J)[A-Z](?=X)/.match @str
###  if /B/.match @@str
###	unless $1.nil?
### 	   p $1
###       	   joined << $1
### 	end
###    ## if last_char =~ /[[:upper:]]/
###    ## end
###  end  

$one_char_array=Array.new
#p $one_char_array.class


#p $one_char_array.empty?
#if $one_char_array.empty? == true
#   p "one_char_array is still empty"
#end

###class NumSingleLetters
###	def num_single_letters(twoChar)
###  		twoChar = yield
###		p twoChar
###        #def initialize(number_of_two_letter_items)
###	#    @twoChar=number_of_two_letter_items
###        end
######	
######	@twochar=$twochar    
###	#p yay
###	#p @twochar.class
###	#puts "twoChar is " + @twoChar
######
######        #how many single letters?
######	@one_char_array=$one_char_array
######      	p "Yay!"
######	# p "one_char_array_char.count " + @one_char_array.count.to_s
######	p "dollarsign one_char_array is " + @one_char_array[0].to_s
######	p "one_char_array is " + $one_char_array[0].to_s
######	p @one_char_array.class.to_s + " one_char_array.class"
######        if self.array_char.count == 0
######          p "Alas, no single characters found"
######        elsif array_char.count == 1
######          p "There was one single character word found"
######          one_letter = "A"
######          @one_letter = one_letter
######	  p @one_letter + " one_letter"
######        #   "then later on, if A doesnt pan out":
######        #   @two_letter = "I"
######        #elsif array_char.count == 2
######        #   p "there were two single character word found"
######        #   first A 
######        #   then I and A
######        end
####    end	
###end

class String
        def num_single_letters
  	    twoChar = yield
	    p yield
            #def initialize(number_of_two_letter_items)
	    #    @twoChar=number_of_two_letter_items
        end
end

#p String.methods

class ArrayOfCharacters < Array

    #attr_accessor :twoChar

    def initialize(string)    
	@string=string
    end

    def num_single_letters(twoChar)
        #twoChar = yield
 	p twoChar 
	#p "Yay"
        #def initialize(number_of_two_letter_items)
	#    @twoChar=number_of_two_letter_items
    end

    def initialize(number_of_characters)
	@numchar=number_of_characters
    end
    def array_char()
	#def initialize(twoChar)
	#    twoChar = yield
	#    p twoChar
	#end    
	#p "array_char!"
        def initialize(number_of_letters)
	    @numletters=number_of_letters
        end
        def num_double_letters()
        #how many double letters?
        # we'll be putting the single letters in the 
        # double-letter checks, so this needs to come
        # logically 'after' the single letter check:
	  #p "num_double_letters!"
          def initialize(number_of_letters)
	    @numletters=number_of_letters
          end
###          if $one_char_array.empty? == true
###            def num_single_letters()
###            #how many single letters?
###	      @one_char_array=$one_char_array
###	      p "Yay!"
###	      # p "one_char_array_char.count " + @one_char_array.count.to_s
###	      p "dollarsign one_char_array is " + @one_char_array[0].to_s
###	      p "one_char_array is " + $one_char_array[0].to_s
###	      p @one_char_array.class.to_s + " one_char_array.class"
###              if self.array_char.count == 0
###                  p "Alas, no single characters found"
###              elsif array_char.count == 1
###                  p "There was one single character word found"
###                  one_letter = "A"
###                  @one_letter = one_letter
###	    	  p @one_letter + " one_letter"
###              #    #    "then later on, if A doesnt pan out":
###              #    #   @two_letter = "I"
###              #elsif array_char.count == 2
###              #    p "there were two single character word found"
###              #    #first A and I,
###              #    #then I and A
###              end
###	    end  
###          end
          @string=$str
          @string.scan(%r{(?<![A-Z])[A-Z]{1}(?![A-Z])})
        end
        @string=$str
        @string.scan(%r{(?<![A-Z])[A-Z]{#{@numchar}}(?![A-Z])})

    end   
end

array_one_char = ArrayOfCharacters.new("1")
array_two_char = ArrayOfCharacters.new("2")
array_three_char = ArrayOfCharacters.new("3")


    @array_new = array_two_char.array_char
    @array_new.each { |i| array_two_char.num_single_letters i }

    p array_one_char.class
    p array_two_char.class

#p "array_one_char is an  #{array_one_char.array_char.class}"
#puts "array_one_char[0] is #{array_one_char.array_char[0]}"
#puts "array_two_char[1] is #{array_two_char.array_char[1]}"
#puts "array_three_char[2] is #{array_three_char.array_char[2]}"

#p array_three_char.array_char.count 
#p array_one_char.count 
#p array_two_char.count 

#p NumSingleLetters.variables

trace = TracePoint.new(:raise) do |t|
  p t.inspect
end	  

trace.enable


p "Time to run num_single_letters:"
#num_single_letters.each do |twoChar|
#array_two_char.array_char.each do |twoChar|
#	num_single_letters(twoChar)
#
#end	


p "Array_two_char.class is a " + array_two_char.class.to_s
#p "ArrayOfChactnum_single_letters.class is a " + num_single_letters.class.to_s
#array_two_char.array_char.map(&array_two_char.method(:num_single_letters))


p "Break"
#array_one_char.array_char.num_single_letters    
#array_two_char.array_char    
#array_two_char.num_double_letters    
#array_two_char.num_single_letters    
#array_two_char.num_single_letters
