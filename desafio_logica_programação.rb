diamond_counter = 0
expression = "<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>"
expression.tr('.', '').tap { |expression_array| while expression_array.sub!(/<>/, ''); puts expression_array; diamond_counter += 1; end }
puts "Was found #{diamond_counter} diamonds"
