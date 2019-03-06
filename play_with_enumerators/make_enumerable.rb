# Any class can has functionality of Enumerable if:
# - Include Enumerable into class
# - Implement an each method which yeilds each value to a block of code

class Meal
  include Enumerable

  attr_accessor :appetizer, :entree, :dessert

  def initialize(appetizer, entree, dessert)
    self.appetizer = appetizer
    self.entree = entree
    self.dessert = dessert
  end

  def each
    yield appetizer
    yield entree
    yield dessert
    yield appetizer
  end
end

class Serving
  attr_accessor :name, :ingredients

  def initialize(name, ingredients)
    self.name = name
    self.ingredients = ingredients
  end

  def <=>(other)
    ingredients.size <=> other.ingredients.size
  end
end

meal = Meal.new(
  Serving.new("bruschetta", ["bread", "tomatoes", "basil"]),
  Serving.new("lasagna", ["ground beef", "tomatoes", "cheese", "pasta"]),
  Serving.new("cookie", ["flour", "sugar", "butter"])
)

p meal.map { |serving| serving.ingredients.size }
p meal.max
