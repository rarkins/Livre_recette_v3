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

  def generate_sort_link
    if params != nil then
      if params[:sort] == "creation" then
        link_to('Trier par titre', recettes_path) + " | Trier par ordre d'ajout"
      else
        raw("Trier par titre | " + link_to("Trier par ordre d'ajout", recettes_path+"?sort=creation"))
      end
    else
      raw("Trier par titre | " + link_to("Trier par ordre d'ajout", recettes_path+"?sort=creation"))
    end
  end
  
 

end
