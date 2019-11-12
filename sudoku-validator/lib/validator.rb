require 'pry'

class Validator

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    @indice = 0
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    arr = @puzzle_string.gsub(/\D+/, '').split('')

    p mount_line(arr)
    p mount_column(arr)
    p mount_sub_group(arr)
  end

  def mount_line(arr)
    @indice = 0
    first = 0
    while @indice < 9
      line = arr.slice(first, 9)
      first += 9
      @indice += 1
      return p "This sudoku is invalid." if validate_elements?(line) == false
      return p "This sudoku is valid, but incomplete." if validate_if_complete?(line) == false
    end
    p "This sudoku is valid."
  end

  def mount_column(arr)
    @indice = 0
    for x in 0..9 do
      column = []
      element = x
      while @indice < 9
        column.push(arr[element])
        element += 9
        @indice += 1
      end
      @indice = 0
      return p "This sudoku is invalid." if validate_elements?(column) == false
      return p "This sudoku is valid, but incomplete." if validate_if_complete?(column) == false
    end
    p "This sudoku is valid."
  end

  def mount_sub_group(arr)
    @indice = 0
    group_number = 0
    length = 3
    while @indice < 9
     sub_group = []
     sub_indice = 0
     first = group_number
     while sub_indice < 3
       sub_group += arr.slice(first, length)
       sub_indice += 1
       first += 9
     end

     ## Não achei um jeito melhor de pular de 3 em 3 subgrupos :(
     group_number += 3
     if @indice == 2
       group_number = 27
     elsif @indice == 5
       group_number = 54
     end

     @indice += 1

     return p "This sudoku is invalid." if validate_elements?(sub_group) == false
     return p "This sudoku is valid, but incomplete." if validate_if_complete?(sub_group) == false
    end
    p "This sudoku is valid."
  end

  def validate_elements?(arr)
    arr.each do |element|
      if element != "0"
        return false if arr.count(element) > 1
      end
      true
    end
  end

  def validate_if_complete?(arr)
    return false if zero?(arr)
    true
  end

  def zero?(arr)
    arr.include? '0'
  end

end
