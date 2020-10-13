class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        characters.map {|character| character.actor.full_name}
    end

    def build_network(hash)
        self.network = Network.new(hash)
    end
end