class StaticPagesController < ApplicationController

def home
	@animals = Animal.all
end

end