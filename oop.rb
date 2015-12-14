#! /usr/local/rvm/rubies/ruby-2.1.1/bin/ruby
###str="ABAC ADBABACEB FBG"
## the dollar sign makes $string a 'global', since 
## it's the sole beginnging piece of date to work with:
$str="BT JPX RMLX PCUV AMLX ICVJP IBTWXVR CI M LMTR PMTN, MTN YVCJX CDXV MWMBTRJ JPX AMTNGXRJBAH UQCT JPX QGMRJXV CI JPX YMGG CI JPX HBTWR QMGMAX; MTN JPX HBTW RMY JPX QMVJ CI JPX PMTN JPMJ YVCJX. JPXT JPX HBTWR ACUTJXTMTAX YMR APMTWXN, MTN PBR JPCUWPJR JVCUFGXN PBL, RC JPMJ JPX SCBTJR CI PBR GCBTR YXVX GCCRXN, MTN PBR HTXXR RLCJX CTX MWMBTRJ MTCJPXV. JPX HBTW AVBXN MGCUN JC FVBTW BT JPX MRJVCGCWXVR, JPX APMGNXMTR, MTN JPX RCCJPRMEXVR. MTN JPX HBTW RQMHX, MTN RMBN JC JPX YBRX LXT CI FMFEGCT, YPCRCXDXV RPMGG VXMN JPBR YVBJBTW, MTN RPCY LX JPX BTJXVQVXJMJBCT JPXVXCI, RPMGG FX AGCJPXN YBJP RAM"

puts "Original string is #{$str}"


# A few incrementing globals, in a
# trick I learned back in my Perl days
$a=0
$b=0
$finalTwoLetterArray=Array.new

## this was an early attempt at string parsing in Ruby
## What it was intended to do is to brek up a string by individual letters,
## and/or by two-letter-long segments. This is before I discovered the 'scan'
## method later on. (As well as global assignment to an instance variable)
##
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

# I expect to use this array later, but will
# need it to be altered each time methods are run.
# As a result, I'll keep it as a global array,
# and assign instance varibales to it:
$one_char_array=Array.new


