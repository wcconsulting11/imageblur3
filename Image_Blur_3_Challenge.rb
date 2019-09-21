class Image
# image is 2 dimensional array
    def initialize(image)
        @image = image #assigned
        @clone = image #expected
    end

    def print
     @image.each do |arr| 
        puts arr.join("")
          # the join function is using "" to join the array within the bracket adn start a new array line
        end
        puts ""
    end
    def printclone
        @clone.each do |arr| 
            puts arr.join("")
              # the join function is using "" to join the array within the bracket adn start a new array line
            end
            puts ""
    end

    def manhattenBlur(radius)
        print
        radius.times do
            blur
        end
        print
    end
 def blur
    
          # leng of the array starts at zero, and length less than 1, stops on 3
     col=0
     row=0
    
     @image.flatten.each_with_index do |pixel,i| # indexes the position of the items, flatten makes 1 array from many
    
        if pixel==1 # if the current item is a 1 copy that to the clone at our current position.
             @clone[row][col]=1 
    if row<@image.length-1
        @clone[row+1][col]= 1 #runs from bottom up for length (0,1,2,3) then add a 1.
        end
    if row>0   
        @clone[row-1][col]= 1 #runs from top down for length (0,1,2,3) then add a 1.
    end
    if col<@image[0].length-1
        @clone[row][col+1]= 1 #runs left to right and vise versa below. 
    end
    if col>0
        @clone[row][col-1]= 1
    end
     end
     
     if row<@image.length-1 &&col==@image[0].length-1  # starts right on the last column of 1st row (position) is increment from above.
         row=row+1
         col=0
     else
         col=col+1
      end
         
 end
 end

end

image1 = Image.new([[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,0,0,0]])
        #  :Expect ([[0,0,0,0],[0,0,0,0],[0,1,0,0],[1,1,1,0],[0,1,0,0],[0,0,0,0]])

image2 = Image.new([[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,0,0,0]])
        #   :Expect ([[0,0,0,0],[0,1,0,0],[1,1,1,0],[1,1,1,1],[1,1,1,0],[0,1,0,0]])

image3 = Image.new([[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,1]])
        #  :Expect ([[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,1]])


image1.manhattenBlur(1)
image2.manhattenBlur(2)
image3.manhattenBlur(3)

