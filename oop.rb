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
    def num_single_letters(oneChar)
        @a=0
        #p "#{$a += 1 }"
        #@oneCharArrayMid = $oneCharArrayNew
        p oneChar
        #@arrayCommonOneLetterWords = [ "a", "i" ]
        @arrayCommonOneLetterWords = [ "a" ]
        #p @arrayCommonOneLetterWords[$a]
        @arrayCommonOneLetterWords.each do |h|
            @sourceString=$str

            # first build the pair of 
            # letters to be substituted:
            arrayOfCommonOneLetters=h.split(//)
            #p arrayOfCommonOneLetters[0]
            #p arrayOfCommonOneLetters[1]

            # then the 'source' letter
            @sourceOneChar=oneChar.split(//)
            #p @sourceOneChar[0]
            #p @sourceOneChar[1]

            @firstTempString=@sourceString.gsub("#{@sourceOneChar[0]}","#{arrayOfCommonOneLetters[0]}")


            puts @firstTempString
            $finalOneLetterArray = $finalOneLetterArray.push(*@firstTempString)
            $finalOneSourceChar = $finalOneSourceChar.push(*@sourceOneChar)
            @a += 1
        end
        #gets
    end


    def num_double_letters(twoChar)
	@b=0    
	#p "#{$b += 1 }"
	#@twoCharArrayMid = $twoCharArrayNew
	p twoChar
	#@arrayCommonTwoLetterWords = [ "of", "to", "in", "it", "is", "be", "as", "at", "so", "we", "he", "by", "or", "on", "do", "if", "me", "my", "up", "an", "go", "no", "us", "am" ]
	@arrayCommonTwoLetterWords = [ "of" ]
	#p @arrayCommonTwoLetterWords[$b]
	@arrayCommonTwoLetterWords.each do |i|
	    @sourceString=$str
	    
	    # first build the pair of 
	    # letters to be substituted:
	    arrayOfCommonTwoLetters=i.split(//)
	    #p arrayOfCommonTwoLetters[0]
	    #p arrayOfCommonTwoLetters[1]

	    # then the pair of 'source' letters
	    @sourceTwoChar=twoChar.split(//)
	    #p @sourceTwoChar[0]
	    #p @sourceTwoChar[1]


	    @firstTempString=@sourceString.gsub("#{@sourceTwoChar[0]}","#{arrayOfCommonTwoLetters[0]}")
	    @secondTempString=@firstTempString.gsub("#{@sourceTwoChar[1]}","#{arrayOfCommonTwoLetters[1]}")

	    puts @secondTempString
	    $finalTwoLetterArray = $finalTwoLetterArray.push(*@secondTempString)
            $finalTwoChar = $finalTwoChar.push(*@sourceTwoChar)
	    @b += 1
	end    
	#gets
    end

    def num_triple_letters(threeChar)
        # As usual, begin by assigning a variable
        # to be incremented:
        @c=0

	def initialize(arrayOfCmnThreeLetterWordsApproved)    
	  @arrayOfCmnThreeLetterWordsApproved=arrayOfCmnThreeLetterWordsApproved 
    	end


        #@threeCharArrayMid = $threeCharArrayNew
        p threeChar
        #@arrayCommonThreeLetterWords = [ "the", "and", "for", "are", "but", "not", "you", "all", "any", "can", "had", "her", "was", "one", "our", "out", "day", "get", "has", "him", "his", "how", "man", "new", "now", "old", "see", "two", "way", "who", "boy", "did", "its", "let", "put", "say", "she", "too", "use" ]        
        @arrayCommonThreeLetterWords = [ "and" ]        
        #p @arrayCommonThreeLetterWords[$c]
        @arrayCommonThreeLetterWords.each do |j|
            @sourceString=$str

            # first build the array of 
            # letters to be substituted:
            arrayOfCommonThreeLetters=j.split(//)
	    
	    #p arrayOfCommonThreeLetters[0]
            #p arrayOfCommonThreeLetters[1]
            #p arrayOfCommonThreeLetters[2]

	# this needs to be in a lower loop, after we check j for fOC?

            # then the 'source' letters
            @sourceThreeChar=threeChar.split(//)
            
	    #p @sourceThreeChar[0]
            #p @sourceThreeChar[1]
            #p @sourceThreeChar[2]

	    #p $finalOneSourceChar[1] 
	    p  "sourceThreeChar[0] is #{@sourceThreeChar[0]}"
	    @sourceThreeChar.each do |fOC|
	 	#
		# # What we're saying here is: take apart each common three-letter word,
		#  # and check to see if sourceThreeChar's current index matches it. If so, 
		#   # drop it into the new array of common three letter words against
		#    # which we're checking:
		#     # (this is a nine-charatcer check, three-by-three
		#      #  each three aOCTL gets checked against each
		#       #
		#        # This subsection checks the list of letters from the common
		#         # three letter words, and adds the word if finalOneSourceChar is one 
		#          # of the three:
		if $finalOneSourceChar == fOC
		  @arrayCmnThreeLetterWordsApproved = @arrayCmnThreeLetterWordsApproved.push(i)
            	  @firstTempString=@sourceString.gsub("#{@sourceThreeChar[0]}","#{@arrayOfCmnThreeLetterWordsApproved[0]}")
            	  @secondTempString=@firstTempString.gsub("#{@sourceThreeChar[1]}","#{@arrayOfCmnThreeLetterWordsApproved[1]}")
            	  @thirdTempString=@secondTempString.gsub("#{@sourceThreeChar[2]}","#{@arrayOfCmnThreeLetterWordsApproved[2]}")
	p "thirdTempString[0] is #{@thirdTempString[0]}"
		end
	    end



	#if @c == 38
	#then    
            #puts @firstTempString
            #puts @secondTempString
            puts @thirdTempString
	    #puts @c
	    #p "finalThreeLetterArray.count is #{$finalThreeLetterArray.count}"
            $finalThreeLetterArray = $finalThreeLetterArray.push(*@thirdTempString)
	    #puts $finalThreeLetterArray[350]
	#end 
            @c += 1
        end
        #gets
    end


    # here we initialize the 'number_of_characters' 
    # method, which is used as the main variable for new ArrayOfCharacters 
    # instances:
    def initialize(number_of_characters)
	@numchar=number_of_characters
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

$finalOneLetterArray=Array.new
$finalTwoLetterArray=Array.new
$finalThreeLetterArray=Array.new
$finalOneSourceChar=Array.new
$finalTwoChar=Array.new
# No need for $finalThreeChar, as this is
# designed to pass the prior run's captured
# letters forward, so we can merge results


# Simple creation of objects, each with an
# @numchar option at the end to describe how 
# big the 'words' should be
array_one_char = ArrayOfCharacters.new("1")
array_two_char = ArrayOfCharacters.new("2")
array_three_char = ArrayOfCharacters.new("3")

# Remember, you need to run this so that the 
# sourceorary array gets the manipulated version of
# the object. Also, from what I can tell, the
# sourceorary array needs to be a global variable,
# due to the  'minimum depth' of the assignment
# operation:
#
### Actually, I moved beyond that, to an array
### variable that holds the array processed via .array_char:
#$array_one_char_processed = array_one_char.array_char
#$array_two_char_processed = array_two_char.array_char
#$array_three_char_processed = array_three_char.array_char

#p $array_one_char.class
#p $array_one_char[0]


$twoCharArrayNew = Array.new

# In general, I find it's just easier to make a
# new array from a manipulated object, than to 
# manupulate a long dotted string-name

@arrayOneCharMid = array_one_char.array_char
p " "
p "Time to run num_single_letters:"


# This works because:
# a) the 'each' block is run against the array name @array_new, 
# which is essentially the manipulated ArrayOfCharacters instance,
# array_two_char, and 
# b) there's no need for 'yield' here; the block
# parameter 'i' gets shipped directly to the num_single_letters
# method, applied (directly to the the unmanipulated) 
# array_two_char:
#
#@arrayOneCharMid.uniq.each { |i| array_one_char.num_single_letters i }
@sourceArrayOneCharMid=ArrayOfCharacters.new("1")
@sourceArrayOneCharMid << @arrayOneCharMid[0]
@sourceArrayOneCharMid.each { |i| array_one_char.num_single_letters i }

@arrayTwoCharMid = array_two_char.array_char

# this is only a sourceorary going-forward option until
# I thoroughly work out the logic. i.e, this won't capture 
# any substitutions in regards to single character letters yet:
p " "
p "Time to run num_double_letters:"
#@arrayTwoCharMid.uniq.each { |j| array_two_char.num_double_letters j }
@sourceArrayTwoCharMid=ArrayOfCharacters.new("2")
@sourceArrayTwoCharMid << @arrayTwoCharMid[0]
@sourceArrayTwoCharMid.each { |j| array_two_char.num_double_letters j }


# BTW, we're uing 'uniq' here because we don't care about
# several identical versions of each translation
@arrayThreeCharMid = array_three_char.array_char
p " "
p "Time to run num_triple_letters:"
#@arrayThreeCharMid.uniq.each { |k| array_three_char.num_triple_letters k }
@sourceArrayThreeCharMid=ArrayOfCharacters.new("3")
@sourceArrayThreeCharMid << @arrayThreeCharMid[1]
@sourceArrayThreeCharMid.each { |k| array_three_char.num_triple_letters k }


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


# Treid TracePoint at one point, didn't find it helped all that much
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

p $finalOneSourceChar.count
p $finalTwoChar[0]
p $finalTwoChar[1]
