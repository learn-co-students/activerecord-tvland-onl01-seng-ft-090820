class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

    def full_name
        fullname = Actor.all.map {|a| a.first_name + " " + a.last_name}
        fullname.join
    end

    def list_roles
        role = self.characters.map {|c| c.name}
        show = self.shows.map {|s| s.name}
        array = role.concat(show)
        array.flatten
        array.join(" - ")
    end

end