diamond_counter = 0
expression = "<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>"
expression.tr('.', '').tap { |expression_without_dot| while expression_without_dot.sub!(/<>/, ''); puts expression_without_dot; diamond_counter += 1; end }
puts "Was found #{diamond_counter} diamonds"
