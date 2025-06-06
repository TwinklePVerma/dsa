# Given two strings s and t, determine whether t is an anagram of s. Return true if they are anagrams, and false otherwise.
# An anagram is a word formed by rearranging the letters of another word, using all the original letters exactly once.

# Example 1:
# Input: s = "god", t = "dog"
# Output: true

# Example 2:
# Input: s = "can", t = "pan"
# Output: false

# Constraints:
# s and t consist of lowercase English letters.
# 1 <= s.length, t.length <= 4 * 10³

# Brute Force
class Solution
  def self.isAnagram(s, t)
    return false if s.length != t.length

    s.length.times do |x|
      record = []
      t.length.times do |y|
        record << (s[x] == t[y])
      end

      if record.include?(true)
        record = []
      else
        return false
      end
    end

    return true
  end
end

# Brute Force - O(n log(n))
class Solution
  def self.isAnagram(s, t)
    return false if s.length != t.length

    return s.split('').sort == t.split('').sort
  end
end

# Optimize - O(n)
class Solution
  def self.isAnagram(s, t)
    return false if s.length != t.length

    count = Hash.new(0)
    s.each_char { |ch| count[ch] += 1 }
    t.each_char { |ch| count[ch] -= 1 }

    return count.values.all?(&:zero?)
  end
end


Solution.isAnagram('god', 'dog')
