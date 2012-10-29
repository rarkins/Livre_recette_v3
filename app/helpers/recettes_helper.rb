module RecettesHelper
  def fill_blanks(count)

    count -= 1
    the_string = ""
    while count % 4 != 0 do
      the_string += "<td></td>"
      if count % 4 == 0 then
      break
      end
      count += 1
    end
    return the_string

  end

end
