# helper module is accessible from the Recettes views
module RecettesHelper
  def fill_blanks(count)
    count -= 1 if count > 0
    the_string = ''
    while count % 4 != 0
      the_string += '<td></td>'
      break if (count % 4).zero?
      count += 1
    end
    the_string
  end
end
