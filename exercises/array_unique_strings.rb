# Given an array of strings with duplicates, return an array with unique strings
# in the same order as they appear in original array.

# E.g. ['Hello', 'World', 'World', 'Awesome', 'Hello', 'Awesome']
# -> ['Hello', 'World', 'Awesome']

strings = ["1", "2", "3", "1", "3", "6", "6"]

i = 0
while i < strings.length
    j = i + 1

    while j < strings.length
        if strings[i] == strings[j]
            strings.delete_at(j)
        end

        j += 1
    end

    i += 1
end

puts strings.inspect
