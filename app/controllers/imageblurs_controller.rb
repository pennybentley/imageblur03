class ImageblursController < ApplicationController

  def index
  end

end

class Image

  def initialize(array)
    @image=array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur(many=1)
    many.times do
      coords
    end
  end

  private

    def coords
      #create empty array for coordinates
      coords = []
      #loop through image to build corodinates
      # each with index loops through array 'image' with the item 'row' with it's index 'i'
      @image.each_with_index do |row, i|
        # each with index loops through array 'row' the item 'x' with it's index row_i
        row.each_with_index do |x, cell|
          # when row i and it's specific cell are = 1, place on coords array
          if x == 1
            coords << [i, cell] 
          end
        end
      end

      #using coordinates stored in coords array, update image
      coords.each do |coord|
        # check top row not on edge, update
        if coord[0] - 1 >= 0
           @image[coord[0] - 1][coord[1]] = 1 
        end
         # check bottom row not off edge, update
        if coord[0] + 1 <= @image.length - 1
            @image[coord[0] + 1][coord[1]] = 1 
        end
         # check left of cell not off near edge, update
        if coord[1] - 1 >= 0
            @image[coord[0]][coord[1] - 1] = 1 
        end
        # check right of cell not off far edge, update
        if coord[1] + 1 <= @image[coord[0]].length - 1
            @image[coord[0]][coord[1] + 1] = 1 
        end   
      end
    end

end

image = Image.new([
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
])
image.output_image
puts " "
image.blur(3)
image.output_image
