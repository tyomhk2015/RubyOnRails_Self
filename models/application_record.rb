# class _CLASS_NAME_ < _OTHER_CLASS_NAME,
# '<' means 'inherit the right class'.
# Similar to 'extends' in Java.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # This is for avoiding 'ActiveRecord' error when column name is set as 'type'.
  # https://stackoverflow.com/questions/11984893/issue-with-column-name-type-in-rails-3
  # Single Table Inheritance : https://www.freecodecamp.org/news/single-table-inheritance-vs-polymorphic-associations-in-rails-af3a07a204f2/
  self.inheritance_column = :_type_disabled
  self.inheritance_column = nil
end
