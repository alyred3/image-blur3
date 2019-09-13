class Image
  

  def initialize image
    @image = image
  end
  
  def output_image
    @image.each do |row|
      puts row.join','
   end
  end

  def blur(distance)
    distance.times do
      blur_pixels!
    end
  end


  def blur_pixels!
    blur_pixels = []
    @image.each_with_index do |row, i|
      row.each_with_index do |x, row_i|
        blur_pixels << [i, row_i] if x==1
      end
  end

    blur_pixels.each do |pixel|
        @image[pixel[0]][pixel[1] + 1] = 1 if pixel[1] + 1 <= @image[pixel[0]].length - 1
        @image[pixel[0]][pixel[1] - 1] = 1 if pixel[1] - 1 >= 0
        @image[pixel[0] + 1][pixel[1]] = 1 if pixel[0] + 1 <= @image.length - 1
        @image[pixel[0] - 1][pixel[1]] = 1 if pixel[0] - 1 >= 0
      end
    end

end

  image = Image.new([
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
  ])


image.blur(2)
image.output_image