# this is the main object of the program; it 
# inherits its attributes from 'Array':
class ArrayOfCharacters < Array
    # we'll use @string' later, here we merely initialize it:
    def initialize(string)    
	@string=string
    end

    # Originally, I thought of making a nested method for this
    # method, but i couldn't get it to properly process the data
    #
    # Next step was to make a separate class for it, but then I ran
    # into an object-oriented brick wall, and couldn't get the 
    # method I'd put into a second class to manipulate data which
    # was an instance of the first class (and, which had alreay been
    # manipulated by that original class - e.g, array_one_char.array_char
    # (I tried modules, etc, learned a chunk, but mainly learned 
    # that it wasn't what I'd been looking for)
    # 
    # Finally got around to getting it working by simply adding these 
    # methods to the main class (ArrayofCharacters), thus allowing a 
    # pre-manipulated object to be further manipulated by a method in 
    # the same class:
    #
    def num_single_letters(twoChar)
    	@twoCharArrayNew = $twoCharArrayNew
	@one_char_array = $array_one_char_processed
	@two_char_array = $array_two_char_processed
	if @one_char_array.count == 0
	    #p "Well, there was nothing here"
	elsif @one_char_array.count == 1
	    @one_char=@one_char_array[0]
	    # Here we're seeing if the (at this point sole) single character
	    # in @one_char resides in any of the two_letter words, and we're
	    # placing the results into a local instance array which is drawn 
	    # from an empty global array:
	    	twoChar.sub!("#{@one_char}", "a")
		# *************************************************
		# Insert logic here to note if any of the letters 
		# were found in the two_letter words. If so, run 
		# another subroutine for real substitution.
		# Otherwise, onto the two letter word matching.
		# *************************************************
		#puts twoChar
		@twoCharArrayNew.push(twoChar)
	    #end
	elsif @one_char_array.count == 2
	    #p "This string contains both one-character words"
	end
	#p "twoCharArrayNew is made up of " + @twoCharArrayNew.count.to_s + " items."
    end

    # here we initialize the 'number_of_characters' 
    # method, which is used as the main variable for new ArrayOfCharacters 
    # instances:
    def initialize(number_of_characters)
	@numchar=number_of_characters
    end

    def num_double_letters(twoChar)
	@b=0    
	#p "#{$b += 1 }"
	#@twoCharArrayMid = $twoCharArrayNew
	p twoChar
	@arrayCommonTwoLetterWords = [ "of", "to", "in", "it", "is", "be", "as", "at", "so", "we", "he", "by", "or", "on", "do", "if", "me", "my", "up", "an", "go", "no", "us", "am" ]
	#p @arrayCommonTwoLetterWords[$b]
	@arrayCommonTwoLetterWords.each do |i|
	    @tempString=$str
	    
	    # first build the pair of 
	    # letters to be substituted:
	    arrayOfCommonTwoLetters=i.split(//)
	    #p arrayOfCommonTwoLetters[0]
	    #p arrayOfCommonTwoLetters[1]

	    # then the pair of 'source' letters
	    @tempTwoChar=twoChar.split(//)
	    #p @tempTwoChar[0]
	    #p @tempTwoChar[1]

	    @firstTempString=@tempString.gsub("#{@tempTwoChar[0]}","#{arrayOfCommonTwoLetters[0]}")
	    @secondTempString=@firstTempString.gsub("#{@tempTwoChar[1]}","#{arrayOfCommonTwoLetters[1]}")

	    #puts @secondTempString
	    $finalTwoLetterArray = $finalTwoLetterArray.push(*@secondTempString)
	    @b += 1
	end    
	#gets
    end

    def num_triple_letters(threeChar)
	# As usual, begin by assigning a variable
	# to be incremented:
	@c=0
	p threeChar


    end	

    # array_char is the 'main' method used in this class
    # It's meant to split the string into individual words
    # (possibly individual, arbitrary sets of characters
    # at some point in the future):
    def array_char()
	# this is the regex which splits the string based on the 
        # number of characters that's being requested in #{@numchar}} 
        # (note the fiddling requred to make the regex work inside 
        # a string:)
        @string=$str
        @string.scan(%r{(?<![A-Z])[A-Z]{#{@numchar}}(?![A-Z])})

    end   
end


# Simple creation of objects, each with an
# @numchar option at the end to describe how 
# big the 'words' should be
array_one_char = ArrayOfCharacters.new("1")
array_two_char = ArrayOfCharacters.new("2")
array_three_char = ArrayOfCharacters.new("3")

# Remember, you need to run this so that the 
# temporary array gets the manipulated version of
# the object. Also, from what I can tell, the
# temporary array needs to be a global variable,
# due to the  'minimum depth' of the assignment
# operation:
#
$array_one_char_processed = array_one_char.array_char
$array_two_char_processed = array_two_char.array_char
$array_three_char_processed = array_three_char.array_char

#p $array_one_char.class
#p $array_one_char[0]


$twoCharArrayNew = Array.new

# In general, I find it's just easier to make a
# new array from a manipulated object, than to 
# manupulate a long dotted string-name
@arrayTwoCharMid = array_two_char.array_char
p "Time to run num_single_letters:"

# This works because:
# a) the 'each' block is run against the array name @array_new, 
# which is essentially the mnaiipulated ArrayOfCharacters instance,
# array_two_char, and 
# b) there's no need for 'yield' here; the block
# parameter 'i' gets shipped directly to the num_single_letters
# method, applied (directly to the the unmanipulated) 
# array_two_char:
#
@arrayTwoCharMid.each { |i| array_two_char.num_single_letters i }

# this is only a temporary going-forward option until
# I thoroughly work out the logic. i.e, this won't capture 
# any substitutions in regards to single character letters yet:
@arrayTwoCharMid.uniq.each { |j| array_two_char.num_double_letters j }



# BTW, we're uing 'uniq' here because we don't care about
# several identical versions of each translation
@arrayThreeCharMid = array_three_char.array_char
@arrayThreeCharMid.uniq.each { |k| array_three_char.num_triple_letters k }

 

#p array_one_char.class
#p array_two_char.class

#p "array_one_char is an  #{array_one_char.array_char.class}"
#puts "array_one_char[0] is #{array_one_char.array_char[0]}"
#puts "array_one_char[1] is #{array_one_char.array_char[1]}"
#puts "array_two_char[1] is #{array_two_char.array_char[1]}"
#puts "array_three_char[2] is #{array_three_char.array_char[2]}"

#p array_three_char.array_char.count 
#p array_one_char.count 
#p array_two_char.count 




# Tried TracePoint at one point, didn't find it helped all that much
#trace = TracePoint.new(:raise) do |t|
#  p t.inspect
#end	  
#trace.enable


#p "Array_two_char.class is a " + array_two_char.class.to_s


#p "Break"
#array_one_char.array_char.num_single_letters    
#array_two_char.array_char    
#array_two_char.nlTwoLetterArrayum_double_letters    
#array_two_char.num_single_letters    
#array_two_char.num_single_letters
